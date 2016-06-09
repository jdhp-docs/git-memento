Logging
=======

Show all commits
----------------

::

    git log

List the changes during the last two weeks
------------------------------------------

::

    git log --since="2 weeks ago"

List the changes made on a given file
-------------------------------------

::

    git log FILE_PATH

List the changes made on files contained in a given directory
-------------------------------------------------------------

::

    git log DIRECTORY_PATH

List the changes containing a given string pattern
--------------------------------------------------

List the commits where the "foo()" string has been added or deleted::

    git log -S'foo()'

