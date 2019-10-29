.. include:: symbols.rst

Chapter III: Word counter
=========================

.. index::
   single: word
   single: counter

Counting can be a very simple example which can help explaining the grouping
of some variables under one roof. Let's jump straight into fetching console
arguments via |module_os|_ and define three modes this program will work with:

* ``-w|--words``
* ``-l|--lines``
* ``-c|--chars``

.. include:: vsource/word-counter-arguments.v
   :code:
