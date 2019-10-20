.. _v_github: https://github.com/vlang/v
.. |v_github| replace:: V repository

Installation
============

To ensure the same environment everywhere we'll use Docker and the default
``Dockerfile`` from the |v_github|_. Current version is fetched `this commit
<https://github.com/vlang/v/blob/2880baa1bc2730519f3ce01e5f18b7a4363206b8/>`_.

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
