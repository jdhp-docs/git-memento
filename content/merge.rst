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

Get the list of files with unresolved conflicts after a ``git merge`` or ``git pull``::

    git status

Get the details of unresolved conflicts::

    git diff

Solve conflicts manually
------------------------

Get the list of files with unresolved conflicts after a ``git merge`` or ``git pull``::

    git status

Edit these files to solve conflicts.

Once you have solve conflicts, stage edited files::

    git add FILE_NAME1 [FILE_NAME2 ...]

Staged files are considered resolved.

Then check that all conflicts are solved::

    git status

Finally make the merge commit::

    git commit

It's recommended to keep the default commit message.

Solve conflicts with graphical tools
------------------------------------

Git support many *external diff tools* out of the box to resolve merge
conflicts, including *opendiff*, *kdiff3*, *tkdiff*, *xxdiff*, *meld*,
*kompare*, *gvimdiff*, *diffuse*, *diffmerge*, *ecmerge*, *p4merge*, *araxis*,
*bc*, *codecompare*, *vimdiff* and *emerge* (the default one is *opendiff*).

To select which tool to use::

    git config [--global] merge.tool TOOL_NAME

For instance::

    git config --global merge.tool meld

To resolve conflicts with the selected graphical tool after a ``git merge`` or
``git pull``::

    git mergetool [FILE_NAME1, ...]

.. This will open specified files (or all files) with an unresolved conflict.


Specifying a directory will include all unresolved files in that path. If no
``FILE_NAME`` is specified, ``git mergetool`` will run the merge tool program
on every file with merge conflicts.


If you use ``meld`` as ``merge.tool`` (probably the most popular mergetool),
then update and save the **middle pane** only (the one called either *BASE* or
*MERGED*).
With ``meld``, the left pane (named *LOCAL*) shows the contents of the file on
the current branch (e.g. ``master`` in section `Merge a given local branch in
the current branch`_) and the right pane (named *REMOTE*) show the contents of
the file on the branch being merged (e.g. ``experimental`` in section `Merge a
given local branch in the current branch`_).
See
`this page <http://stackoverflow.com/questions/34119866/setting-up-and-using-meld-as-your-git-difftool-and-mergetool>`_
for more information.


If, while you are editing the merge conflicts in your selected mergetool,
you wish to cancel changes, then quit your graphical tool without saving
anything.


.. TODO comment faire pour annuler les modifs: ne pas enregistrer le pane du milieu...

.. TODO comment faire si on a accidentellement enregistré le fichier dans le merge tool mais qu'on veut finalement faire un abort sur ce fichier sanf faire un git merge --abort (qui annulerait les modifs sur TOUS les fichiers) ? Remplacer le fichier modifié par le .orig ne marche + git reset pas.

.. TODO comment configurer MERGED ou BASE dans le panneau du milieu : cf. http://stackoverflow.com/questions/34119866/setting-up-and-using-meld-as-your-git-difftool-and-mergetool : écrire ça dans une nouvelle sous section "Advanced git mergetool setup"

.. TODO gestion des espaces et des caractères de fin de ligne : cf. http://stackoverflow.com/questions/34119866/setting-up-and-using-meld-as-your-git-difftool-and-mergetool : écrire ça dans une nouvelle sous section "Advanced git mergetool setup"

A ``.orig`` file is created for each edited file.
These are safe to remove once a file has been merged.
Setting the ``mergetool.keepBackup`` configuration variable to ``false`` causes
``git mergetool`` to automatically remove the backup as files are successfully
merged.


Once you have solve conflicts, edited files are automatically staged.
Check that all conflicts are solved with::

    git status

Check the differences with the former "*LOCAL*" branch::

    git diff --cached

Finally make the merge commit::

    git commit

It's recommended to keep the default commit message.


Good to know: ``git mergetool`` has no equivalant option to
``git difftool --dif-diff`` (i.e. it cannot open all conflicted files
simultaneously and perform a *directory diff*).


See https://git-scm.com/docs/git-mergetool for more information.

Abort a merge for some files only
---------------------------------

.. TODO: improve the title...

Typing::

    git merge --abort

in the middle of a merge conflict resolution would reset all files.
To reset only one given file, use this command instead::

    git checkout -m FILENAME

If ``FILENAME`` has been migrated into the index by error, then it can be
solved again with::

    git mergetool FILE_NAME

See: http://stackoverflow.com/questions/6857082/redo-merge-of-just-a-single-file

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

