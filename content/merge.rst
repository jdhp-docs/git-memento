Merge
=====

Some definitions
----------------

*Merge commit*
    A commit having more than one parent.

*Octopus merge*
    A merge where more than two branches are involved (rarely used in practice).

When does a merge occurs ?
--------------------------

Either:

- explicitly with the ``git merge`` command;
- or implicitly with the ``git pull`` command.

Merge a given local branch in the current branch
------------------------------------------------

::

    git merge LOCAL_BRANCH_NAME

Example:

.. image:: ./images/gitdags/merging_1.png
   :alt: Merging 1

::

    git checkout master
    git merge experimental

.. image:: ./images/gitdags/merging_2.png
   :alt: Merging 2

Merge a given remote branch in the current branch
-------------------------------------------------

::

    git merge REMOTE/REMOTE_BRANCH_NAME

Example::

    git merge upstream/master

Cancel an uncommited merge
--------------------------

To reset the working tree to the state it was before an uncommitted merge (e.g.
when there are conflicts)::

    git merge --abort

Show conflicts (if there are any)
---------------------------------

Get the list of files with unresolved conflicts::

    git status

Get the details of unresolved conflicts::

    git diff

Solve conflicts manually (if there are any)
-------------------------------------------

Once you have edited the files to resolve the conflict::

    git add FILE_NAME1 [FILE_NAME2 ...]

Then check all conflicts are solved::

    git status

Finally make the merge commit::

    git commit

It's recommended to keep the default commit message.


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

