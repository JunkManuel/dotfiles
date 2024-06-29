if [ -f "/bin/nvim" ] ; then
    export VISUAL=nvim
    export EDITOR=nvim
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
