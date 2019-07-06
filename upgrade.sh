#!/bin/bash

# get the latest files
git pull origin master

# install files
. drivers/update_files.sh

