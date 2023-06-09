#!/bin/bash

if [ $# != 2 ]; then
    echo "Usage: $0 <PR number> <branch name>"
    exit 1;
fi

pr_number=$1
branch_name=$2

git fetch origin pull/${pr_number}/head:${branch_name}

