GitHub collaboration workflow
=============================

Roles
-----

Source: https://guides.github.com/activities/contributing-to-open-source/

*Owner*
    The user or organization that created the project.

*Maintainers* and *Collaborators*
    The users primarily doing the work on a project and driving the direction.
    Oftentimes the owner and the maintainer are the same.
    They have write access to the repository.

*Contributors*
    Everyone who has had a pull request merged into a project.

*Community Members*
    The users who often use and care deeply about the project and are active in
    discussions for features and pull requests.

Workflow models
---------------

*Shared Repository Model*
    When contributors have write access to the project (i.e. they are either
    *maintainers* or *collaborators*).
    Then, they can directly push their commits to the project repository.

*Fork & Pull Model*
    When contributors don't have write access to the project (i.e. they are
    neither *maintainers* or *collaborators*).
    To contribute, they have to *fork* the project, clone this fork and then
    *suggest* their patches using GitHub *Pull requests*.
    Contributors who have write access to the project can also use the
    *Fork & Pull Model* to be sure the rest of the team agrees with the
    changes.

See also https://guides.github.com/introduction/flow/

The Fork & Pull model
---------------------

Prior step: Fork the upstream repository and clone the fork
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. See https://guides.github.com/activities/forking/#fork

Fork the upstream repository on the GitHub website: see
https://help.github.com/articles/fork-a-repo/#fork-an-example-repository.

Clone the fork repository (where
`git@github.com:YOUR_USER_NAME/REPOSITORY_NAME.git` is the URL of *your*
fork)::

    git clone git@github.com:YOUR_USER_NAME/REPOSITORY_NAME.git
    cd REPOSITORY_NAME

Define the *upstream* remote repository (where
`https://github.com/UPSTREAM_USER_NAME/REPOSITORY_NAME.git` is the URL of the
*original* repository)::

    git remote add upstream https://github.com/UPSTREAM_USER_NAME/REPOSITORY_NAME.git

Step 1: Synchronize with upstream
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Synchronize your work directory with upstream::

    git fetch upstream
    git checkout master
    git merge upstream/master

Synchronize your fork with upstream::

    git push origin master

or simply::

    git push

Step 2: Make your updates on a new branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a new branch::

    git checkout master
    git checkout -b experimental

Update files...

Push your new local branch on your fork::

    git push -u origin experimental

Step 3: Make a pull request
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Make a pull request for your changes on the upstream repository on the GitHub
website.

See https://help.github.com/articles/creating-a-pull-request/

GitHub uses some special words to describe the from and to branches:

- The *base* branch is where you think changes should be applied.
- The *head* branch is what you would like to be applied.

On the pull request creation page, *base* should be set to "master" (we want to
merge our changes to upsteam/master) and *head* should be the name of our
working branch ("experimental" here).

Step 4: (If requested) correct mistakes and re-push to branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If *maintainers* or *collaborators* request some correction on your updates
prior to validate them, here is the procedure to follow.

Be sure you are still in your updates dedicated branch::

    git checkout experimental

Then correct mistakes in your changes then commit them and push them to your fork::

    git commit -m 'YOUR MESSAGE'
    git push origin experimental

or simply::

    git commit -m 'YOUR MESSAGE'
    git push

Then your new changes are automatically signaled to the *maintainers* or
*collaborators* and your pull request page on github is automatically updated
to reflect your last changes.

Step 5: Merge pull request
~~~~~~~~~~~~~~~~~~~~~~~~~~

Once your pull request has been accepted, your update dedicated branch has been
added and merged to master in the upstream repository.

TODO: add an image

Step 6: Synchronize with upstream
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the last step, you need to synchronize your working directory and your fork
repository with upstream.

Synchronize your work directory with upstream::

    git fetch upstream
    git checkout master
    git merge upstream/master

Synchronize your fork with upstream::

    git push origin master

or simply::

    git push

TODO: add an image

Step 7: (Optional) remove the working branches
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Remove the remote working branch of your fork on Github::

    git push origin --delete experimental

or simply delete the branch from the github interface.

Then remove the local working branch::

    git branch -d experimental

