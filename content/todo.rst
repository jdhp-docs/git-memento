General concepts
================

Two primary data structures:

- *object store*
- *index*

Four types of objects:

- *Blobs*
- *Trees*
- *Commits*
- *Tags*

Voc:

- git's *plumbing* commands: low-level commands (for debug)
- git's *porcelain* commands: high-level commands (for users)

Files status:

- *Tracked*: files already in the repository or staged in the index
- *Ignored*: explicitly ignored (.gitignore, ...)
- *Untracked*: files that are neither tracked or ignored

Voc:

- *staged* files: files that have been added in the *index* with the ``git add`` command

Voc:

- *refs*: ...
- *symrefs*: ...

Plumbing commands
=================

Show the content of a commit::

    git show SHA

Show the content of a file in the master (or current ???) branch::

    git show :FILE

Show the content of a file in the BRANCH_NAME branch::

    git show BRANCH_NAME:FILE

???::

    git show-branch --more=10

???::

    git cat-file -p SHA

List files in the index::

    git ls-file -s

???::

    git write-tree

???::

    git commit-tree SHA

Get the SHA corresponding to the tag named TAG_NAME::

    git rev-parse TAG_NAME

Compute and print the SHA of a new file::

    git hash-object FILE

Translate any form of commit name (tag, relative, shordened, absolute) the actual SHA::

    git rev-parse COMMIT_NAME
