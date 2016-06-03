- http://stackoverflow.com/questions/16618071/can-i-export-a-variable-to-the-environment-from-a-bash-script-without-sourcing-i

```
$ cat approach1.sh 
MY_VAR='one'
$ source approach1.sh 
$ echo $MY_VAR
one
```

```
$ cat approach2.sh 
echo MY_VAR='two'
$ eval $(./approach2.sh)
$ echo $MY_VAR
two
```
