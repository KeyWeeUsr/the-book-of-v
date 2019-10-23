.. include:: symbols.rst

.. _ascii_charset: https://en.wikipedia.org/wiki/ASCII#Character_set
.. |ascii_charset| replace:: ``ASCII`` Character set

Types
=====

As per the `official V documentation <https://vlang.io/docs#btypes>`_.

Stores value
------------

Numeric
~~~~~~~

* ``int`` - 32-bit integer

  .. warning::

     Current implementation falls back to pure C ``int`` type which is
     `not always 32-bit <https://stackoverflow.com/a/1231456/5994041>`_.
     See `#2480 <https://github.com/vlang/v/issues/2480>`_ for more.

* ``f32`` - 32-bit floating-point number (see |f32_impl|_)
* ``byte`` - 8-bit unsigned number, the smallest piece of memory which can
  contain basic character set such as |ascii_charset|_ (see |byte_impl|_)
* ``string`` - A read-only, immutable, array of bytes encoded using UTF-8
  (see |string_type|_ for more)

References value
----------------

* ``array`` - structure holding pointers for a value or another pointer (see
  |array_type|_ for documentation and |array_impl|_ for implementation details)
