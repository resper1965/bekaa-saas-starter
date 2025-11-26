#!/bin/bash

# Automated daily backup

echo "💾 Daily backup started..."

# Create backup branch
backup_branch="backup/$(date +%Y%m%d-%H%M%S)"
git checkout -b $backup_branch

# Commit everything
git add -A
git commit -m "Daily backup: $(date)"

# Push backup branch
git push origin $backup_branch

# Return to main
git checkout main

echo "✅ Backup complete: $backup_branch"

