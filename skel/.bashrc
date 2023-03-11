for fn in "$HOME/.config/bashrc/"*; do
  if [ -r "$fn" ]; then
    . "$fn"
  fi
done

