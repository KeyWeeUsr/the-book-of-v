.. include:: symbols.rst

.. _hangman_desc: https://en.wikipedia.org/wiki/Hangman_(game)#Overview
.. |hangman_desc| replace:: Hangman description

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

To define what should be present in the game loop we need to check the
|hangman_desc|_. So according to that, the game loop should have a player
always guessing either a letter or the whole hidden word until a player makes
6 mistakes. In between the guesses the game should visibly note player's
mistakes and unfold all places of a guessed letter. The game ends either by
providing a correct word, guessing all letters correctly or at player's 6th
mistake.

Let's define the game ending conditions first as having 6 user attempts total,
wrap checking for the user attempt in an infinite loop and then stopping the
game loop once the conditions are not matching. An infinite loop in V is
defined as a |for_loop|_ without any specified condition. Afterwards the loop
can be broken by a ``break`` :doc:`keyword <keywords>`.

.. include:: vsource/hangman-game-exit.v
   :code: v

We can see that the amount of attempts is a value that won't change, therefore
we can declare it as a constant with ``const`` :doc:`keyword <keywords`. Unlike
ordinary variables a value to a ``const`` is assigned via ``=`` instead of
``:=``.

.. include:: vsource/hangman-game-exit-const.v
   :code: v
