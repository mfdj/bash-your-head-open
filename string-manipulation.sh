#!/usr/bin/env bash


ipjt="It's. Peanut. Butter. Jelly. Time!"

#  An operator (%, %%, #, ##) plus a regex pattern indicate the direction and termination-point 
#  of the string to remove
#
#  %  <-- start removal at back (precent maintains front)
#         works naturally with a pattern that ends with a glob
#
#  #  <-- start removal from front (hash maintains back)
#         works naturally with a pattern that start with a glob

(
    echo 'we have a variable > $ipjt >' "'$ipjt'"
    echo 'it has a chracter length of > ${#ipjt} >' "'${#ipjt}'"
    echo 'remove Butter onward > ${ipjt% Butter*} >' "'${ipjt% Butter*}'"
    echo 'remove up to Butter. > ${ipjt#*Butter. } >' "'${ipjt#*Butter. }'"
    echo 'remove last-space onward > ${ipjt% *} >' "'${ipjt% *}'"
    echo 'remove from after first-space > ${ipjt#* } >' "'${ipjt#* }'"
    echo 'remove from before third-to-last-space > ${ipjt% * * *} >' "'${ipjt% * * *}'"
    echo 'remove from after second-space > ${ipjt#* * } >' "'${ipjt#* * }'"
    echo '2nd through 8th characters > ${ipjt:1:7} >' "'${ipjt:1:7}'"
    echo 'last 9 charactrs > ${ipjt:(-9)} >' "'${ipjt:(-9)}'"

) | column -ts '>'

echo

set -- $ipjt

(
    echo 'now $ipjt is set > $@ >' "'$@'"
    echo 'word length with > ${#@} >' "'${#@}'"
    echo '2nd through 4th words > ${@:2:2} >' "'${@:2:2}'"
    echo 'last word > ${@:(-1)} >' "'${@:(-1)}'"

) | column -ts '>'
