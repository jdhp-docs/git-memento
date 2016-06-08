Branches
========

Create a local branch
---------------------

::

    git branch BRANCH_NAME

Example::

    git branch experimental

Change the current branch
-------------------------

::

    git checkout BRANCH_NAME

Example::

    git checkout experimental

Create a local branch and switch to it
--------------------------------------

::

    git checkout -b BRANCH_NAME

This is shorthand for::

    git branch BRANCH_NAME
    git checkout BRANCH_NAME

Example::

    git checkout -b experimental

List local branches
-------------------

::

    git branch

The current branch is the starred one.

Rename a local branch
---------------------

To rename any local branch::

    git branch -m OLD_NAME NEW_NAME

Example::

    git branch -m experimental testing

To rename the current branch::

    git branch -m NEW_NAME

Example::

    git branch testing

Delete a local branch
---------------------

.. TODO

For branches merged with the current branch::

    git branch -d BRANCH_NAME

Example::

    git branch -d experimental

For branches not merged with the current branch (dangerous)::

    git branch -D BRANCH_NAME

Example::

    git branch -D experimental

List remote branches
--------------------

::

    git branch -a REMOTE

Example::

    git branch -a origin

.. http://stackoverflow.com/questions/67699/clone-all-remote-branches-with-git

Rename a remote branch
----------------------

TODO

.. http://stackoverflow.com/questions/4753888/git-renaming-branches-remotely

Delete a remote branch
----------------------

.. TODO

For branches merged with the current branch::

    git push REMOTE --delete BRANCH_NAME

or::

    git push REMOTE :<BRANCH_NAME>

Example::

    git push origin --delete experimental

.. https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches#Deleting-Remote-Branches
.. http://stackoverflow.com/questions/2003505/delete-a-git-branch-both-locally-and-remotely


Get a graphical representation of all branches (local + remote)
-----------------------------------------------------------------

Get a graphical representation of all branches (local and remote)::

    git log --oneline --decorate --graph --all

or::

    gitk --all


Push a local branche to a remote repository
-------------------------------------------

::

    git checkout LOCAL_BRANCH_NAME
    git push REMOTE REMOTE_BRANCH_NAME

Example::

    git checkout experimental
    git push origin experimental

.. TODO: define what is an upstream...

To automatically set ``REMOTE REMOTE_BRANCH_NAME`` as *upstream* for the
current local branch (check the difference with ``git branch -vva``)::

    git checkout LOCAL_BRANCH_NAME
    git push -u REMOTE REMOTE_BRANCH_NAME

Once upstream is set for the current local branch, there is no need to specify
``REMOTE_BRANCH_NAME`` for a ``git push``/``git push``::

    git push REMOTE

Example::

    git checkout experimental
    git push -u origin experimental
    ...
    git push origin


.. _get_remote_branch:

Get a given branche from a cloned remote repository
---------------------------------------------------

::

    git checkout -b LOCAL_BRANCH_NAME REMOTE/REMOTE_BRANCH_NAME

Example::

    git checkout -b experimental origin/experimental

.. http://stackoverflow.com/questions/67699/clone-all-remote-branches-with-git
