# set user PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set ssh env_vars
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket

# Set pass default store
export PASSWORD_STORE_DIR=${HOME}/.password-store
