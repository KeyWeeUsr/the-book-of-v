.. include:: symbols.rst

.. _ascii_charset: https://en.wikipedia.org/wiki/ASCII#Character_set
.. |ascii_charset| replace:: ``ASCII`` Character set

Types
=====

As per the `Basic types (official V documentation)
<https://vlang.io/docs#btypes>`_.

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
* ``bool`` - numeric type using ``false`` as negative value and ``true`` as
  positive (currently inherited from C implementation)

Textual
~~~~~~~

* ``string`` - A read-only, immutable, array of bytes encoded using UTF-8
  (see |string_type|_ for more)

References value
----------------

* ``array`` - structure holding pointers for a value or another pointer (see
  |array_type|_ for documentation and |array_impl|_ for implementation details)


``Option`` type
---------------

As per the `Option types & error handling (official V documentation)
<https://vlang.io/docs#option>`_.

This kind of type is created by a ``?`` (question mark) prefix before an
ordinary type such as |string_type|_ or an ``int`` resulting in a ``?string``
return type for a function. This allows you to either return a correct value
for this type or mark the result of a function as a failure by using
``return none`` which forces the function caller to handle such a case with
either a compile error ``unhandled option type: `?type``` when you try to
access the value or a compile error saying this type does not have a method
for performing a certain action.

For example:

.. code:: v

    import os
    content := os.read_file(<path>)
    println(content)

does not compile due to ```?string` needs to have method `str() string` to be
printable``, however a conversion to |string_type|_ i.e. accessing the value
of ``?string`` type falls back to the original ``unhandled option type`` error.

.. code:: v

    import os
    content := os.read_file(<path>)
    println(content.str())

Allowed :doc:`keywords <keywords>`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default an optional type is handled by an ``or`` block such as this:

.. code:: v

    import os
    content := os.read_file(<path>) or {
        // handle function failure
    }
    println(content.str())

and it allows only specific set of :doc:`keywords <keywords>`:

* ``return``
* ``exit``
* ``continue``
* ``break``
* ``panic``
