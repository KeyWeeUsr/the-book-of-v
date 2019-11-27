.. include:: symbols.rst

Keywords
========

As per the `official V documentation <https://vlang.io/docs#keywords>`_.

* ``fn`` - begins a function declaration in any of these shapes:

  1. Pure function without specified return :doc:`type <types>` i.e. having the
     default ``void`` return type.

     .. code::

        fn name()
        fn name(arg int, arg2 string, ...)

  2. Pure function with specified return type.

     .. code::

        fn name() int
        fn name(arg int, arg2 string, ...) int

  3. Struct method without and with argument and result :doc:`types <types>`.

     .. code::

        fn (m MyStruct) name() int
        fn (m MyStruct) name(arg int, arg2 string, ...) int

   For more examples and explanation check |functions|_ and |methods|_
   in V documentation.

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
