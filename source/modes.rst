Modes
=====

V provides multiple modes of running while the default (``v`` or ``v runrepl``)
throws you into the REPL (Read-Execute-Print-Loop) console where you can try
the language or write small scripts.

REPL
----

.. code:: shell

    v  # or v runrepl

.. code:: shell

    root@16b5a9d05074:/opt/vlang# v
    V 0.1.21 b51b885
    Use Ctrl-C or `exit` to exit
    >>>

Compiler
--------

V executable when provided with an argument that contains a ``.v`` suffix will
open that file, compile it and produce a same-named binary.
