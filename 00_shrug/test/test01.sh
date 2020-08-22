#!/bin/dash
#
# COMP9044 Assignment 01 - test01
#
# test add non exist file and commit
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 09/07/2019


rm -rf .legit
rm a c d 
./legit-init
echo hello > a
# cant not add commit
./legit-add a b
./legit-commit -m first

# commit ok
./legit-add a
./legit-commit -m second

echo hello c > c
echo hello d > d

./legit-add c d
./legit-commit -m third

# delte file
./legit-status
./legit-log
rm d
./legit-add c d
./legit-commit -m forth
./legit-status
./legit-log



