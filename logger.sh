#!/usr/bin/env bash

message='straight outta of bourne again shell'
logger "$message"
logger -i "$message - with PID?"
logger -t 'custom tag' "$message"
