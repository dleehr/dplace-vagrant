# dplace-vagrant

A vagrant configuration to deploy a development virtual machine for [D-PLACE](http://github.com/NESCent/dplace-models), using Ubuntu 12.04, Ansible, Postgres, and PostGIS

## Requirements

[Vagrant](http://vagrantup.com) and [Ansible](http://ansible.com) are required, as well as [VirtualBox](http://virtualbox.org).

## Getting started

First, You will need to clone the repository and the submodule first:

    git clone git@github.com:dleehr/dplace-vagrant.git
    cd dplace-vagrant
    git submodule init
    git submodule update

With Virtualbox, vagrant, and ansible installed, deploying the virtual machine is done with

    vagrant up

This command takes a while - it's downloading a base virtual machine, installing software packages, loading D-PLACE from the git repo. 

## Running/developing D-PLACE

The Vagrantfile configures shared folders and port forwarding, so that you can edit code and access the web application from your host machine (and not the vm).  However, you must SSH to start the application or issue other Django management commands:

    vagrant ssh
    sudo su - dplace_user
    source env_dplace/bin/activate
    python /var/django/dplace/manage.py runserver 0.0.0.0:8000

Port 8000 on the virtual machine is forwarded to port 8010 locally, so visiting [http://127.0.0.1:8010](http://127.0.0.1:8010) should bring up the application.  

Finally, The `dplace_src` directory on your host machine is synchronized with the virtual machine, so you can use any text editor on your host machine to edit the code.
