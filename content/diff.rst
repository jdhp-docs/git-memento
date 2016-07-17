Viewing difference
==================

.. TODO: improve the following title

Show changes in the working tree
--------------------------------

Show changes in the working tree that haven't been staged or committed yet::

    git diff

Show changes in the working tree that have been staged::

    git diff --cached

Show changes between the working tree (staged or not) and the repository::

    git diff HEAD

.. TODO: improve the following title

Show changes between two git objects
------------------------------------

Show changes between two given *commits*, *tags*, *branches*, *trees* or *blobs*::

    git diff A B

or::

    git diff A..B

where ``A`` and ``B`` can be *commits*, *tags*, *branches*, *trees* or *blobs*.

Note that ``A`` is supposed to be older than ``B`` as what is shown is
the modification applied to go from ``A`` to ``B``.
If you reverse the order of ``A`` and ``B``, addition lines (``+``)
will become deletion lines (``-``) and vice versa.

You can also use::

    git diff A B FILENAME1 [FILENAME2 ...]

or::

    git diff A..B FILENAME1 [FILENAME2 ...]

or::

    git diff A B -- FILENAME1 [FILENAME2 ...]

or::

    git diff A..B -- FILENAME1 [FILENAME2 ...]

to get differences from ``A`` to ``B`` for specific files or directories ``FILENAME1``, ``FILENAME2``, ...

The ``--`` notation is only required the files you want to compare have strange
names like "-f".

Also note that ``FILENAME1``, ``FILENAME2``, ... have to be paths relative to the current working
directory. Paths relative to the root of the repository won't work.

To compare a git object ``A`` to ``HEAD``, simply use::

    git diff A

Example::

    git diff ff20b..ea76d ./src/main.c
    git diff ff20b..ea76d
    git diff v1..v2
    git diff v1..v2 ./src/
    git diff master..expermiental
    git diff master..expermiental ./src/main.c ./Makefile

Show changes between two commits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    git diff COMMIT1 COMMIT2

or::

    git diff COMMIT1..COMMIT2

.. where ``COMMIT1`` is supposed to be older than ``COMMIT2`` as what is shown is
.. the modification applied to go from ``COMMIT1`` to ``COMMIT2``.
.. If you reverse the order of ``COMMIT1`` and ``COMMIT2``, addition lines (``+``)
.. will become deletion lines (``-``) and vice versa.

Examples::

    git diff a80b0d8 04079b1
    git diff a80b0d8..04079b1

Show changes between two commits for a given file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    git diff COMMIT1 COMMIT2 FILENAME1 [FILENAME2 ...]

or::

    git diff COMMIT1 COMMIT2 -- FILENAME1 [FILENAME2 ...]

or::

    git diff COMMIT1..COMMIT2 FILENAME1 [FILENAME2 ...]

or::

    git diff COMMIT1..COMMIT2 -- FILENAME1 [FILENAME2 ...]

where ``FILENAME1``, ``FILENAME2``, ... are file paths or directory paths
relative to the current working directory.

.. and where ``COMMIT1`` is supposed to be older than ``COMMIT2``.
.. Note what is shown is the modification applied to go from ``COMMIT1`` to
.. ``COMMIT2``.
.. If you reverse the order of ``COMMIT1`` and ``COMMIT2``, addition lines (``+``)
.. will become deletion lines (``-``) and vice versa.
.. 
.. The ``--`` notation is only required the files you want to compare have strange
.. names like "-f".
.. 
.. Also note that ``FILENAME1``, ``FILENAME2``, ... have to be paths relative to the current working
.. directory. Paths relative to the root of the repository won't work.

Examples::

    git diff a80b0d8 04079b1 ./src/main.c
    git diff a80b0d8 04079b1 ./src/main.c ./Makefile
    git diff a80b0d8 04079b1 ./src/
    git diff a80b0d8..04079b1 ./src/main.c
    git diff a80b0d8..04079b1 -- ./src/main.c

.. See: http://stackoverflow.com/questions/3338126/how-to-diff-the-same-file-between-two-different-commits-on-the-same-branch

Show changes between two tags
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    git diff TAGNAME1 TAGNAME2

or::

    git diff TAGNAME1..TAGNAME2

.. where ``TAGNAME1`` is supposed to be older than ``TAGNAME2`` as what is shown is
.. the modification applied to go from ``TAGNAME1`` to ``TAGNAME2``.
.. If you reverse the order of ``TAGNAME1`` and ``TAGNAME2``, addition lines (``+``)
.. will become deletion lines (``-``) and vice versa.

Examples::

    git diff v1.0 v2.0
    git diff v1.0..v2.0

.. See http://stackoverflow.com/questions/3211809/git-diff-between-given-two-tags

Show changes between two tags for a given file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    git diff TAGNAME1 TAGNAME2 FILENAME1 [FILENAME2 ...]

