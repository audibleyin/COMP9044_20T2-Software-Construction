#!/usr/bin/python3
import fileinput,re, collections

count = collections.defaultdict(int)
for line in fileinput.input():
    for word in re.findall(r'\w+', line.lower()):
        count[word] += 1

words = count.keys()

sorted_words = sorted(words,  key=lambda w: count[w])

for word in sorted_words:
    print("%8d %s" % (count[word], word))
