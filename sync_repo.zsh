##.title
## ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
##
## 🇽🇾🇿 & Dev
##
## Copyright Ⓒ Robert Mollentze, xyzand.dev
## 
## Licencing details are in the LICENSE file in the root directory.
## 
## ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
##.title~

# Sync this folder with https://github.com/robmllze/_view-foundation. You can
# change 'main' to another branch if necessary.
cd _view
git init
git add .
git commit -m Upstream
git remote remove upstream
git remote add upstream https://github.com/robmllze/_view-foundation.git
git fetch upstream
git merge upstream/main --allow-unrelated-histories --no-edit