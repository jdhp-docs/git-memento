Submodules
==========

Few definitions
---------------

A submodule allows you to keep another Git repository in a subdirectory of your
repository. The other repository has its own history, which stays completely
independent and does not interfere with the history of the current repository.
This can be used to have external dependencies such as third party libraries.

A repository that contains *subprojects* (called *submodules* in the git
terminology) is here called *superproject*.

See https://git-scm.com/book/en/v2/Git-Tools-Submodules for more explanations
about *submodules*.

Add a *submodule* to a *superproject*
-------------------------------------

Short version
~~~~~~~~~~~~~

From *superproject* (i.e. from the repository where you want to insert the
*submodule*)::

    git submodule add SUBMODULE_REPOSITORY_URL [SUBMODULE_PATH]
    git commit -m "Add a submodule"

where the optional argument ``SUBMODULE_PATH`` is the relative location for the
cloned submodule to exist in the *superproject*.
``SUBMODULE_PATH`` is also used as the submodule's logical name in its
configuration entries (unless --name is used to specify a logical name).
For GitHub users, ``SUBMODULE_REPOSITORY_URL`` should be an HTTPS URL (i.e.
not an SSH one) to grant everyone access to *submodule* within *superproject*.

More explanations
~~~~~~~~~~~~~~~~~

The ``git submodule add`` command creates the following objects in the working
tree (and the git index)::

    .gitmodules
    SUBMODULE_PATH

Where:

- ``.gitmodules`` (see gitmodules(5)) is a text file that assigns a logical
  name to the submodules and describes the default URL the submodules shall be
  cloned from;
- ``SUBMODULE_PATH`` has a special mode ``160000`` (see ``git diff``, ``git
  ls-tree HEAD`` or ``git cat-file -p master^{tree}`` outputs) that indicates
  it's not a *tree object* but a *git link* that refer to a commit in the
  *submodule* repository. The content pointed by this link is not tracked in
  *superproject* repository.

The ``git commit`` command is used to add these two files to the *superproject*
repository. Indeed they should be version-controlled (i.e. pushed and pulled
with the rest of your project) so that users who clone the *superproject* can
easily fetch the *submodule* (see the next subsection).

The ``git submodule add`` command doesn't write anything into the ``.git/``
repository, it only create the two objects previously described.

Clone a repository containing submodules (additional steps after cloning)
-------------------------------------------------------------------------

Short version
~~~~~~~~~~~~~

When cloning or pulling a repository containing submodules, these will not be
checked out by default (i.e. the *submodule* directory is there but empty).
The ``init`` and ``update`` subcommands are required to maintain submodules
checked out and at appropriate revision in your working tree::

    git submodule init
    git submodule update

There is simpler way to clone a project and init/update all its submodules::

    git clone --recursive SUPERPROJECT_REPOSITORY_URL

The ``--recursive`` option in ``git clone`` command automatically initializes
and updates each submodule.

More details
~~~~~~~~~~~~

The ``git submodule init`` command only update the ``.git/config`` file (adding
a ``[submodule]`` entry).

.. [branch "master"]
..     remote = origin
..     merge = refs/heads/master
.. +[submodule "subproject"]
.. +       url = /Users/jdecock/sandbox/git/subproject

The ``git submodule update`` actually fill the *submodule* directory with the
content attached to the *submodule* commit pointed by the current *gitlink* in
*superproject*.

Update a given submodule in a *superproject*
--------------------------------------------

.. répercuter les modifications de "submodule" dans "main"

When a *submodule* repository is updated, the *superproject* doesn't
automatically follow the last changes ; the reason is you may want to stick to a
particular approved version of the *submodule*. Thus updates have to be made
explicitly.

From the *superproject*::

    cd SUBMODULE_DIRECTORY
    git fetch
    git merge origin/master

or simply::

    git submodule update --remote SUBMODULE_DIRECTORY

Update all submodules in a *superproject*
-----------------------------------------

From the *superproject*::

    git submodule update --remote



.. git diff --submodule
.. 
.. 
.. Track another branch than master
.. $ git config -f .gitmodules submodule.DbConnector.branch stable
.. 
.. 
.. $ git config status.submodulesummary 1


.. TODO: choisir une version antérieure de "submodule" dans "main"

.. TODO: modifier et mettre à jours "submodule" depuis "main"

.. TODO: choisir une autre branche de "submodule" dans "main"

.. TODO: supprimer un "submodule" dans "main"

.. See also:
.. - git link, ...
.. - https://git-scm.com/book/en/v2/Git-Tools-Submodules
.. - https://chrisjean.com/git-submodules-adding-using-removing-and-updating/
