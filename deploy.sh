#!/usr/bin/env sh
# abort on errors
set -e
# build
npm run build
# navigate into the build output directory
cd dist

scp index.html 404.html

echo "asyarden.com" >  CNAME
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME
git init
git checkout -b gh-pages
git add -A
git commit -m 'deploy'
git remote add origin git@github.com:yardenas/asyarden.com.git
git push -f origin gh-pages
cd -
