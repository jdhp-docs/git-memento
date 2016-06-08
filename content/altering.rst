Altering commits
================

Warning
-------

Do not alter commits that have been shared with other users (e.g. pushed, pulled or cloned) !

.. TODO

Revert *HEAD* to a known commit
-------------------------------

::

    git reset --soft COMMIT_ID

.. TODO

Revert *HEAD* and *index* to a known commit
-------------------------------------------

::

    git reset --mixed COMMIT_ID

or simply::

    git reset COMMIT_ID

.. TODO

Revert *HEAD*, *index* and the *working directory* to a known commit
--------------------------------------------------------------------

::

    git reset --hard COMMIT_ID

.. TODO

Rebase
------

.. See: https://git-scm.com/book/en/v2/Git-Branching-Rebasing

.. TODO: add graphs like in https://git-scm.com/book/en/v2/Git-Branching-Rebasing

Take all the changes that were committed on one branch and replay them on another one::

    git checkout SOURCE_BRANCH_NAME
    git rebase DESTINATION_BRANCH_NAME

Then you can go back to the ``DESTINATION_BRANCH_NAME`` branch and do a fast-forward merge::

    git checkout DESTINATION_BRANCH_NAME
    git merge SOURCE_BRANCH_NAME

Example:

.. image:: ./images/gitdags/rebasing_1.png
   :alt: Rebasing 1

::

    git checkout experimental
    git rebase master

.. image:: ./images/gitdags/rebasing_2.png
   :alt: Rebasing 2

::

    git checkout master
    git merge experimental

.. image:: ./images/gitdags/rebasing_3.png
   :alt: Rebasing 3
