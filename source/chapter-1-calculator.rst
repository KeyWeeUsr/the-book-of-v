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
:doc:`type <types>` - |string_type|_.

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

Back to the calculator code, we will use this pseudo-|stack_wiki|_ with
manually pushing and removing items to implement |rpn|_ from console arguments.

We'll create two array "buckets" for two categories of operators according to
their precedence in an ordinary calculator.

After that let's take care of an obvious error that might be raised - calling
an operator function when there isn't enough values on the stack. We need to
check the number of elements in the ``stack`` array by its ``len`` attribute
as we did for popping the values from it in previous example and then exit the
program with a warning for which we'll use |panic|_.

.. include:: vsource/calculator-main-check-stack.v
   :code: v

Now let's append the console arguments on the stack if they are not one of
the operator functions' names we added to the arrays. By default any value from
the console arguments is a |string_type|_ which means we are missing one step.
We need to convert the value to ``f32`` before appending it. By looking at the
|string_impl|_ we can find its function for conversion |string_f32|_ which we
should use before trying to append the value on the stack.

Once the values are converted and on the stack, we need to check if there are
at least two and in the next console argument is an operator function's name
pop the values into ``left`` and ``right`` variables which will be used for
printing out the result.

.. include:: vsource/calculator-main-calc-values.v
   :code: v

Now we can check some basic instructions for our calculator this way:

.. include:: vsource/calculator-main-calc-values-output.v
   :code: v

Although usable, it's very limited as it does not provide any option for joined
operations such as ``(1 + 2) * (3 / (4 + 5))``. First we need to convert this
operation into |rpn|_ instructions so we can appropriately edit the ``main()``
function.

.. code::

    (1 + 2) * (3 / (4 + 5)) = 1
    1 2 + 3 4 5 + / *
    1 2 add 3 4 5 add div mul

    // each value is added on the stack as present
    // computing starts immediately after an operator is present and the two
    // closest values on the stack are popped in the reversed order i.e.
    // right first, left second
    1
    1 2
    1 2 +
    3
    3 3
    3 3 4
    3 3 4 5
    3 3 4 5 +
    3 3 9
    3 3 9 /
    3 1/3
    3 1/3 *
    1
    = 1

For that we need to rework the result handling a bit and put it on stack
instead of printing out right away - switch ``println(operator(left, right))``
to ``stack << operator(left, right)`` and then, after the computation is done,
make sure there are no console arguments remaining. Then print the whole stack
back to the console.

.. note::

   Optimal result is having only a single element present on the stack, however
   it can happen that there will be an additional result if we provide more
   values than operands + 1.

Here is the complete solution. Obviously it can be optimized and refactored
further, but that I've kept for you to have fun.

.. include:: vsource/calculator-complete.v
   :code: v
