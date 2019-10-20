.. include:: symbols.rst

.. _rpn: https://en.wikipedia.org/wiki/Reverse_Polish_notation
.. |rpn| replace:: Reverse Polish notation

.. _stack_wiki: https://en.wikipedia.org/wiki/Stack_%28abstract_data_type%29
.. |stack_wiki| replace:: stack

Chapter I: Calculator
=====================

For the first program (except Hello world of course!) let's create a simple CLI
calculator. We start with a clean file in your favorite text editor:

.. include:: vsource/calculator-empty.v
   :code: v

Operations
----------

We'll start with the addition. In V a function is created by ``fn``
:doc:`keyword <keywords>` and a basic numeric :doc:`type <types>` "integer"
is noted as ``int``:

.. include:: vsource/calculator-addition.v
   :code: v

If we run the file:

.. code:: shell

    v run calc.v

nothing happens because we are missing the entrypoint for the executable,
or simply said, a place where computer should begin the execution of a program.
In V the entrypoint is known as a ``main`` function declared as ``fn main()``.
Let's add a ``main()`` function that adds two integers and displays the output
in the console. For that we'll use a built-in |println|_ function:

.. include:: vsource/calculator-add-int.v
   :code: v

Now we can see the output. Let's include the rest of ``+-*/`` operations
in the same way we created ``add()`` function:

.. include:: vsource/calculator-basic-ops.v
   :code: v

As we call each of the functions to perform a basic operation, we will see
this output. Noticed something strange?

.. include:: vsource/calculator-basic-ops-output.v
   :code: v

``1 / 2`` is apparently ``0``. But why? Shouldn't the output be ``0.5``?

Yes and no. For now we use ``int`` :doc:`type <types>` which does not allow
a decimal mark and values after that symbol. There is a different
:doc:`type <types>` that allows it written as ``f32`` (short for 32-bit
floating-point number).

Switch all types from ``int`` to ``f32`` and run the program again.

.. include:: vsource/calculator-basic-ops-float.v
   :code: v

.. include:: vsource/calculator-basic-ops-float-output.v
   :code: v

Nice, we can see a proper result for ``1 / 2`` operation.

Input
-----

We can see the program computing results, but it's only for the hard-coded
values directly in the ``calc.v`` file. This way we'd always need to rewrite
our calculator.

As you've already noticed when running a V program, V already knows what file
you want to use by you providing a filename in the console. The same way V
can use your value for compiling we can use it for computing results. The input
values can be fetched with the help of |module_os|_ module.

In V you can use a module by *importing* it via ``import``
:doc:`keyword <keywords>`. From that module we will need a constant
|os_args|_ that returns an array of another kind of V
:doc:`type <types>` - ``string``.

.. include:: vsource/calculator-basic-ops-float-withinput.v
   :code: v

Now you should see even the array of arguments passed to the calculator
program the same as below:

.. include:: vsource/calculator-basic-ops-float-withinput-output.v
   :code: v

The first argument will always be a name of the executable that's running,
which in this case means ``./calc``, and anything other added after the path
to the executable is added as the next argument.

.. code:: shell

    # call
    v run calc.v argument
    ./calc argument

    # output
    ...
    ["./calc", "argument"]

Pseudo-stack with |array_type|_
-------------------------------

Once we can access the console arguments, we can quickly implement so called
|rpn|_ with a |for_loop|_, |if_cond|_ and |stack_wiki|_.

First we skip the executable path:

.. include:: vsource/strip-exe-path.v
   :code: v

To implement |rpn|_ we will use an |array_type|_ as a pseudo-|stack_wiki|_
structure for storing the ``f32``. To create a variable V uses a simple
``<name> := <value>`` syntax e.g. ``number := 1``, however for an array there is
a catch. We need to go a little bit further and specify the type of all values
in it as ``<name> := []<type>``.

.. include:: vsource/array-f32-immutable-assign.v
   :code: v

After we use a :doc:`keyword <keywords>` ``mut``, we mark the variable as
editable and can use ``<<`` operator for the array to append a new value to it.

Currently there is no quick way for popping the last element from an array
while removing it at the same time, therefore we will access the last element
by its position in angle brackets (``array[idx]``) in the array and then use
|array_delete|_ to remove it.

.. include:: vsource/array-f32-push-pop.v
   :code: v

As you can see, an |array_type|_ has an |array_len|_. It's changed on each
resizing manipulation of |array_type|_.
