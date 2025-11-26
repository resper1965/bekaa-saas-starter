#!/bin/bash

# Push local WSL changes to GitHub

echo "🔄 Syncing local changes to GitHub..."

# Check for uncommitted changes
if [[ $(git status --porcelain) ]]; then
    echo "📝 Found local changes"
    
    # Show changes
    git status
    
    # Ask for commit message
    read -p "Commit message: " msg
    
    # Commit and push
    git add .
    git commit -m "$msg"
    git push origin main
    
    echo "✅ Changes pushed to GitHub"
else
    echo "✨ No changes to sync"
fi

