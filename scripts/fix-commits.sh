#!/bin/bash
# Fix commit messages with conventional commit format

echo "🔧 Fixing commit messages with conventional commit format..."

# Check if we have any commits to fix
if [ $(git rev-list --count HEAD) -eq 0 ]; then
    echo "❌ No commits found to fix"
    exit 1
fi

# Get the last N commits (default 5)
N=${1:-5}
echo "📝 Will fix the last $N commits"

# Show current commit messages
echo "📋 Current commit messages:"
git log --oneline -$N

# Check if commits have been pushed more than once
REMOTE_EXISTS=$(git remote show origin 2>/dev/null | grep "Push  URL")
if [ -n "$REMOTE_EXISTS" ]; then
    echo "⚠️  Warning: Remote repository detected"
    echo "❌ Cannot safely rewrite history if commits have been pushed"
    echo "💡 Going forward, use conventional commit format:"
    echo "   feat: add new feature"
    echo "   fix: resolve bug issue"
    echo "   ci: update CI/CD configuration"
    echo "   docs: update documentation"
    echo "   chore: maintenance task"
    exit 1
fi

# If no remote or safe to rewrite
echo "✅ Safe to rewrite commit history"
echo "🔄 Rewriting last $N commits..."

# Create a list of conventional commit messages
CONVENTIONAL_COMMITS=(
    "feat: add multi-cloud infrastructure modules"
    "feat: implement CI/CD workflows for Azure, AWS, GCP"
    "feat: add environment-based deployment configuration"
    "feat: implement security scanning with tfsec and checkov"
    "feat: add drift detection workflow"
    "feat: create validation testing framework"
    "feat: add remote state backend configuration"
    "feat: implement cost estimation with Infracost"
    "docs: update README with comprehensive documentation"
    "docs: add contribution guide and quick start"
    "ci: fix GitHub Actions workflow triggers"
    "ci: update workflows to run validation on push"
    "ci: configure manual deployment workflows"
    "chore: standardize module outputs across clouds"
    "chore: add shared abstractions for naming and tagging"
    "refactor: simplify project structure"
    "style: format Terraform files consistently"
    "test: add validation tests for all modules"
)

# Function to get appropriate commit message
get_commit_message() {
    local index=$1
    if [ $index -lt ${#CONVENTIONAL_COMMITS[@]} ]; then
        echo "${CONVENTIONAL_COMMITS[$index]}"
    else
        echo "chore: update project configuration"
    fi
}

# Interactive commit message fixing
echo "🎯 Let's fix each commit message:"
COMMITS=($(git log --format="%H" -$N))

for i in "${!COMMITS[@]}"; do
    COMMIT="${COMMITS[$i]}"
    CURRENT_MSG=$(git log --format="%s" -n 1 $COMMIT)
    REVERSE_INDEX=$(((${#COMMITS[@]} - 1 - $i)))
    SUGGESTED_MSG=$(get_commit_message $REVERSE_INDEX)
    
    echo ""
    echo "Commit $((i + 1))/$N: $CURRENT_MSG"
    echo "Suggested: $SUGGESTED_MSG"
    read -p "Use suggested? (y/n/custom): " CHOICE
    
    case $CHOICE in
        y|Y)
            NEW_MSG="$SUGGESTED_MSG"
            ;;
        n|N)
            read -p "Enter custom message: " NEW_MSG
            ;;
        *)
            read -p "Enter custom message: " NEW_MSG
            ;;
    esac
    
    # Store the new message for later use
    NEW_MSGS[$i]="$NEW_MSG"
done

# Apply the fixes
echo ""
echo "🔄 Applying commit message fixes..."

# Create a temporary script for git rebase
cat > /tmp/fix-commits.sh << 'EOF'
#!/bin/bash
MSG_INDEX=$1
shift
NEW_MSGS=("$@")

# Get the current commit message
CURRENT_MSG=$(git log --format="%B" -n 1 HEAD)

# Replace with the new message
NEW_MSG="${NEW_MSGS[$MSG_INDEX]}"
git commit --amend -m "$NEW_MSG"
EOF

chmod +x /tmp/fix-commits.sh

# Perform the rebase
git rebase -i --exec "bash /tmp/fix-commits.sh $i ${NEW_MSGS[@]}" HEAD~$N

# Clean up
rm /tmp/fix-commits.sh

echo "✅ Commit messages fixed!"
echo "📋 Updated commit messages:"
git log --oneline -$N

echo ""
echo "💡 Going forward, always use conventional commit format:"
echo "   feat: add new feature"
echo "   fix: resolve bug issue" 
echo "   ci: update CI/CD configuration"
echo "   docs: update documentation"
echo "   chore: maintenance task"
