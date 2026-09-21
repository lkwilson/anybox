for fn in "$HOME/.config/bashrc/"*; do
  if [ -r "$fn" ]; then
    . "$fn"
  fi
done

# don't load any auto added stuff
return
