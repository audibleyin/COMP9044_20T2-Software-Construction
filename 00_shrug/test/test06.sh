#!/bin/dash
#!/bin/dash
#
# COMP9044 Assignment 01 - test06
#
# test legit branch command 
# 1.wrong params
# 2.correct input
# 3.create brancn, detele branch and recreate branch
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 11/07/2019

# following test will focus on legit-show

rm -rf .legit
rm a
./legit-init
./legit-branch
touch a
./legit-add a
./legit-commit -m commit-0
./legit-branch branch1
./legit-branch branch2
./legit-branch master
./legit-branch
# check wrong input 
./legit-branch -d -d
./legit-branch -d b1
./legit-branch -d branch2
./legit-branch -d master
./legit-branch -d b1
./legit-branch
# delte b1 and the re create branch
./legit-branch b1
./leigt-status

