.. _v_github: https://github.com/vlang/v
.. |v_github| replace:: V repository

Installation
============

Prerequisities
--------------

* Internet connection
* Git (2.17.1)
* Docker (19.03.2)

.. note::

   These are versions are mine, but older ones should work too for simple
   cloning and building Docker image.

Cloning, compiling and building
-------------------------------

To ensure the same environment everywhere we'll use Docker and the default
``Dockerfile`` from the |v_github|_. Current version is fetched `this commit
<https://github.com/vlang/v/tree/2880baa1bc2730519f3ce01e5f18b7a4363206b8/>`_.

.. code:: Dockerfile

   #same container that golang use
   FROM buildpack-deps:buster-curl

   LABEL maintainer="ANAGO Ronnel <anagoandy@gmail.com>"
   WORKDIR /opt/vlang
   RUN apt-get update && \
       DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends gcc clang make git && \
       apt-get clean && rm -rf /var/cache/apt/archives/* && \
       rm -rf /var/lib/apt/lists/*
   COPY . .
   RUN make && \
       ln -s /opt/vlang/v /usr/local/bin/v

   CMD [ "bash" ]

Download it with cloning the repo first:

.. code:: shell

    git clone https://github.com/vlang/v
    # or
    git clone git@github.com:vlang/v

Then proceed to building the Docker image locally. During the building process
one of the instructions is ``make`` which compiles V in that Docker image. Once
it's built, create a container and enter it:

.. code:: shell

    docker build --tag vlang .
    docker run --interactive --tty --name vlang-cont vlang

Your console should now look similar to this:

.. code:: shell

    root@16b5a9d05074:/opt/vlang#

The environment you entered is an isolated part of your system which contains
a V installation:

.. code:: shell

    root@16b5a9d05074:/opt/vlang# v --version
    V 0.1.21 b51b885
