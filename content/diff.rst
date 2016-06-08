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
