#!/bin/dash
#!/bin/dash
#
# COMP9044 Assignment 01 - test08
#
# 1.test branch checkout and commit
# 2.test branch merge input params
# 3.compare folders before merge
# 4.compare folders after merge
#
# Authors:
# Rui.Mu (z5144248@unsw.edu.au)
#
# Written: 13/07/2019

# following test will focus on legit-branch

#!/bin/dash 
rm -rf .legit
rm a b c d e f
./legit-init
# Initialized empty legit repository in .legit
seq -f "line %.0f" 1 7 >a
seq -f "line %.0f" 1 7 >b
seq -f "line %.0f" 1 7 >c
seq -f "line %.0f" 1 7 >d
./legit-add a b c d
./legit-commit -m commit-0
#Committed as commit 0
./legit-branch b1
./legit-checkout b1
# Switched to branch 'b1'
seq -f "line %.0f" 0 7 >a
seq -f "line %.0f" 1 8 >b
seq -f "line %.0f" 0 8 >c
sed -i 4d d
seq -f "line %.0f" 1 7 >e
./legit-add e
./legit-commit -a -m commit-1
# Committed as commit 1
./legit-checkout master
# Switched to branch 'master'
seq -f "line %.0f" 1 8 >a
seq -f "line %.0f" 0 7 >b
sed -i 4d c
seq -f "line %.0f" 0 8 >d
seq -f "line %.0f" 1 7 >f
./legit-add f
./legit-commit -a -m commit-2
# Committed as commit 2
cat c;
echo "==================="
cat .legit/index/c;
echo "==================="
cat .legit/versions/0/c
echo "==================="
cat .legit/branches/master/c
echo "==================="
cat .legit/branches/b1/c
./legit-merge b1
./legit-merge b1 -m
./legit-merge b1 merge
./legit-merge -m merge
./legit-merge -m -m
./legit-merge -m -m -m
./legit-merge master -m merge1
./legit-merge b1 -m merge1
# Auto-merging a
# Auto-merging b
# Auto-merging c
# Auto-merging d
diff -q .legit/index .legit/branches/master
./legit-commit -a -m commit 3
# Committed as commit 3
./legit-log
# 3 merge1
# 2 commit-2
# 1 commit-1
# 0 commit-0
./legit-status
