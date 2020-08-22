#!/bin/dash
#
# COMP9044 Assignment 01 - test04
#
# test legit-commit input params
# test rm files and -a append
# test show input params
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 09/07/2019

# following test will focus on check input params

rm -rf .legit
./legit-init
echo hello > a
# cant not add commit
# the following cant not commit
./legit-add a b
./legit-commit 
./legit-commit 1
./legit-commit 1 2
./legit-commit 1 2 3
./legit-commit -a
./legit-commit -a 1
./legit-commit -a 1 2
./legit-commit -a -m
./legit-commit -m
./legit-commit -m -m
# the following show nothing commit
./legit-commit -m first

./legit-add a
./legit-commit -m "test"

# wrong show message
./legit-show
./legit-show :
./legit-show -0:a
./legit-show -0:
./legit-show -a:a






