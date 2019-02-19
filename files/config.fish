alias c 'z'

if status --is-login
    # Fish Theme
    set -xg fish_greeting '¡Hoal!'
    set -xg SPACEFISH_CHAR_SUFFIX '  '

    # GPG & git fix
    set -xg GPG_TTY (tty)

    # Go stuff
    set -l GOPATH $HOME/dev/go
    set -l GOBIN $GOPATH/bin
    mkdir -p $GOPATH
    set -xg GOPATH $GOPATH

    # Python Stuff
    set -l DEVPI_HOST devpi.dia.com
    set -xg PYENV_ROOT $HOME/.pyenv
    set -xg PIPENV_DEFAULT_PYTHON_VERSION 3.6
    set -xg PIPENV_SHELL_FANCY 1
    set -xg DEVPI_DIA "https://$DEVPI_HOST/datateam/releases/+simple"
    set -xg PIP_EXTRA_INDEX_URL $DEVPI_DIA
    set -xg PIP_TRUSTED_HOST $DEVPI_HOST

    # Binaries
    set -l POSTGRES_BIN /Applications/Postgres.app/Contents/Versions/latest/bin
    set -l PYTHON_LIB_EXEC /usr/local/opt/python/libexec/bin
    set -xg GOBIN $GOBIN
    set -xg fish_user_paths $GOPATH/bin $POSTGRES_BIN $PYTHON_LIB_EXEC $PYENV_ROOT $fish_user_paths
    echo "Fish user path set" $fish_user_paths

    # TODO: Simplify this
    if test -f /usr/local/share/chtf/chtf.fish
        source /usr/local/share/chtf/chtf.fish
        chtf 0.11.7
    end
end

# Quick fix to a pipenv bug
set -xg fish_user_paths $VIRTUAL_ENV/bin $fish_user_paths
