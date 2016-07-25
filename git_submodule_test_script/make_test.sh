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

git submodule add ../working_dir_sub-module/.git my_sub-module

git commit -m "Add submodule"

## Print info...
#git ls-tree HEAD

# Clone the main project with the submodule ###################################

cd ..

git clone ./working_dir_main-project ./working_dir_main-project_clone

cd ./working_dir_main-project_clone

## Print info...
#git ls-tree HEAD

tree

git submodule init

tree

git submodule update

tree

###############################################################################


cd ..

#tree
#tree -a
