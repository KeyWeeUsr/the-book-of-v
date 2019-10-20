.. _v_github: https://github.com/vlang/v
.. |v_github| replace:: V repository

.. _docker_push_pull: https://docs.docker.com/ee/dtr/user/manage-images/pull-and-push-images/
.. |docker_push_pull| replace:: pushing and pulling Docker images

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

Download it with cloning the repo first (currently ``b51b885``):

.. code:: shell

    git clone https://github.com/vlang/v
    # or
    git clone git@github.com:vlang/v

Then proceed to building the Docker image locally. During the building process
one of the instructions is ``make`` which compiles V in that Docker image. Once
it's built, create a container and enter it:

.. code:: shell

    docker build --tag vlang .
    docker run --interactive --tty vlang

Your console should now look similar to this:

.. code:: shell

    root@16b5a9d05074:/opt/vlang#

The environment you entered is an isolated part of your system which contains
a V installation:

.. code:: shell

    root@16b5a9d05074:/opt/vlang# v --version
    V 0.1.21 b51b885

By default the whole environment is isolated, but that prevents us from adding
or editing files from an editor that's not installed in the Docker image. For
that we will use mounting of a host directory into the container so we can:

#. Edit the files on the OS with an editor of own choice
#. Compile and run them in a consistent and reproducible environment

We will also use shortened flags for docker instead of writing e.g.
``--interactive`` in full.

.. code:: shell

    docker run -i -t -v $(pwd):/opt/src -w /opt/src vlang

This command will run the Docker container from ``vlang`` image in an
``interactive`` mode, will allocate a ``tty`` for it, make visible
the directory you are in (``pwd``) to the container at location ``/opt/src``
and change the default working directory to the project location: ``/opt/src``.

.. note::

   Once you have built the Docker image, you can navigate to any folder on your
   computer and run the command above. This is helpful if you have multiple
   projects because it'll bring the consistent environemnt with you wherever
   you go.

   In case you make some changes to the ``Dockerfile``, it's nice to have it
   always available even between multiple machines. You can do that with
   |docker_push_pull|_.
