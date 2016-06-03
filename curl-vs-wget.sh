#!/usr/bin/env bash

glimpse() {
	echo
	echo "file '$1'"
	head -c 300 "$1"
	echo
	rm "$1"
}

get_url='https://secure.php.net/releases/index.php?json&version=7&max=100'

# all of the following write http-body to a file named 'index.php?json&version=7&max=100'
# --quiet or -q stops progress from being written to STDERR
# -nv is not verbose but stills says the source-url, bytes, and destination-file
wget "$get_url" 2> /dev/null
wget --quiet "$get_url"
#wget -nv "$get_url"
glimpse 'index.php?json&version=7&max=100'

# writes http-body to a file named from_wget
# writes STDERR (progress) to a file named from_wget_log
wget -O from_wget -o from_wget_log "$get_url" 
glimpse from_wget_log
glimpse from_wget

# sends output to STDOUT
# --silent or -s stops progress from being written to STDERR
curl "$get_url" > /dev/null 2>&1
curl --silent "$get_url" > /dev/null

# writes http-body to a file named 'index.php?json&version=7&max=100.1' <-- notice it appends '.1'
curl -o "$get_url"
glimpse 'index.php?json&version=7&max=100.1'

# writes http-body to a file named 'from_curl'
curl -so from_curl "$get_url"
glimpse from_curl
