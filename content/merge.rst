Merge
=====

Merge a given local branch in the current branch
------------------------------------------------

::

    git merge LOCAL_BRANCH_NAME

Example::

    git merge experimental

Merge a given remote branch in the current branch
-------------------------------------------------

::

    git merge REMOTE/REMOTE_BRANCH_NAME

Example::

    git merge upstream/master

Reset the working tree to the state it was before an uncommitted merge (with conflicts)
---------------------------------------------------------------------------------------

::

    git merge --abort

TODO...
-------

::

    git merge -s ours BRANCH_NAME

Example::

    git merge -s ours experimental

TODO...
-------

::

    git merge -s recursive -X theirs BRANCH_NAME

Example::

    git merge -s recursive -X theirs experimental
