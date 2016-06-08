Example
=======

::

    git checkout english-version
    ...
    git add .
    git commit -m "..."
    git push origin english-version
    git checkout master
    git merge english-version
    git push
