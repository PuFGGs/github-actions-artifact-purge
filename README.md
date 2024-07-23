# GitHub Actions Artifact Purge Script

This PowerShell script automates the process of purging all GitHub Actions artifacts across all repositories in a specified GitHub organization. It uses the GitHub CLI (gh) to interact with the GitHub API and perform the deletions.

## Purpose

GitHub Actions artifacts can accumulate over time, consuming storage space and potentially incurring costs. This script provides a way to bulk delete these artifacts across an entire organization, helping to manage storage and reduce associated costs.

## Requirements

- PowerShell 5.1 or later
- GitHub CLI (gh) installed and authenticated
- Appropriate permissions to access and modify repositories in the target organization

## Installation

1. Ensure PowerShell is installed on your system.
2. Install the GitHub CLI by following the instructions at: https://cli.github.com/
3. Authenticate with GitHub CLI by running:
   ```
   gh auth login
   ```
4. Save the script to a file with a .ps1 extension (e.g., `purge-artifacts.ps1`).

## Usage

1. Open PowerShell.
2. Navigate to the directory containing the script.
3. Run the script:
   ```
   .\purge-artifacts.ps1
   ```
4. When prompted, enter the name of the GitHub organization you want to process.

## What the Script Does

1. Checks if the GitHub CLI is installed and accessible.
2. Prompts for the GitHub organization name.
3. Retrieves a list of all repositories in the organization (up to 1000).
4. For each repository:
   - Lists all artifacts
   - Deletes each artifact

## Caution

- This script will delete ALL artifacts in ALL repositories of the specified organization.
- Ensure you have the necessary permissions before running the script.
- Consider the potential impact on your team's workflows before deleting artifacts.
- The script is limited to processing 1000 repositories. If your organization has more, you may need to modify the script to handle pagination.
