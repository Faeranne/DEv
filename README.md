#DEv

DEv is a docker based clean room development environment.  By using docker images, you'll be able to clone your dev environment anywhere.

And by using docker volumes, you'll always start with a clean container, while still retaining your git repos.

##Install
----
To install DEv is simple.  You'll need 2 pre-requisites. `make` and `docker`

It also helps to add your account to the `docker` group, but if there are security concerns, you can still run `runDev` as sudo.

To install DEv, just run `make build`. this will build and install the
docker images.

##Use
----
To use DEv is simple.  `cleanDev` will start your persistant dev environment. `runDev` will launch it.

You can re-run `cleanDev` to reset your dev environment.  this will purge all
changes to anything linked to `~/.persistant`.

##Directories
----
To help maintain a clean environment, only certain directories are persisted in the container.  All of these directories link to `.persistant`.

To add a directory to this, edit the top-level Docker file to link a file/folder to
`.persistant`.

Files included in persistance are:
* `src` - source code for working projects
* `.config` - config for google-cloud-sdk

This means that to fix most env errors is as simple as `exit` && `runDev`.
