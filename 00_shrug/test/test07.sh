#!/bin/dash
#!/bin/dash
#
# COMP9044 Assignment 01 - test07
#
# 1.test formal cases to create branch and check out branch
# 2.test checkout no input params
# 3.test checkout the same branch name
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 12/07/2019

# following test will focus on legit-show

rm -rf .legit

./legit-init
# Initialized empty legit repository in .legit
echo hello >a
./legit-add a
./legit-commit -m commit-A
# Committed as commit 0
./legit-branch b1
echo world >>a
./legit-checkout b1
# Switched to branch 'b1'
# test no input for legit-checkout
./legit-checkout
# test checkout the same branch
./legit-checkout master
./legit-status
# a - file changed, changes not staged for commit
./legit-checkout master
./legit-log
# Switched to branch 'master'
./legit-add a
./legit-status
# a - file changed, changes staged for commit
./legit-checkout b1
# Switched to branch 'b1'
./legit-status
# a - file changed, changes staged for commit
./legit-checkout master
# Switched to branch 'master'
./legit-commit -a -m commit-B
./legit-log
# Committed as commit 1
./legit-checkout b1
# Switched to branch 'b1'
./legit-status
# a - same as repo
./legit-checkout master
# Switched to branch 'master'
./legit-status
# a - same as repo
./legit-checkout master
# Switched to branch 'master'
./legit-status
# a - same as repo
