.. include:: symbols.rst

Chapter I: Calculator
=====================

For the first program (except Hello world of course!) let's create a simple CLI
calculator. We start with a clean file in your favorite text editor:

.. include:: calculator-empty.rst

Operations
----------

We'll start with the addition. In V a function is created by ``fn``
:doc:`keyword <keywords>` and a basic numeric :doc:`type <types>` "integer"
is noted as ``int``:

.. include:: calculator-addition.rst

If we run the file:

.. code:: shell

    v run calc.v

nothing happens because we are missing the entrypoint for the executable,
or simply said, a place where computer should begin the execution of a program.
In V the entrypoint is known as a ``main`` function declared as ``fn main()``.
Let's add a ``main()`` function that adds two integers and displays the output
in the console. For that we'll use a built-in |println|_ function:

.. include:: calculator-add-int.rst

Now we can see the output. Let's include the rest of ``+-*/`` operations
in the same way we created ``add()`` function:

.. include:: calculator-basic-ops.rst

As we call each of the functions to perform a basic operation, we will see
this output. Noticed something strange?

.. include:: calculator-basic-ops-output.rst

``1 / 2`` is apparently ``0``. But why? Shouldn't the output be ``0.5``?

Yes and no. For now we use ``int`` :doc:`type <types>` which does not allow
a decimal mark and values after that symbol. There is a different
:doc:`type <types>` that allows it written as ``f32`` (short for 32-bit
floating-point number).

Switch all types from ``int`` to ``f32`` and run the program again.

.. include:: calculator-basic-ops-float.rst
.. include:: calculator-basic-ops-float-output.rst

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
