.. -*- coding: utf-8 -*-

===========
Git Memento
===========

:Author: Jérémie Decock
:Contact: jd.jdhp@gmail.com
:Revision: 0.1
:Date: 20/05/2016
:Licence: |CC BY-SA 4.0|_

.. ............................................................................

.. http://docutils.sourceforge.net/docs/ref/rst/directives.html#meta

.. meta::
    :author: Jérémie DECOCK
    :description: A git memento
    :keywords: git, github
    :copyright: Copyright (c) 2016 Jérémie DECOCK

.. ............................................................................

.. http://docutils.sourceforge.net/docs/ref/rst/directives.html#automatic-section-numbering

.. sectnum::

.. ............................................................................

.. raw:: latex

    \newpage

.. ............................................................................

.. http://docutils.sourceforge.net/docs/ref/rst/directives.html#table-of-contents

.. contents:: Table of Contents

.. ............................................................................

.. Break the page for rst2pdf

.. raw:: pdf

    PageBreak

Tags
====

Create a lightweight tag
------------------------

::

    git tag TAG_NAME [SHA1]

Example::

    git tag v1.4


Create an annotated tag
-----------------------

::

    git tag -a TAG_NAME -m "MESSAGE" [SHA1]

where ``-a`` means *annotated*.

Example::

    git tag -a v1.4 -m "My version 1.4"


List local tags
---------------

::

    git tag

or

::

    git tag -l

Push an annotated tag to a remote repository
--------------------------------------------

::

    git push REMOTE TAG_NAME

Example::

    git push origin v1.4

Push all tags to a remote repository
------------------------------------

::

    git push --tags

or

::

    git push --follow-tags

The latter is safer but anyway, it's generally considered a bad practice to
push *all* tags automatically with these two commands. Be sure you're not
pushing unwanded tags.

Branches
========

.. ............................................................................

.. Break the page for rst2pdf

.. raw:: pdf

    PageBreak

.. Break the page for Latex

.. raw:: latex

    \newpage

License
=======

|CC BY-SA 4.0 image|_

*Git Memento*
written by `Jérémie Decock`_
is provided under the terms and conditions of the |CC BY-SA 4.0|_ license.

.. ............................................................................

.. _TODO: http://www.jdhp.org/tutorials_TODO.html#git-memento
.. _Jérémie Decock: http://www.jdhp.org/

.. |CC BY-SA 4.0| replace:: Creative Commons 4.0 (CC BY-SA 4.0)
.. _CC BY-SA 4.0: http://creativecommons.org/licenses/by-sa/4.0/

.. |CC BY-SA 4.0 image| image:: ./images/cc_by_sa_80x15.png
.. _CC BY-SA 4.0 image: http://creativecommons.org/licenses/by-sa/4.0/
