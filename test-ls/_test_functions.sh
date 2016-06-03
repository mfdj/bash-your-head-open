
setup() {
  mkdir sandbox 2> /dev/null
}

write_file() {
  echo "$1" > sandbox/$1
}

slow_write() {
  sleep 1
  echo "$1" > sandbox/$1
}

test_ls() {
  [[ $# == 0 ]] && ls sandbox/ || ls "$@" sandbox/
}

cleanup() {
  rm -rf sandbox
}
