#! /bin/bash
git add manifests/$1
git commit -m 'Udpated code'
git tag -a $2 -m "Created new tag"
git push origin master tag $2 --verbose
