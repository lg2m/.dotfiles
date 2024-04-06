DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SHELL := env PATH=$(PATH) /bin/bash

export XDG_CONFIG_HOME = $(HOME)/.config
# export STOW_DIR = $(DOTFILES_DIR)

all: core-update

core-update:
	apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -f

# stow-install: core-update
	# is-executable stow || apt-get -y install stow

# link: stow-install
