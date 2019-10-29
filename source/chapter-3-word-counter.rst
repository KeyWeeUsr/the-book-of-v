.. include:: symbols.rst

Chapter III: Word counter
=========================

.. index::
   single: word
   single: counter

Counting can be a very simple example which can help explaining the grouping
of some variables under one roof. Let's jump straight into fetching console
arguments via |module_os|_ and define three modes this program will work with:

* ``-w`` or ``--words``
* ``-l`` or ``--lines``
* ``-c`` or ``--chars``

.. include:: vsource/word-counter-arguments.v
   :code:

To generalize the mode we create a container for it - a |struct|_ - with
``struct`` :doc:`keyword <keywords>`. The container will hold the mode's
name, its console arguments and later some other attributes. By default
everything stored in a |struct|_ is immutable and pretty much inaccessible
which allows us to have efficient abstractions without hacky hot-fixes unless
we explicitly allow them.

.. include:: vsource/word-counter-mode-struct-only.v
   :code:
