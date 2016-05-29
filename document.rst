.. -*- coding: utf-8 -*-

===========
Git Memento
===========

:Author: Jérémie Decock
:Contact: jd.jdhp@gmail.com
:Revision: 0.1
:Date: 20/05/2016
:Licence: |CC BY-SA 4.0|_

.. ............................................................................

.. http://docutils.sourceforge.net/docs/ref/rst/directives.html#meta

.. meta::
    :author: Jérémie DECOCK
    :description: A git memento
    :keywords: git, github
    :copyright: Copyright (c) 2016 Jérémie DECOCK

.. ............................................................................

.. http://docutils.sourceforge.net/docs/ref/rst/directives.html#automatic-section-numbering

.. sectnum::

.. ............................................................................

.. raw:: latex

    \newpage

.. ............................................................................

.. http://docutils.sourceforge.net/docs/ref/rst/directives.html#table-of-contents

.. contents:: Table of Contents

.. ............................................................................

.. Break the page for rst2pdf

.. raw:: pdf

    PageBreak


.. Example:
.. git checkout english-version
.. ...
.. git add .
.. git commit -m "..."
.. git push origin english-version
.. git checkout master
.. git merge english-version
.. git push


Setup Git
=========

User information::

    git config --global user.name "Jeremie DECOCK"
    git config --global user.email "jd.jdhp@gmail.com"

Setup push.default (see http://stackoverflow.com/questions/23918062/simple-vs-current-push-default-in-git-for-decentralized-workflow)::

    git config --global push.default simple

Setup colors::

    git config --global color.branch auto
    git config --global color.diff auto
    git config --global color.grep auto
    git config --global color.interactive auto
    git config --global color.status auto

Some useful aliases::

    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.st status
    git config --global alias.br branch
    git config --global alias.unstage "reset HEAD --"
    git config --global alias.graph "log --oneline --decorate --graph --all"

Add a GPG key (see https://help.github.com/articles/telling-git-about-your-gpg-key/ and https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work ; for GitHub users see https://github.com/blog/2144-gpg-signature-verification)::

    git config --global user.signingkey PUBLIC_KEY_ID


Viewing difference
==================

.. TODO: improve the following title

Show changes in the working tree that haven't been staged or committed yet
--------------------------------------------------------------------------

::

    git diff

.. TODO: improve the following title

Show changes in the working tree that have been staged
------------------------------------------------------

::

    git diff --cached

.. TODO: improve the following title

Show changes between the working tree (staged or not) and the repository
------------------------------------------------------------------------

::

    git diff HEAD

.. TODO: improve the following title

Show changes between two given commits, tags, branches, trees or blobs
----------------------------------------------------------------------

::

    git diff A B

or::

    git diff A..B

where ``A`` and ``B`` can be *commits*, *tags*, *branches*, *trees* or *blobs*.

Example::

    git diff ff20b..ea76d
    git diff v1..v2
    git diff master..expermiental

Show changes between B and the first common ancestor of A and B
---------------------------------------------------------------

::

    git diff A...B

Remotes
=======

Clone a remote repository
-------------------------

::

    git clone REMOTE [LOCAL_DIRECTORY]

Example::

    git clone https://github.com/jdhp-docs/git-memento.git

Only the ``master`` branch is available in the local repository.
To get other branches from the remote repository see get_remote_branch_.


Tags
====

Create a lightweight tag
------------------------

::

    git tag TAG_NAME [SHA1]

Example::

    git tag v1.4


Create an annotated tag
-----------------------

::

    git tag -a TAG_NAME -m "MESSAGE" [SHA1]

where ``-a`` means *annotated*.

Example::

    git tag -a v1.4 -m "My version 1.4"


List local tags
---------------

::

    git tag

or

::

    git tag -l


List remote tags
----------------

::

    git ls-remote --tags REMOTE

Example::

    git ls-remote --tags origin

.. http://stackoverflow.com/questions/6294224/check-if-pushed-tag-is-on-the-git-remote

Push an annotated tag to a remote repository
--------------------------------------------

::

    git push REMOTE TAG_NAME

Example::

    git push origin v1.4

Push all tags to a remote repository
------------------------------------

::

    git push --tags

or

::

    git push --follow-tags

The latter is safer but anyway, it's generally considered a bad practice to
push *all* tags automatically with these two commands. Be sure you're not
pushing unwanded tags.


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


Get a graphical representation of all branches (local and remote branches)
--------------------------------------------------------------------------

::

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


.. ............................................................................

.. Break the page for rst2pdf

.. raw:: pdf

    PageBreak

.. Break the page for Latex

.. raw:: latex

    \newpage

License
=======

|CC BY-SA 4.0 image|_

*Git Memento*
written by `Jérémie Decock`_
is provided under the terms and conditions of the |CC BY-SA 4.0|_ license.

.. ............................................................................

.. _Git Memento: http://www.jdhp.org/tutorials_en.html#git-memento
.. _Jérémie Decock: http://www.jdhp.org/

.. |CC BY-SA 4.0| replace:: Creative Commons 4.0 (CC BY-SA 4.0)
.. _CC BY-SA 4.0: http://creativecommons.org/licenses/by-sa/4.0/

.. |CC BY-SA 4.0 image| image:: ./images/cc_by_sa_80x15.png
.. _CC BY-SA 4.0 image: http://creativecommons.org/licenses/by-sa/4.0/
