Ignore some files
=================

Exclusion patterns files
------------------------

- *Project specific* exclusion patterns should be shared in ``.gitignore`` files
- *User specific* exclusion patterns should be retained in the ``.git/info/exclude`` file

Syntax of exclusion patterns files
----------------------------------

- Blank lines are ignored
- Lines *starting* with ``#`` are ignored (used for comments)
- Directory names are ended with ``/`` (doesn't work with symbolic links)
- Globbing characters work like in Unix shells (``*``, ...)
- When a ``!`` starts a line, the meaning of its pattern is inverted (i.e. files are explicitly kept instead of being explicitly ignored)
