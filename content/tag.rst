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
