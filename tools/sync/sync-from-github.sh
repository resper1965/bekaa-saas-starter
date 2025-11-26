#!/bin/bash

# Pull remote changes from GitHub to local WSL

echo "🔄 Syncing from GitHub to local..."

# Stash local changes
if [[ $(git status --porcelain) ]]; then
    echo "💾 Stashing local changes..."
    git stash
fi

# Pull from GitHub
git pull origin main

# Pop stash if exists
if git stash list | grep -q "stash@{0}"; then
    echo "📦 Restoring stashed changes..."
    git stash pop
fi

# Install dependencies if needed
if [[ $(git diff HEAD@{1} HEAD --name-only | grep -E "package.json|poetry.lock") ]]; then
    echo "📦 Installing dependencies..."
    pnpm install
    cd apps/scripts/rag-service && poetry install && cd -
fi

echo "✅ Synced from GitHub"

