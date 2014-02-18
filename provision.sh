#!/bin/sh


# set languages for postgres
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Update packages
# apt-get update

# install packages

# Postgres and PostGIS
# This needs to be updated for postgres 9.3 and postgis 2.
# There's a package at postgres.org for it and info on SO
# http://stackoverflow.com/questions/18696078/postgresql-error-when-trying-to-create-an-extension
apt-get install -y postgresql-server-dev-9.1 postgresql-9.1-postgis

# Git
apt-get install -y git

# Make a user

# Make a directory for dplace

# clone the git repository

# install python

# GeoDjango dependencies
# https://docs.djangoproject.com/en/dev/ref/contrib/gis/install/geolibs/
apt-get install -y binutils libproj-dev gdal-bin

# Python module for Postgresql
apt-get install -y python-psycopg2

# Leaving off here, this is clunky.  Might be worth checking out another provisioner for postgres

# Creation of database and enabling of extension
su - postgres -c "createuser -U postgres -d -S -R dplace_user"
# add an ident line for the dplace user
createdb -U dplace_user dplace

# must be superuser to create extension so do this as postgers
psql -U dplace_user dplace -c "CREATE EXTENSION IF NOT EXISTS postgis;\"
psql -U dplace_user dplace -c "CREATE EXTENSION IF NOT EXISTS postgis_topology;"

# also default ident map will be the same so need to create a password for the dplace user