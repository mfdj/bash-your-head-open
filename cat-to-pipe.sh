#!/usr/bin/env bash

mkdir -p .tmp
original=.tmp/tina-lipsum-original
no_vowels=.tmp/tina-lipsum-no-vowels

echo "
- Hi boys. 
- I'm Tina. 
- Everyone touched each other's butts, and it was great. 
- I'm not spooked. 
- What's the next thing after spooked? I'm that. 
- C'mon Dad, just let me bite down on the bean. 
- Dad, you're the best pimp a girl could ever have. 
- This is like watching two monkeys at the puberty zoo. 
- My crotch is itchy. 
- I could go to jail, or hell, or jail-hell. 
- Yeah it's an acquired taste. 
- That I just acquired. 
- I guess she doesn't like wearing clothes. 
- I know how the shark thinks. 
- It's confused. 
- It doesn't know why we want to kill it. 
- It just wants to go home.  
- Give them ridiculous French accents.
" > $original

cat $original | tr -d 'aeiou' > $no_vowels

# does not work as expected - original will be empty
cat $original | tr -d 'aeiou' > $original

# all difference
diff $original $no_vowels
