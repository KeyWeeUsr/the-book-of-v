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
   :code: v

To generalize the mode we create a container for it - a |struct|_ - with
``struct`` :doc:`keyword <keywords>`. The container will hold the mode's
name, its console arguments and later some other attributes. By default
everything stored in a |struct|_ is immutable and pretty much inaccessible
which allows us to have efficient abstractions without hacky hot-fixes unless
we explicitly allow them.

.. include:: vsource/word-counter-mode-struct-only.v
   :code: v

Once the struct is declared with name, curly brackets and its attributes it's
ready for usage. Although there are multiple ways for populating its attributes
with values, we'll use explicitly stated attribute names before values. This
allows us to specify the attributes in an unordered way and it's quite
important in the long run from the project maintainability perspective due to
no requirement of keeping the order of the |struct|_ attributes (which may
change by including a new feature).

.. include:: vsource/word-counter-mode-struct.v
   :code: v
