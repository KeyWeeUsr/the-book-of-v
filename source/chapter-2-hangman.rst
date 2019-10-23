.. include:: symbols.rst

.. _hangman_desc: https://en.wikipedia.org/wiki/Hangman_(game)#Overview
.. |hangman_desc| replace:: Hangman description

.. _enter_key: https://en.wikipedia.org/wiki/Enter_key
.. |enter_key| replace:: ``Enter`` key

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
``:=`` and can't be changed.

.. include:: vsource/hangman-game-exit-const.v
   :code: v

Next we retrieve a user input so we can. If the length of the input is ``1`` we
will treat it as guessing a character from the whole word and display all its
occurences if the character is present. If the input is longer than one
character, player is guessing the whole word and only if the word matches we
display it. For any other case just take it as a failed attempt.

For user input import |module_os|_, then use its |os_get_line|_ function to
retrieve a single line from console - or in other words an input terminated by
a single |enter_key|_.

.. include:: vsource/hangman-user-input.v
   :code: v

Once we have the input available, let's add a sample word ``hangman`` to
a variable. Then create a mask of that word, a value constructed of ``-``
characters in the same length as the guess word. That's easily achievable with
|string_repeat|_ function.

.. include:: vsource/hangman-mask-word.v
   :code: v

If a player guesses correctly, go through the variable which stores ``hangman``
word, find each occurence of the character and replace the ``-`` characters
with uncovered ones according to the position in the original word.

.. include:: vsource/hangman-simple-guess.v
   :code: v

Notice the sections where the ``str()`` function is called. While a word is
stored as a |string_type|_, that's in simple terms just an |array_type|_ of
``byte`` :doc:`types <types>`. A ``byte`` on the other hand is so similar to an
``int`` that the ``str()`` function is the same for both - |int_str|_.
