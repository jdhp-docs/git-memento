#!/bin/sh

# Copyright (c) 2016 Jérémie DECOCK (http://www.jdhp.org)

./clean.sh

# Make the submodule ##########################################################

mkdir working_dir_sub-module

cd working_dir_sub-module

cat << 'EOF' > a_submodule_file.txt
Hello from the sub-module!
EOF

git init
git add .

git commit -m "Initial commit"

# Make the main project #######################################################

cd ..

mkdir working_dir_main-project

cd working_dir_main-project

cat << 'EOF' > a_main_project_file.txt
Hello from the main project!
EOF

git init
git add .

git commit -m "Initial commit"

git clone ../working_dir_sub-module my_sub-module

# ./my_sub-module/.git already exists thus git knows to create a gitlink to it.
# Warning: don't write "git add my_sub-module/" !
git add my_sub-module

git commit -m "Import the sub-module."

# Print info...
git ls-tree HEAD

# Clone the main project with the submodule ###################################

cd ..

git clone ./working_dir_main-project ./working_dir_main-project_clone

cd ./working_dir_main-project_clone

# Print info...
git ls-tree HEAD

tree

git status 

echo "./working_dir_main-project_clone/my_sub-module is empty."

echo "Lets fill ./working_dir_main-project_clone/my_sub-module..."

echo "But first, git-submodule needs the .gitmodules file to know where to find the submodule repository."
echo "Lets make this file with ''git submodule add''."
#git submodule add ../working_dir_sub-module/.git my_sub-module
git submodule add ../working_dir_sub-module/.git my_sub-module

cat .gitmodules

echo "Then lets copy .gitmodules file into .git/config with ''git submodule init''."
git submodule init

cat .git/config

echo "Finally lets fill ./working_dir_main-project_clone/my_sub-module with ''git submodule init''."
git submodule update

ls -la

###############################################################################


cd ..

#tree
#tree -a
