.. include:: symbols.rst

Chapter IV: Role-Playing Game
=============================

In this chapter we'll create a simplified role-playing game and leverage
multiple structures via |struct|_. Let's start with place properties such as
name and links for connecting multiple place instances between themselves.
Each place will have one previous place and two places, one on the left side
and one on the right side.

To create a link between two place structures we need to reference a |struct|_
within itself. A symbol ``&`` (ampersand) creates a reference required within
a |struct|_ which in the background creates a reference for memory where such
an object is stored.

.. include:: vsource/rpg-place.v
   :code: v
