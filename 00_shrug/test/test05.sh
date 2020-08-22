#!/bin/dash
#
# COMP9044 Assignment 01 - test05
#
# test legit-rm input params
# test rm files and -a append
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
./legit-rm
./legit-rm --force
./legit-rm --force --cached
./legit-rm --force --force
./legit-rm --cached --cached
./legit-rm a -b
# the following show nothing commit
./legit-commit -m first

