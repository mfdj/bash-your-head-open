#!/usr/bin/env bash

echo "before-script: '$(shopt -p nullglob)'"

cat << "EOF" > ./nullglobinchildscript.sh
#!/usr/bin/env bash
echo
echo 'now inside-script'
echo '"ls asdf*" without nullglob'
ls asdf*

shopt -s nullglob
echo
echo "'$(shopt -p nullglob)'"

echo
echo '"ls asdf*" with nullglob'
ls asdf*
EOF

chmod u+x nullglobinchildscript.sh

./nullglobinchildscript.sh
rm nullglobinchildscript.sh

echo
echo "after-script: '$(shopt -p nullglob)'"
