Patches
=======

Create a patch of current changes
---------------------------------

::

    git diff > FILE_NAME

Example::

    git diff > foo.patch

Create a patch of changes introduced by a commit (without commit metadata)
--------------------------------------------------------------------------

::

    git diff COMMIT_ID~ COMMIT_ID > FILE_NAME

or

::

    git show COMMIT_ID > FILE_NAME

Example::

    git diff ff6876ef~ ff6876ef > foo.patch

Create a patch of changes between 2 commits (without commit metadata)
---------------------------------------------------------------------

::

    git diff COMMIT_ID1 COMMIT_ID2 > FILE_NAME

Example::

    git diff ff6876ef efe57652a > foo.patch

Apply a patch (without commit metadata)
---------------------------------------

::

    git apply FILE_NAME

Example::

    git apply foo.patch

Create a patch of changes introduced by a commit (with commit metadata)
-----------------------------------------------------------------------

.. TODO

::

    git format-patch ... TODO

Example::

    TODO

Apply a patch (with commit metadata)
------------------------------------

.. TODO

::

    git am ... TODO

Example::

    TODO

