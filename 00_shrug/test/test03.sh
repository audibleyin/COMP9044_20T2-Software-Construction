#!/bin/dash
#
# COMP9044 Assignment 01 - test03
#
# 1.test add command
# 2.test commit command
# 3.test add two files and show status and logs
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 09/07/2019

rm -rf .legit
rm a b c f g h
./legit-init
touch a b c d e f g h
./legit-add a b c d e f
./legit-commit -m 'first commit'
echo hello > a
echo hello > b
echo hello > c
./legit-add a b
echo world > a
./legit-add g
./legit-status
./legit-log
./legit-add g
./legit-status
./legit-log
