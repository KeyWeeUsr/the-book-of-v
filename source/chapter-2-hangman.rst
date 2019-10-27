.. include:: symbols.rst

.. _hangman_desc: https://en.wikipedia.org/wiki/Hangman_(game)#Overview
.. |hangman_desc| replace:: Hangman description

.. _enter_key: https://en.wikipedia.org/wiki/Enter_key
.. |enter_key| replace:: ``Enter`` key

Chapter II: Hangman
===================

.. index::
   single: hangman

After the first chapter you should know how to use :doc:`keywords <keywords>`
``fn`` and ``mut``, :doc:`types <types>` ``int``, ``f32``, |string_type|_,
|array_type|_ as well as converting |string_type|_ input to ``f32`` and some
basic |array_type|_ operations with ``<<``, |array_len|_ and |array_delete|_.

Game loop
---------

.. index::
   single: game loop
   single: game
   single: word

In this chapter we will create a Hangman game that will pick a random word from
a predefined array of values. As for any common game, we need to create a loop
in which we check the inner state of the game and request a user input or
action if necessary.

.. include:: vsource/hangman-game-loop.v
   :code: v

.. index::
   single: mistakes
   single: guess
   single: correct
   single: word
   single: letters

To define what should be present in the game loop we need to check the
|hangman_desc|_. So according to that, the game loop should have a player
always guessing either a letter or the whole hidden word until a player makes
6 mistakes. In between the guesses the game should visibly note player's
mistakes and unfold all places of a guessed letter. The game ends either by
providing a correct word, guessing all letters correctly or at player's 6th
mistake.

.. index::
   single: conditions
   single: attempts
   single: infinite
   single: for
   single: break

Let's define the game ending conditions first as having 6 user attempts total,
wrap checking for the user attempt in an infinite loop and then stopping the
game loop once the conditions are not matching. An infinite loop in V is
defined as a |for_loop|_ without any specified condition. Afterwards the loop
can be broken by a ``break`` :doc:`keyword <keywords>`.

.. include:: vsource/hangman-game-exit.v
   :code: v

.. index::
   single: const

We can see that the amount of attempts is a value that won't change, therefore
we can declare it as a constant with ``const`` :doc:`keyword <keywords>`.
Unlike ordinary variables a value to a ``const`` is assigned via ``=`` instead
of ``:=`` and can't be changed.

.. include:: vsource/hangman-game-exit-const.v
   :code: v

.. index::
   single: character
   single: match

Next we retrieve a user input so we can. If the length of the input is ``1`` we
will treat it as guessing a character from the whole word and display all its
occurences if the character is present. If the input is longer than one
character, player is guessing the whole word and only if the word matches we
display it. For any other case just take it as a failed attempt.

.. index::
   single: os
   single: get_line

For user input import |module_os|_, then use its |os_get_line|_ function to
retrieve a single line from console - or in other words an input terminated by
a single |enter_key|_.

.. include:: vsource/hangman-user-input.v
   :code: v

.. index::
   single: mask
   single: repeat

Once we have the input available, let's add a sample word ``hangman`` to
a variable. Then create a mask of that word, a value constructed of ``-``
characters in the same length as the guess word. That's easily achievable with
|string_repeat|_ function.

.. include:: vsource/hangman-mask-word.v
   :code: v

.. index::
   single: occurence

If a player guesses correctly, go through the variable which stores ``hangman``
word, find each occurence of the character and replace the ``-`` characters
with uncovered ones according to the position in the original word.

.. include:: vsource/hangman-simple-guess.v
   :code: v

Notice the sections where the ``str()`` function is called. While a word is
stored as a |string_type|_, that's in simple terms just an |array_type|_ of
``byte`` :doc:`types <types>`. A ``byte`` on the other hand is so similar to an
``int`` that the ``str()`` function is the same for both - |int_str|_.

Improvements
------------

If we look properly at this large game loop, we can see multiple parts that
can be pulled out into separate functions which will increase the readability
of the overall code. Let's move the code working with user input and name it as
``guess()`` function. This function will take multiple |string_type|_
parameters and also return one |string_type|_. We reflect those properties to
the function declaration and the result should look like this:
``fn guess(input string, word string, mask string) string``.

.. include:: vsource/hangman-guess-function.v
   :code: v

For the conditions of word matching and attempts we create ``check_continue()``
function and make it return a ``bool`` :doc:`type <types>` so the |for_loop|_
can automatically check the value and exit game loop when necessary. Similarly
for the match of the guessed word and already uncovered letters we create
``check_win()`` function so the logic is kept at one place.

.. include:: vsource/hangman-check-functions.v
   :code: v

Finally, we move out the game summary prints to ``print_summary()`` function,
clean unnecessary variables and add spacing between code lines.

.. include:: vsource/hangman-improved.v
   :code: v

While the current state of the game is workable, we still need to make it
dynamic otherwise the game would be always the same and after the first try
everyone knows the answer. We can solve this by using a file named
``words.txt`` which will contain guess words one per each line.

To read lines from a file on your operating system use |os_read_lines|_
function. Specify just the name of the file to open it from the current
"working" directory or in other words, from the folder you run your program
from.

After the |array_type|_ of |string_type|_ s is retrieved we need to pull
a single word for the game to begin. Import |module_rand|_ and use |rand_next|_
from it. Make sure the maximum value is set to the length of the words
|array_type|_ to only access its item by an index within the range of
available words.

.. include:: vsource/hangman-load-word.v
   :code: v

If you try to include this function into the already existing game, it will
most likely have a consistent behavior (always the same word chosen). That's
because a randomness *seed* needs to be different on each run. For that import
|module_time|_ and input |time_now|_ to a call setting the seed - |rand_seed|_.

Since |rand_seed|_ requires an ``int`` :doc:`type <types>` we can convert the
|time_Time|_ into a UNIX timestamp which is a number we can safely use for
seeding in this particular case. |time_Time|_ stores it in |time_Time_uni|_.

Once the seed is set we can call |rand_next|_. Now change the hard-coded
guess word in ``game_loop()`` into ``load_word("words.txt")`` and create a file
named ``words.txt`` in the same folder as is the hangman ``.v`` file. You can
find a sample file in the :doc:`appendix` section.
