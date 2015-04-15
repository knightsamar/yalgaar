#!/bin/bash

git checkout master

git pull --rebase origin master

source ./yalgaar_env/bin/activate

python freeze.py

git checkout gh-pages
git pull origin gh-pages

mv -v ./yalgaar/build/* ./

git add -A --ignore-errors
git commit -m "Deployment on `date -R`"
git push origin gh-pages

rm -fr *

git checkout master
