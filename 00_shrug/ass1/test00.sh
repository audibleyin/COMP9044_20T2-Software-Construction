#!/bin/sh

#test for init add commit

#init
./shrug-init

#should output error    shrug-init: error: .shrug already exists
touch a
./shrug-add a
./shrug-commit -m commit-0

#should output nothing to commit

#wrong commit cammand
./shrug-commit -m da dsa dsa da
#output: 2 arguments needed
