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

::
    # Rename the local branch to the new name
    git branch -m <OLD_NAME> <NEW_NAME>

    # Delete the old branch on remote - where <REMOTE> is, for example, origin
    git push <REMOTE> --delete <OLD_NAME>

    # Prevent git from using the old name when pushing in the next step.
    # Otherwise, git will use the old upstream name instead of <NEW_NAME>.
    git branch --unset-upstream <NEW_NAME>

    # Push the new branch to remote
    git push <REMOTE> <NEW_NAME>

    # Reset the upstream branch for the NEW_NAME local branch
    git push <REMOTE> -u <NEW_NAME>

Source: https://stackoverflow.com/a/30590238

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


Archive a branch on GitLab
--------------------------

With the following procedure, the branch is archived as a tag and no longer clutters the 'branches' page on GitLab.
It's still possible to access or reopen the branch from the tag at a later time.

To archive the branch::

    # Switch to the main branch
    git checkout master

    # Create a *tag* to keep all the commits of the branch you want to archive
    git tag -a archive/<BRANCH_NAME> -m "Archiving the branch <BRANCH_NAME>" <BRANCH_NAME>

    # Push the tag to GitLab
    git push --tags

    # Delete the branch to be archived (locally)
    git branch -D <BRANCH_NAME>

    # Delete the branch to be archived (on GitLab)
    git push origin --delete <BRANCH_NAME>

    # Verify the result
    git branch -a

    # The branch is no longer on the GitLab branches page but remains visible on the GitLab tags page

To restore the branch::

    # Create a new branch from the "archive/<BRANCH_NAME>" tag
    git checkout -b <BRANCH_NAME> archive/<BRANCH_NAME>

    # Push the branch to GitLab
    git push origin <BRANCH_NAME>

    # The branch is now available again on the GitLab branches page


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

Remove the upstream information for a given branch
--------------------------------------------------

To remove the upstream information for ``LOCAL_BRANCH_NAME`` (i.e. the default
remote to use with ``git pull`` and ``git push``)::

    git branch --unset-upstream LOCAL_BRANCH_NAME

If no branch is specified it defaults to the current branch.

Check the result with::

    git branch -vv

.. http://stackoverflow.com/questions/12913988/opposite-of-git-branch-set-upstream

