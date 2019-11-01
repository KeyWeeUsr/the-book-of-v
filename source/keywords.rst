.. include:: symbols.rst

Keywords
========

As per the `official V documentation <https://vlang.io/docs#keywords>`_.

* ``fn`` - begins a function declaration
* ``import`` - imports a module so a program can access it and its public
  symbols such as constants, structs or functions
* ``mut`` - makes a variable mutable (editable)
* ``in`` - checks whether |array_type|_ or |map_type|_ on the right side
  contains a value on the left side (``value in array``, see |in_kw|_ for more)
* ``break`` - breaks an iteration of a |for_loop|_
* ``const`` - declares a module-level variable that will never change (see
  |const_kw|_ for more)
* ``return`` - returns a value from a function
* ``exit`` - exits a program when encountered, allows user to specify the exit
  code for operating system
* ``continue`` - immediately skips to the next iteration of a loop
* ``break`` - stops the loop from any further iteration
* ``panic`` - exits a program and marks the program as unsuccessfully stopped
  with an exit code.
