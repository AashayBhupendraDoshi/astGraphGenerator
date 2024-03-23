#!/bin/bash

# Define paths
build_folder="./parsers/build"
vendors_folder="./parsers/vendors"

# Repositories to clone
declare -a repos=(
"https://github.com/tree-sitter/tree-sitter-go"
"https://github.com/tree-sitter/tree-sitter-python"
"https://github.com/tree-sitter/tree-sitter-bash"
# "https://github.com/tree-sitter/tree-sitter-yaml"
"https://github.com/tree-sitter/tree-sitter-json"
)

# Function to check and create folder if not exists
check_create_folder() {
    local folder_path="$1"
    if [ ! -d "$folder_path" ]; then
        echo "Creating folder: $folder_path"
        mkdir -p "$folder_path"
    else
        echo "Folder already exists: $folder_path"
    fi
}

# Check and create build folder
check_create_folder "$build_folder"

# Check and create vendors folder
check_create_folder "$vendors_folder"

# Function to clone repositories
clone_repo() {
    local repo_url="$1"
    local folder_name=$(basename "$repo_url")
    local clone_path="$vendors_folder/$folder_name"

    if [ ! -d "$clone_path" ]; then
        echo "Cloning repository: $repo_url into $clone_path"
        git clone "$repo_url" "$clone_path"
    else
        echo "Repository already cloned: $folder_name"
    fi
}

# Clone repositories
for repo in "${repos[@]}"; do
    clone_repo "$repo"
done

echo "All operations completed successfully."