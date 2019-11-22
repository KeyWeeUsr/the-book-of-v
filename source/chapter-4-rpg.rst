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

By using reference for a place and its references for the neighborhood creating
a function that will move the traveler is a piece of a cake. We just need to
watch out for ``nil`` with a short check that both accepts and returns
references for places.

.. include:: vsource/rpg-move-nil-check.v
   :code: v

With this block we can repeat the check for multiple directions we would like
to travel - back, left or right - which helps with directly assigning them to
traveler's location property since it should return either its old value or the
new one for the desired direction if not ``nil``.

The function moving our traveler will require a mutable instance of traveler
|struct|_ and an immutable string for the direction. Mutability can again be
achieved by ``mut`` :doc:`keyword <keywords>`.

.. include:: vsource/rpg-move-fn-signature.v
   :code: v

First pull some values out of the traveler instance directly and even from its
references into variables for easier access and less repetitive code.

.. include:: vsource/rpg-move-refs.v
   :code: v

Then complete the function by choosing the right location for traveler property
via the place checking function and stored place references,

.. include:: vsource/rpg-move.v
   :code: v

and replace the place properties' values printing with move functions.

.. include:: vsource/rpg-move-print.v
   :code: v
