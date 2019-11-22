.. include:: symbols.rst

Chapter IV: Role-Playing Game
=============================

In this chapter we'll create a simplified role-playing game and leverage
multiple structures via |struct|_. Let's start with place properties such as
name and links for connecting multiple place instances between themselves.
Each place will have one previous place and two places, one on the left side
and one on the right side.

.. include:: vsource/rpg-place-node.txt

To create a link between two place structures we need references to them and
use such references as values. A symbol ``&`` (ampersand) creates a reference
for a computer memory where our place |struct|_ is stored. Reference is
a ``voidptr`` :doc:`type <types>`.

.. include:: vsource/rpg-place.v
   :code: v

Each reference value for a |struct|_ will start as a ``nil`` which is a pointer
that stores a value ``0`` and for that there is a checker in V - |isnil|_.

Let's try to create and connect these places with code:

.. include:: vsource/rpg-place-tree.txt

Each of the place nodes can either have ``nil`` as a previous/next node or an
initialized different place. Set the reference again by using ``&`` character
before the symbol you want to reference, in this case an initialized place
|struct|_.

.. include:: vsource/rpg-place-connected.v
   :code: v

Running this piece of code won't yet work due to |struct|_ fields being
immutable. To mark them as mutable use ``mut`` :doc:`keyword <keywords>` with
a colon (``:``) suffix. ``mut:`` will mark all fields after it as mutable
unless it encounters some other :doc:`keyword <keywords>` changing the
|struct|_ field properties.

.. include:: vsource/rpg-place-connected-struct.v
   :code: v

Once that is fixed, we get an output like below (the memory addresses will be
different). Notice the connections between each of the nodes such as Tree
memory address (``0x7ffe01a7eac0`` in this case) being equal Shrubbery previous
node's address.

.. include:: vsource/rpg-place-connected-output.txt

The places are ready, let's create a traveler who will navigate through them.
Our traveler will for now contain a single property - location - which is
a reference for an already existing place. This always requires a value and
must not be ``nil``. We can achieve such behavior by initializing the |struct|_
with a value and assigning only valid values to that property.

.. include:: vsource/rpg-traveler.v
   :code: v

While assigning invalid values e.g. an incorrectly typed (or raw) value is not
an error right now and we can happily do ``traveler.location = 0``, it will
make the program access a part of memory which it should not be allowed to do,
therefore will result in a ``Segmentation fault (core dumped)``.