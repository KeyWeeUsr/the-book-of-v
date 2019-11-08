.. include:: symbols.rst

Chapter IV: Role-Playing Game
=============================

In this chapter we'll create a simplified role-playing game and leverage
multiple structures via |struct|_. Let's start with place properties such as
name and links for connecting multiple place instances between themselves.
Each place will have one previous place and two places, one on the left side
and one on the right side.

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
