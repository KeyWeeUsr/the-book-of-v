:orphan:

.. _Calculator test cases:

Calculator test cases
=====================

.. code:: v

    >>> print(2 + 3)
    5
    >>> print(-2 + -3)
    -5
    >>> print((-2) + (-3))
    -5
    >>> print(2 + -3)
    -1
    >>> print(2 + (-3))
    -1

    >>> print(2 - 3)
    -1
    >>> print(-2 - -3)
    1
    >>> print((-2) - (-3))
    1
    >>> print(-2 - 3)
    -5
    >>> print((-2) - 3)
    -5

    >>> print(2 * 3)
    6
    >>> print(-2 * -3)
    6
    >>> print(-2 * 3)
    -6

    >>> print(2 / 3)
    0
    >>> print(-2 / -3)
    0
    >>> print(2 / -3)
    0
    >>> print(2 / 0)
    .vrepl.v:2:11: division or modulo by zero

    >>> print(2 / -1)
    -2
    >>> print(0 / 2)
    0
    >>> print(0 / -1)
    0


    >>> print(2.0 + 3)
    5.000000
    >>> print(-2.0 + -3)
    -5.000000
    >>> print((-2.0) + (-3))
    -5.000000
    >>> print(2.0 + -3)
    -1.000000
    >>> print(2.0 + (-3))
    -1.000000

    >>> print(2.0 - 3)
    -1.000000
    >>> print(-2.0 - -3)
    1.000000
    >>> print((-2.0) - (-3))
    1.000000
    >>> print(-2.0 - 3)
    -5.000000
    >>> print((-2.0) - 3)
    -5.000000

    >>> print(2.0 * 3)
    6.000000
    >>> print(-2.0 * -3)
    6.000000
    >>> print(-2.0 * 3)
    -6.000000

    >>> print(2.0 / 3)
    0.666667
    >>> print(-2.0 / -3)
    0.666667
    >>> print(2.0 / -3)
    -0.666667
    >>> print(2.0 / 0)
    .vrepl.v:2:13: division or modulo by zero

    >>> print(2.0 / -1)
    -2.000000
    >>> print(0.0 / 2)
    0.000000
    >>> print(0.0 / -1)
    -0.000000


    >>> print(2 + 3.0)
    <garbage>
    >>> print(-2 + -3.0)
    <garbage>
    >>> print((-2) + (-3.0))
    <garbage>
    >>> print(2 + -3.0)
    <garbage>
    >>> print(2 + (-3.0))
    <garbage>

    >>> print(2 - 3.0)
    <garbage>
    >>> print(-2 - -3.0)
    <garbage>
    >>> print((-2) - (-3.0))
    <garbage>
    >>> print(-2 - 3.0)
    <garbage>
    >>> print((-2) - 3.0)
    <garbage>

    >>> print(2 * 3.0)
    <garbage>
    >>> print(-2 * -3.0)
    <garbage>
    >>> print(-2 * 3.0)
    <garbage>

    >>> print(2 / 3.0)
    <garbage>
    >>> print(-2 / -3.0)
    <garbage>
    >>> print(2 / -3.0)
    <garbage>
    >>> print(2 / 0.0)
    <garbage>
    >>> print(2 / -1.0)
    <garbage>
    >>> print(0 / 2.0)
    <garbage>
    >>> print(0 / -1.0)
    <garbage>

    >>> print(2.3 + 3)
    5.300000
    >>> print(-2.3 + -3)
    -5.300000
    >>> print((-2.3) + (-3))
    -5.300000
    >>> print(2.3 + -3)
    -0.700000
    >>> print(2.3 + (-3))
    -0.700000

    >>> print(2.3 - 3)
    -0.700000
    >>> print(-2.3 - -3)
    0.700000
    >>> print((-2.3) - (-3))
    0.700000
    >>> print(-2.3 - 3)
    -5.300000
    >>> print((-2.3) - 3)
    -5.300000

    >>> print(2.3 * 3)
    6.900000
    >>> print(-2.3 * -3)
    6.900000
    >>> print(-2.3 * 3)
    -6.900000

    >>> print(2.3 / 3)
    0.766667
    >>> print(-2.3 / -3)
    0.766667
    >>> print(2.3 / -3)
    -0.766667
    >>> print(2.3 / 0)
    .vrepl.v:2:13: division or modulo by zero
    >>> print(2.3 / -1)
    -2.300000
    >>> print(0.3 / 2)
    0.150000
    >>> print(0.3 / -1)
    -0.300000


    >>> print(2 + 3.3)
    <garbage>
    >>> print(-2 + -3.3)
    <garbage>
    >>> print((-2) + (-3.3))
    <garbage>
    >>> print(2 + -3.3)
    <garbage>
    >>> print(2 + (-3.3))
    <garbage>

    >>> print(2 - 3.3)
    <garbage>
    >>> print(-2 - -3.3)
    <garbage>
    >>> print((-2) - (-3.3))
    <garbage>
    >>> print(-2 - 3.3)
    <garbage>
    >>> print((-2) - 3.3)
    <garbage>

    >>> print(2 * 3.3)
    <garbage>
    >>> print(-2 * -3.3)
    <garbage>
    >>> print(-2 * 3.3)
    <garbage>

    >>> print(2 / 3.3)
    <garbage>
    >>> print(-2 / -3.3)
    <garbage>
    >>> print(2 / -3.3)
    <garbage>
    >>> print(2 / 0.3)
    <garbage>
    >>> print(2 / -1.3)
    <garbage>
    >>> print(0 / 2.3)
    <garbage>
    >>> print(0 / -1.3)
    <garbage>

.. warning::

   Watch out for incomplete symbols or uncasted types, it'll result in garbage.

   .. code:: v

       // int / int division results in an int
       >>> print(1 / 3)
       0

       // int / float division results in a garbage
       // different between each division
       >>> print(1 / 3.)
       14308928
       >>> print(1 / 3.)
       20928064
       >>> print(1 / 3.0)
       22931008
       >>> print(1 / 3.0)
       28653120

       >>> print(1.0 / 3.0)
       0.333333
