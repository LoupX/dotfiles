.DEFAULT_GOAL := install
MAKEFLAGS = "-s"
SHELL = /bin/bash

install:
	# Install all the dot files
	# Requires privilege escalation because of `fish` tasks
	ansible-playbook main.yml -t homebrew,fish,vim,osx,dotfiles -K

homebrew:
	ansible-playbook main.yml -t homebrew

fish:
	# Requires privilege escalation because of the /etc/shells file
	ansible-playbook main.yml -t fish -K

vim:
	ansible-playbook main.yml -t vim

ssh:
	ansible-playbook main.yml -t ssh

gpg:
	ansible-playbook main.yml -t gpg

osx:
	ansible-playbook main.yml -t osx

dotfiles:
	ansible-playbook main.yml -t dotfiles
