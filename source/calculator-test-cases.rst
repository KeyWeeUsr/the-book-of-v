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

    >>> print(10 - (12 / 8) + 7 / 12 + 11)
    20

    >>> print(10.0 - (12.0 / 8.0) + 7.0 / 12.0 + 11.0)
    20.083333

    >>> print(8 + 2 - (11 / 4) * 6 + 3)
    1

    >>> print(8.0 + 2.0 - (11.0 / 4.0) * 6.0 + 3.0)
    -3.500000

    >>> print(2 * 2 + 11 * 4 - (10 + 6))
    32

    >>> print(2.0 * 2.0 + 11.0 * 4.0 - (10.0 + 6.0))
    32.000000

    >>> print(3 + (2 / 5 * 5 - 6 / 3))
    1

    >>> print(3.0 + (2.0 / 5.0 * 5.0 - 6.0 / 3.0))
    3.000000

    >>> print(7 - 10 * 2 - 4 * (6 - 9))
    -1

    >>> print(7.0 - 10.0 * 2.0 - 4.0 * (6.0 - 9.0))
    -1.000000

    >>> print(5 - (8 * 6 / 6 * 7) / 7)
    -3

    >>> print(5.0 - (8.0 * 6.0 / 6.0 * 7.0) / 7.0)
    -3.000000

    >>> print(6 + 9 / 10 - (10 / 6) + 3)
    8

    >>> print(6.0 + 9.0 / 10.0 - (10.0 / 6.0) + 3.0)
    8.233333

    >>> print(10 / (10 + 2 / 10) - 10 + 11)
    2

    >>> print(10.0 / (10.0 + 2.0 / 10.0) - 10.0 + 11.0)
    1.980392

    >>> print(7 * 3 / 8 - 5 + (5 * 9))
    42

    >>> print(7.0 * 3.0 / 8.0 - 5.0 + (5.0 * 9.0))
    42.625000

    >>> print(2 - (2 / 8 - 7 / 2 * 4))
    14

    >>> print(2.0 - (2.0 / 8.0 - 7.0 / 2.0 * 4.0))
    15.750000

    >>> print(7 + (6 * 5^2 + 3))
    34

    >>> import math
    >>> print(7 + (6 * math.pow(5, 2) + 3))
    <garbage>

    >>> print(7.0 + (6.0 * math.pow(5.0, 2.0) + 3.0))
    160.000000

    >>> print(20 * 2 - (1/2) * 9.8 * 2^2)
    <C error>  // should produce a negative int

    >>> print(20.0 * 2.0 - (1.0/2.0) * 9.8 * 2^2)
    >>> print(20.0 * 2.0 - (1.0/2.0) * 9.8 * 2.0^2.0)
    >>> print(20.0 * 2.0 - (1.0/2.0) * 9.8 * (2.0^2.0))
    .vrepl.tmp.c:5342: error: invalid operands for binary operation
    // <error due to float ^ int or float ^ float>

    >>> print(20 * 2 - (1/2) * 9.8 * (2^2)))
    <garbage>  // should be 40

    >>> print(20.0 * 2.0 - (1.0/2.0) * 9.8 * (2^2))
    40.000000

    >>> print(20.0 * 2.0 - (1.0/2.0) * 9.8 * math.pow(2, 2))
    20.400000

    >>> print(4^3^2)
    5

    >>> print(math.pow(4, math.pow(3, 2)))
    262144.000000

    >>> print(4^(3^2))
    5

    >>> print(math.pow(math.pow(4, 3), 2))
    4096.000000

.. warning::

   Watch out for incomplete symbols or uncasted types, it'll result in garbage.

   .. code:: v

       // int / int division results in an int
       >>> print(1 / 3)
       0

       // int / float division results in an integer-like garbage
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
