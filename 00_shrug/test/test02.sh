#!/bin/dash
#
# COMP9044 Assignment 01 - test02
#
# 1.test add commit show log
# 2.test legit-show input params
# 3.test rm files and -a append
# 4.test show input params
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 09/07/2019

# following test will focus on legit-show

rm -rf .legit
./legit-init
echo hello > a
# cant not add commit
# the following cant not commit
./legit-add a b
./legit-add a
# the following show nothing commit
./legit-commit -m first
echo word > a
./legit-add a
./legit-commit -m "test"

# wrong show message
./legit-show
./legit-show :
./legit-show -0:a
./legit-show -0:
./legit-show -a:a
./legit-log






