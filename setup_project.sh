#!/bin/bash

# Function to create a directory if it doesn't already exist
create_dir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Created directory: $1"
  else
    echo "Directory already exists: $1"
  fi
}

# Function to create a file if it doesn't already exist
create_file() {
  if [ ! -f "$1" ]; then
    touch "$1"
    echo "Created file: $1"
  else
    echo "File already exists: $1"
  fi
}

# Main project setup
setup_project() {
  project_name=$1

  # Create main project directory
  create_dir "$project_name"

  # Create subdirectories
  create_dir "$project_name/src"
  create_dir "$project_name/tests"
  create_dir "$project_name/docs"
  create_dir "$project_name/config"

  # Create common files
  create_file "$project_name/README.md"
  create_file "$project_name/.gitignore"
  create_file "$project_name/src/main.py"
  create_file "$project_name/tests/test_main.py"
  create_file "$project_name/config/config.yml"

  # Optional: Initialize a git repository
  if [ "$2" == "init-git" ]; then
    cd "$project_name"
    git init
    echo "Initialized empty Git repository in $(pwd)/.git/"
    cd ..
  fi

  echo "Project setup complete!"
}

# Check for project name argument
if [ -z "$1" ]; then
  echo "Usage: $0 <project_name> [init-git]"
  exit 1
else
  setup_project "$1" "$2"
fi