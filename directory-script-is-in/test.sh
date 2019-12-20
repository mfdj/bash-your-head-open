#!/usr/bin/env bash

mkdir -p 'eh/bees knees'
mkdir -p 'eh/see'

cp aware-of-path.sh eh/
cp aware-of-path.sh 'eh/bees knees/'
cp aware-of-path.sh 'eh/see/'
ln -s see eh/dee

./aware-of-path.sh
./eh/aware-of-path.sh
'./eh/bees knees/aware-of-path.sh'
./eh/dee/aware-of-path.sh
./eh/see/aware-of-path.sh

tree

rm -rf eh