or::

    git diff TAGNAME1 TAGNAME2 -- FILENAME1 [FILENAME2 ...]

or::

    git diff TAGNAME1..TAGNAME2 FILENAME1 [FILENAME2 ...]

or::

    git diff TAGNAME1..TAGNAME2 -- FILENAME1 [FILENAME2 ...]

where ``FILENAME1``, ``FILENAME2``, ... are file paths or directory paths
relative to the current working directory.

.. where ``FILENAME1``, ``FILENAME2``, ... are file paths or directory paths
.. and where ``TAGNAME1`` is supposed to be older than ``TAGNAME2``.
.. Note that what is shown is the modification applied to go from ``TAGNAME1`` to
.. ``TAGNAME2``.
.. If you reverse the order of ``TAGNAME1`` and ``TAGNAME2``, addition lines (``+``)
.. will become deletion lines (``-``) and vice versa.
.. 
.. The ``--`` notation is only required the files you want to compare have strange
.. names like "-f".
.. 
.. Also note that ``FILENAME1``, ``FILENAME2``, ... have to be paths relative to the current working
.. directory. Paths relative to the root of the repository won't work.

Examples::

    git diff a80b0d8 04079b1 ./src/main.c
    git diff a80b0d8 04079b1 ./src/main.c ./Makefile
    git diff a80b0d8 04079b1 ./src/
    git diff a80b0d8..04079b1 ./src/main.c
    git diff a80b0d8..04079b1 -- ./src/main.c

.. See http://stackoverflow.com/questions/3211809/git-diff-between-given-two-tags

Show changes between two branches (local or remote)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    git diff BRANCH1 BRANCH2

or::

    git diff BRANCH1..BRANCH2

or with remote branches::

    git diff [REMOTENAME1/]BRANCH1 [REMOTENAME2/]BRANCH2

or::

    git diff [REMOTENAME1/]BRANCH1..[REMOTENAME2/]BRANCH2

.. Again, ``BRANCH1`` is supposed to be "older" than ``BRANCH2`` as what is shown is
.. the modification applied to go from ``BRANCH1`` to ``BRANCH2``.
.. If you reverse the order of ``BRANCH1`` and ``BRANCH2``, addition lines (``+``)
.. will become deletion lines (``-``) and vice versa.

Examples::

    git diff bugfix
    git diff master bugfix
    git diff master..bugfix
    git diff upstream/master bugfix
    git diff upstream/master..origin/master

Show changes between two branches (local or remote) for a given file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    git diff BRANCH1 BRANCH2 FILENAME1 [FILENAME2 ...]

or::

    git diff BRANCH1 BRANCH2 -- FILENAME1 [FILENAME2 ...]

or::

    git diff BRANCH1..BRANCH2 FILENAME1 [FILENAME2 ...]

or::

    git diff BRANCH1..BRANCH2 -- FILENAME1 [FILENAME2 ...]

or with remote branches::

    git diff [REMOTENAME1/]BRANCH1 [REMOTENAME2/]BRANCH2 FILENAME1 [FILENAME2 ...]

or::

    git diff [REMOTENAME1/]BRANCH1 [REMOTENAME2/]BRANCH2 -- FILENAME1 [FILENAME2 ...]

or::

    git diff [REMOTENAME1/]BRANCH1..[REMOTENAME2/]BRANCH2 FILENAME1 [FILENAME2 ...]

or::

    git diff [REMOTENAME1/]BRANCH1..[REMOTENAME2/]BRANCH2 -- FILENAME1 [FILENAME2 ...]

where ``FILENAME1``, ``FILENAME2``, ... are file paths or directory paths
relative to the current working directory.

.. Note that ``FILENAME1``, ``FILENAME2``, ... are file paths or directory paths.
.. Again ``BRANCH1`` is supposed to be older than ``BRANCH2``.
.. Note what is shown is the modification applied to go from ``BRANCH1`` to
.. ``BRANCH2``.
.. If you reverse the order of ``BRANCH1`` and ``BRANCH2``, addition lines (``+``)
.. will become deletion lines (``-``) and vice versa.
.. 
.. The ``--`` notation is only required the files you want to compare have strange
.. names like "-f".
.. 
.. Also note that ``FILENAME1``, ``FILENAME2``, ... have to be paths relative to the current working
.. directory. Paths relative to the root of the repository won't work.

Examples::

    git diff bugfix
    git diff master bugfix
    git diff master..bugfix
    git diff upstream/master bugfix
    git diff upstream/master..origin/master

    git diff bugfix ./src/main.c
    git diff master bugfix ./src/main.c ./Makefile
    git diff master..bugfix ./src/
    git diff upstream/master bugfix ./src/main.c
    git diff upstream/master..origin/master -- ./src/main.c

Show changes with the first common ancestor of two objects
----------------------------------------------------------

Show changes between B and the first common ancestor of A and B::

    git diff A...B

