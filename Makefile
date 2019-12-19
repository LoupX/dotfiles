.DEFAULT_GOAL := install
MAKEFLAGS = "-s"
SHELL = /bin/bash

install:
	# Install all the dot files
	# Requires privilege escalation because of `fish` tasks
	cd playbook && \
	ansible-playbook main.yml -t homebrew,fish,vim,mas,osx,dotfiles -K

homebrew:
	cd playbook && \
	ansible-playbook main.yml -t homebrew

fish:
	# Requires privilege escalation because of the /etc/shells file
	cd playbook && \
	ansible-playbook main.yml -t fish -K

vim:
	cd playbook && \
	ansible-playbook main.yml -t vim

ssh:
	cd playbook && \
	ansible-playbook main.yml -t ssh

gpg:
	cd playbook && \
	ansible-playbook main.yml -t gpg


mas:
	cd playbook && \
	ansible-playbook main.yml -t mas

osx:
	cd playbook && \
	ansible-playbook main.yml -t osx

dotfiles:
	cd playbook && \
	ansible-playbook main.yml -t dotfiles
