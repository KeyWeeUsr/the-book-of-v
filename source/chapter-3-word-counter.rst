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

Now we can propagate each |struct|_ that's initialized out of the function.
Although V presents itself as not having a global space for symbols,
|const_kw|_ creates a very similar space as global one, but on the module level.
Since we can't rewrite the value assigned as a constant, in combination with
``import`` :doc:`keyword <keywords>` the module space is quite a powerful and
safe feature.

.. include:: vsource/word-counter-mode-const.v
   :code: v

Each mode needs some kind of configuration so the counter knows what to use for
distinguishing between words, lines or characters. This configuration we name
``sep`` as in ``separator`` and set it to ``<space>`` for words, ``\n`` for
lines and ``<empty string>`` for characters. Note that the last one will count
even ``<space>`` or ``\n`` as a character.

.. include:: vsource/word-counter-sep.v
   :code: v

To count we need to fetch the path from |os_args|_, open the file and process
its contents with a counting function that will use currently active counting
mode. To open a file |os_read_file|_ is used which returns the file contents
and also closes the file. Nevertheless, we still need to ensure such a file
is present on the system with |os_file_exists|_.

.. include:: vsource/word-counter-count.v
   :code: v

There is one catch with the |os_read_file|_ function, it returns an ``Option``
:doc:`type <types>`. This kind of type has to be handled in your code with an
``or`` block that allows only specific set of :doc:`keywords <keywords>`.

Once we handle the failing function and remove unnecessary printing to the
console the program is ready and complete.

Here is a challenge for you as a reader: Currently it handles only a single
file. Try to make it handle multiple files!

.. include:: vsource/word-counter-complete.v
   :code: v
