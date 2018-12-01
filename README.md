# .dotfiles [![Build Status](https://travis-ci.org/inkatze/dotfiles.svg?branch=master)](https://travis-ci.org/inkatze/dotfiles)

Installs almost everything I need in my local environment. It's unlikely that you want your
setup exactly as mine; feel free to fork it or change the variables described below.

## Requirements

- Homebrew
- Ansible 2.7+
- Xcode or Xcode command line tools

## Quickstart

If you just want to know what you need to install, change and run to get things started,
this is what you're looking for.

### TL;DR

This means you want your Mac setup EXACTLY as mine (- my keys). You're weird, but as you wish:

```bash
# Unless you have a brand new installation, or never touched the terminal before
# this is likely to fail, but is safe to run if you're unsure.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
xcode-select --install

# This is the good stuff
brew update
brew install ansible
git clone https://github.com/inkatze/dotfiles.git
make
```

### Installing dependencies

Before running anything, make sure you have installed all requirements. Follow the instructions
from [homebrew's home page](https://brew.sh/) and run:

```bash
brew update
brew install ansible
xcode-select --install  # This might fail if already installed
git clone https://github.com/inkatze/dotfiles.git
```

From now on, assume everything is run inside the root of the repository.

### What should be changed?

You should take a look at the [default variables](defaults/main.yml) and change the values for
the tools, files or settings you want in your environment. You can find a full reference of
the variables used in this role in the `Role variables` section

You can do that by adding those values to the [vars file](playbook/vars.yml) in the example
playbook.

Finally, you can place your custom files (if any) anywhere inside the role, as long as the relative
path matches with the one defined in the correct variable. More about this in the variables section.
I put mine in the [playbook directory](playbook) in case that's useful for you.

### How do I run it

There's a convenient (Makefile)[Makefile] which defines all possible tasks that can be run using
this role. You can directly use the ansible command you want, all it does is to run persist all
available ansible tags

If this wasn't run on a fresh install, is possible that some tasks don't finish successfully. Don't
forget to restart after an initial installation (or log out and into your session).

The examples assume you have added your files and setup a custom [vars file](playbook/vars.yml).
If you're an advanced Ansible user, you should check out the [playbook directory](playbook) and go
from there.

```bash
# Examples

# make and make install run everthing
make

# install fish stuff
make fish

# update or install your dotfiles
make dotfiles

# check the rest of the Makfile rules, should be clearer after reading the docs.
cat Makefile
```

## Tasks and variables

To make things easier to understand, variables will be explained within the context of the task
using them.

### Homebrew

Installs all packages and cask applications required for the environment.

- `homebrew_taps`: List of taps to install applications that need a different source.
- `basic_tools`: List of packages that can be installed with `brew install`.
- `homebrew_cask_applications`: List of OS X applications that can be installed using `brew cask install`.
- `programming_environments`: List of programming environments to be installed using `brew install`.
- `vim_dependencies`: List of packages to be installed with `brew install` required by vim to work correctly.

### Fish

Changes the default login shell to fish instead of bash.

- `fish_plugins`: List of plugins to be installed to the fish shell.

### Vim

The true editor.

- `vim_plugins`: List of key-value pairs with the `name` of the plugin and the `repo`'s url.'

### SSH

Copy your ssh keys and configuration to your local machine.

- `ssh_keys`: List of relative paths to your ssh private and public keys.
- `ssh_config`: Relative path to the file with your ssh configuration.

### GPG

Imports your GPG keys to your local machine.

- `gpg_public_key`: Relative path to the file with your gpg public key.
- `gpg_private_key`: Relative path to the file with your gpg private key.

### OS X

Updates OS X configuration defaults to match your preferences. Things like how to right click,
region, language and so on.

- `osx_defaults`: List of key-value pairs with the parameters used by the [osx_defaults][osx_defaults] ansible module.

### Dotfiles

Copy your dotfiles to the predefined directories.

- `fish_config_path`: Relative path to the fish configuration file.
- `gitconfig_path`: Relative path to the gitconfig file.
- `vimrc_path`: Relative path to the vimrc configuration file.

## License

BSD


[osx_defaults]: https://docs.ansible.com/ansible/2.6/modules/osx_defaults_module.html "osx_defaults Ansible module docs"
