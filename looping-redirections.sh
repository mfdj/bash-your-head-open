
while read -r LINE; do
  echo "line $LINE"
done <<< "$(git diff-index --cached HEAD~10)"

# http://stackoverflow.com/questions/18423077/while-loop-command-substitution-vs-here-string
# http://superuser.com/questions/342982/is-there-a-binary-safe-triple-less-than-operator-in-bash
# http://stackoverflow.com/questions/6541109/send-string-to-stdin
# http://stackoverflow.com/questions/8428684/multiline-here-string-yields-only-one-line
