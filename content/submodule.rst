Submodules
==========

Few definitions
---------------

A repository that contains *subprojects* (called *submodules* in the git
terminology) is called *superproject*.

See https://git-scm.com/book/en/v2/Git-Tools-Submodules for more explainations
about *submodules*.

Add a *submodule* to a *superproject*
-------------------------------------

.. TODO: reverifier tout ce qui est ecrit

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

The ``git submodule add`` command creates the following files in the working
tree and the index::

    .gitmodules
    SUBMODULE_PATH

where ``SUBMODULE_PATH`` is a *git link* to the *submodule* repository.
The ``git commit`` command add these two files to the *superproject*
repository.
Thanks to this commit, users who clone the *superproject* can easily fetch the
*submodule* (see the next subsection).

Clone a repository containing submodules (additional steps after cloning)
-------------------------------------------------------------------------

.. TODO: reverifier tout ce qui est ecrit

If a project contains submodules, here are the additional steps you should
execute after cloning this project::

    git submodule init
    git submodule update

Update all submodules in a *superproject*
-----------------------------------------

From the *superproject*::

    git submodule update


.. TODO: répercuter les modifications de "submodule" dans "main"

.. TODO: choisir une version antérieure de "submodule" dans "main"

.. TODO: modifier et mettre à jours "submodule" depuis "main"

.. TODO: choisir une autre branche de "submodule" dans "main"

.. TODO: supprimer un "submodule" dans "main"

.. See also:
.. - git link, ...
.. - https://git-scm.com/book/en/v2/Git-Tools-Submodules
.. - https://chrisjean.com/git-submodules-adding-using-removing-and-updating/
