.. include:: symbols.rst

Chapter II: Hangman
===================

After the first chapter you should know how to use :doc:`keywords <keywords>`
``fn`` and ``mut``, :doc:`types <types>` ``int``, ``f32``, |string_type|_,
|array_type|_ as well as converting |string_type|_ input to ``f32`` and some
basic |array_type|_ operations with ``<<``, |array_len|_ and |array_delete|_.

In this chapter we will create a Hangman game that will pick a random word from
a predefined array of values. As for any common game, we need to create a loop
in which we check the inner state of the game and request a user input or
action if necessary.

.. include:: vsource/hangman-game-loop.v
   :code: v
