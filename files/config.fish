alias c 'z'

if status --is-login
    # Unix stuff
    set -xg LANG en_US
    set -xg EDITOR vim

    # Fish Theme
    set -xg fish_greeting 'Welcome Neo 🖥'
    set -xg SPACEFISH_CHAR_SUFFIX '  '

    # GPG & git fix
    set -xg GPG_TTY (tty)

    # Go stuff
    set -l GOPATH $HOME/dev/go
    set -l GOBIN $GOPATH/bin
    mkdir -p $GOPATH
    set -xg GOPATH $GOPATH

    # Python Stuff
    set -xg PYENV_ROOT $HOME/.pyenv
    set -xg PIPENV_DEFAULT_PYTHON_VERSION 3.7
    set -xg PIPENV_SHELL_FANCY 1
    set -xg WORKON_HOME $PYENV_ROOT

    # Binaries
    set -l POSTGRES_BIN /Applications/Postgres.app/Contents/Versions/latest/bin
    set -l PYTHON_LIB_EXEC /usr/local/opt/python/libexec/bin
    set -xg GOBIN $GOBIN

    set -e fish_user_paths
    set -U fish_user_paths $GOPATH/bin $POSTGRES_BIN

    if type -q direnv
        direnv hook fish | source
    end
end

function __node_binpath_cwd --on-variable PWD
  set -l node_modules_path "$PWD/node_modules/.bin"
  if test -e "$node_modules_path"
    set -g __node_binpath "$node_modules_path"
    set -U fish_user_paths $fish_user_paths $__node_binpath
  else
    set -q __node_binpath
      and set -l index (contains -i -- $__node_binpath $fish_user_paths)
      and set -e fish_user_paths[$index]
      and set -e __node_binpath
  end
end

function __python_venv_path --on-event fish_prompt
  if test -n "$PIPENV_ACTIVE"
    set -l venv_path (pipenv --venv)
    set -U fish_user_paths "$venv_path/bin" $fish_user_paths
  else
    set -e fish_user_paths
    set -U fish_user_paths $GOPATH/bin $POSTGRES_BIN
  end
end

__node_binpath_cwd $PWD
