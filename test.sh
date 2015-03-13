#!/bin/sh
set -x

#
# Google Code to GitHub by Michael Jentsch m.jentsch@web.de (MIT)
#

USERNAME={YOUR USER NAME}

# https://help.github.com/articles/creating-an-access-token-for-command-line-use/
TOKEN={YOUR ACCESS TOKEN}

REPONAME={YOUR REPOSITORY}


URL=https://$USERNAME:$TOKEN@github.com/$USERNAME/$REPONAME.git

svn checkout http://$REPONAME.googlecode.com/svn/trunk/ $REPONAME

cd $REPONAME

rm -rf .svn/
curl -u "$USERNAME:$TOKEN" https://api.github.com/user/repos -d '{"name":"'$REPONAME'"}'

git init
git add .
git commit -m 'Google Code to GitHub'
git remote add origin $URL
git remote -v
git push origin master

