Plumbing commands
=================

Show the content of a commit
----------------------------

::

    git show COMMIT_ID

Show the content of a file in the current branch
------------------------------------------------

::

    git show :FILE_PATH

Examples::

    git show :README.rst
    git show :content/introduction.rst

Show the content of a file in a given branch
--------------------------------------------

Show the content of the FILE_PATH file in the BRANCH_NAME branch::

    git show BRANCH_NAME:FILE_PATH

Examples::

    git show experimental:README.rst
    git show experimental:content/introduction.rst

Show the content of a file in a given branch of a given remote
--------------------------------------------------------------

Show the content of the FILE_PATH file in the BRANCH_NAME branch of REMOTE_NAME remote::

    git show REMOTE_NAME/BRANCH_NAME:FILE_PATH

Examples::

    git show origin/experimental:README.rst
    git show origin/experimental:content/introduction.rst

Extract the content of a file in a given branch of a given remote
-----------------------------------------------------------------

::

    git show REMOTE_NAME/BRANCH_NAME:FILE_PATH > OUTPUT_FILE

Examples::

    git show origin/experimental:README.rst > /tmp/README.rst
    git show origin/experimental:content/introduction.rst > introcution.old.rst

Show the content of a file at a time point of the current branch
----------------------------------------------------------------

::

    git show COMMIT_ID:FILE_PATH

Examples::

    git show HEAD^:README.rst
    git show HEAD^:content/introduction.rst

Extract the content of a file at a time point of the current branch
-------------------------------------------------------------------

::

    git show COMMIT_ID:FILE_PATH > OUTPUT_FILE

Examples::

    git show HEAD^:README.rst > /tmp/README.rst
    git show HEAD^:content/introduction.rst > introcution.old.rst

Show the type (blob, tree, commit or tag) of a git object
---------------------------------------------------------

::

    git cat-file -t OBJECT_ID

Examples::

    git cat-file -t 33f4ea63
    git cat-file -t HEAD
