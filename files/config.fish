# env vars
set -xg fish_greeting '¡Hoal!'

function c
    z $argv
end

if status --is-login
    set -xg SPACEFISH_CHAR_SUFFIX '  '

    set -xg PYENV_ROOT $HOME/.pyenv
    set -xg PIPENV_SHELL_FANCY 1
    set -xg PIPENV_DEFAULT_PYTHON_VERSION 3.6

    set -xg PATH /usr/local/opt/python/libexec/bin $PATH
    set -xg PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
    set -xg PATH /usr/local/bin $PATH
    set -xg PATH ~/.pyenv $PATH
end

set -xg GPG_TTY (tty)

# TODO: Simplify this
if test -f /usr/local/share/chtf/chtf.fish
    source /usr/local/share/chtf/chtf.fish
end
