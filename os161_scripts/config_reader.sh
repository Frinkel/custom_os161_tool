#!/bin/sh

# FROM: https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
sed_escape() {
  sed -e 's/[]\/$*.^[]/\\&/g'
}

cfg_write() { # path, key, value
  cfg_delete "$1" "$2"
  echo "$2=$3" >> "$1"
}

cfg_read() { # path, key -> value
  test -f "$1" && grep "^$(echo "$2" | sed_escape)=" "$1" | sed "s/^$(echo "$2" | sed_escape)=//" | tail -1
}

cfg_delete() { # path, key
  	test -f "$1" && sed -i '.delme' "/^$(echo $2).*$/d" "$1"
  	rm "$1.delme"
}

cfg_haskey() { # path, key
  test -f "$1" && grep "^$(echo "$2" | sed_escape)=" "$1" > /dev/null
}