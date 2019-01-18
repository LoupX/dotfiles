# env vars
set -xg fish_greeting '¡Hoal!'

alias c 'z'

if status --is-login
    set -xg SPACEFISH_CHAR_SUFFIX '  '

    set -xg PYENV_ROOT $HOME/.pyenv
    set -xg PIPENV_DEFAULT_PYTHON_VERSION 3.6
    set -xg DEVPI_DIA "https://devpi.dia.com/datateam/releases/+simple"
    set -xg PIP_EXTRA_INDEX_URL $DEVPI_DIA https://pypi.python.org/simple

    set -l PYTHON_LIB_EXEC /usr/local/opt/python/libexec/bin
    set -l POSTGRES_BIN /Applications/Postgres.app/Contents/Versions/latest/bin
    set -l USER_BINS /usr/local/bin
    set -l PYENV_DIR ~/.pyenv
    set -xg PATH $USER_BINS $PYENV_DIR $POSTGRES_BIN $PYTHON_LIB_EXEC $PATH
end

set -xg GPG_TTY (tty)

# TODO: Simplify this
if test -f /usr/local/share/chtf/chtf.fish
    source /usr/local/share/chtf/chtf.fish
    chtf 0.11.7
end
