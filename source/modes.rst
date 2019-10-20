Modes
=====

V provides multiple modes of running while the default (``v`` or ``v runrepl``)
throws you into the REPL (Read-Execute-Print-Loop) console where you can try
the language or write small scripts.

REPL
----

Although not in the way as it is for Python or JavaScript, this
interpreter-like mode takes your code and in the background writes it to
a temporary ``.v`` file which is then compiled and run. V then returns the
output back to you in the console.

.. code:: shell

    v  # or v runrepl

.. code:: shell

    root@16b5a9d05074:/opt/vlang# v
    V 0.1.21 b51b885
    Use Ctrl-C or `exit` to exit
    >>>

The console provides a simple ``help`` command that lists all available console
commands:

.. code:: shell

    >>> help

    V 0.1.21 b51b885
      help                   Displays this information.
      Ctrl-C, Ctrl-D, exit   Exits the REPL.
      clear                  Clears the screen.

.. note::

   Currently there is a hidden step between compiling ``.v`` file and running
   the final program. V requires a C compiler present on the system and
   attempts to compile ``.v`` file to ``.c`` which is then compiled to machine
   code a CPU understands. After that V runs the binary produced by the C
   compiler and retrieves output back.

.. warning::

   Currently there is no support for command history, therefore arrows,
   Control-P, Alt-P or any combination of them will result in an escape code
   printed to the console.

   .. code:: v

       >>> ^[[A
       >>> ^P
       >>> ^[p
       >>> ^[^P
       >>> ^[[1;5A
       >>> ^[[1;3A

By default you have an access to the `builtin
<https://github.com/vlang/v/tree/master/vlib/builtin>`_ module

.. code:: v

    >>> println("Hello, world!")
    Hello, world!

    // or even

    >>> print("Hello, world!")
    Hello, world!

In its simplest form it can be used as a calculator:

.. code:: v

    >>> print(1 + 1)
    2

For more examples check :ref:`Calculator test cases`.

Compiler
--------

V executable when provided with an argument that contains a ``.v`` suffix will
open that file, compile it and produce a same-named binary.

.. include:: hello-world.rst

Compile with:

.. include:: hello-world-compile.rst

.. note::

   In case you can't execute the output file try changing the file into
   an executable with ``chmod +x <file>``.

Runner
------

Similar to REPL mode, this mode in the background compiles and attempts to run
your file.

.. include:: hello-world-run.rst
