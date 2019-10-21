.. include:: symbols.rst

Types
=====

As per the `official V documentation <https://vlang.io/docs#btypes>`_.

Stores value
------------

Numeric
~~~~~~~

* ``int`` - 32-bit integer
* ``f32`` - 32-bit floating-point number (see |f32_impl|_)
* ``string`` - A read-only, immutable, array of bytes encoded using UTF-8
  (see |string_type|_ for more)

References value
----------------

* ``array`` - structure holding pointers for a value or another pointer (see
  |array_type|_ for documentation and |array_impl|_ for implementation details)
