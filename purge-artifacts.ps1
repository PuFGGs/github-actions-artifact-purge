if (!(Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error "GitHub CLI (gh) is not installed or not in PATH. Please install it and try again."
    exit 1
}

$orgName = Read-Host -Prompt "Enter the GitHub organization/account name"

$repos = gh repo list $orgName --limit 1000 --json name --jq '.[].name'

foreach ($repo in $repos) {
    Write-Host "Processing repository: $repo"
    
    $artifacts = gh api "/repos/$orgName/$repo/actions/artifacts" --jq '.artifacts[].id'
    
    foreach ($artifactId in $artifacts) {
        Write-Host "  Deleting artifact ID: $artifactId"
        
        gh api -X DELETE "/repos/$orgName/$repo/actions/artifacts/$artifactId"
    }
}

Write-Host "Artifact purge complete for all repositories in $orgName organization."
