#!/bin/dash
#
# COMP9044 Assignment 01 - test10
#
# 1.test multi branches merge
# 2.test sub branch to merge sub branch
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 14/07/2019

# following test will focus on legit-branch

rm -rf .legit
./legit-init
# Initialized empty legit repository in .legit
seq 1 7 >7.txt
./legit-add 7.txt
./legit-commit -m commit-0
# Committed as commit 0
./legit-branch b1
./legit-checkout b1
# Switched to branch 'b1'
perl -pi -e s/2/42/ 7.txt
./legit-commit -a -m commit-1
# Committed as commit 1
./legit-checkout master
# Switched to branch 'master'
perl -pi -e s/2/24/ 7.txt
./legit-commit -a -m commit-2
# Committed as commit 2
./legit-merge b1 -m merge-message
# legit-merge: error: These files can not be merged:
# 7.txt
./legit-log

./legit-branch b02
./legit-checkout b02
perl -pi -e s/7// 7.txt
./legit-commit -a -m commit-2
./legit-checkout master
./legit-merge b02 -m "delete lines"
./legit-log

./legit-branch b03
./legit-checkout b03
echo 8 >> 7.txt
./legit-commit -a -m commit-3
./legit-checkout master
./legit-merge b03 -m "add lines"
./legit-log
