# Set global as to whether bash is being run interactively.
case $- in
    *i*) interactive=yes;;
      *) interactive=no;;
esac

# All non hidden files in .bashrc.d are considered for sourcing. In interactive
# mode, all are sourced. In non-interactive mode, only those containing 
# '*nonint*' will be sourced. In non-interactive mode, an env var, interactive,
# will be set to 'no'. This is to differentiate interactive from non-interactive
# within the script.
bashrc_d_loc="$HOME/.bashrc.d"
if [ -d "$bashrc_d_loc" ]; then
    function handle_bashrc_dir() {
        if [ $interactive == yes ]; then
            bashrcs=("$1"/*)
        else
            bashrcs=("$1"/*nonint*)
        fi
        for bashrc in "${bashrcs[@]}"; do
            file_name="$(basename "$bashrc")"
            if [ ! -e "$bashrc" ]; then
                continue
            elif [ -d "$bashrc" ]; then
                handle_bashrc_dir "$bashrc"
            elif [ -r "$bashrc" ]; then
                source "$bashrc"
            fi
        done
    }
    handle_bashrc_dir "$bashrc_d_loc"
    unset handle_bashrc_dir
fi

unset interactive
