# dplace-vagrant

A vagrant configuration to deploy a development virtual machine for [D-PLACE](http://github.com/NESCent/dplace), using Ubuntu 12.04, Ansible, Postgres, and PostGIS.

## Requirements


1. [Vagrant](http://vagrantup.com)
2. [Ansible](http://ansible.com)
3. [VirtualBox](http://virtualbox.org).  

Vagrant and VirtualBox installation packages can be downloaded from their respective websites.  Ansible is a Python package with [many ways to install](http://docs.ansible.com/intro_installation.html).  I use [Homebrew](http://brew.sh) - `brew install ansible`.

These packages are available on many platforms, but I've only tested this on Mac OS X 10.9.



## Getting started

First, You will need to clone the repository and the submodule first:

    git clone git@github.com:dleehr/dplace-vagrant.git
    cd dplace-vagrant
    git submodule init
    git submodule update

With Virtualbox, vagrant, and ansible installed, deploying the virtual machine is done with

    vagrant up

This command takes a while - it's downloading a base virtual machine, installing software packages, loading D-PLACE from the git repo.

Sometimes provisioning fails with `fatal: [192.168.111.222] => SSH encountered an unknown error during the connection.`.  In this case simply retry with `vagrant provision`

## Running/developing D-PLACE

The Vagrantfile configures shared folders and port forwarding, so that you can edit code and access the web application from your host machine (and not the vm).  However, you must SSH to start the application or issue other Django management commands:

    vagrant ssh
    sudo su - dplace_user
    source env_dplace/bin/activate
    python /var/django/dplace/manage.py runserver 0.0.0.0:8000

Port 8000 on the virtual machine is forwarded to port 8010 locally, so visiting [http://127.0.0.1:8010](http://127.0.0.1:8010) should bring up the application.  

Finally vagrant creates a `dplace_src` directory on your host machine.  This directory is synchronized with the D-PLACE code on the virtual machine, so you can use any text editor on your host machine to edit the code.
