#!/usr/bin/env python3
# By Migdal
# https://stepik.org/lesson/541851/step/2?unit=535312
from sys import argv
import numpy as np
from collections import defaultdict

inp = argv[1]
with open(inp) as handle:
    header = handle.readline()
    line = handle.readline().strip()
    i = 0
    states = {} 
    while line:
        if (line.count(" ")):
            if (i):
                arr = np.packbits(arr, axis=0)
                s = 1
                for val in np.nditer(arr):
                    val = int(val)
                    if not states.has_key(val):
                        states[val] = s
                        s += 1
                print len(states)
                translation = [str(states[int(a)]) for a in np.nditer(arr)]
                print " ".join(translation)
                states = {}
            n, l = [int(val) for val in line.split(" ")]
            arr = np.zeros((n, l), dtype=int)
            i = 0
        else:
            arr[i,] += np.array(list(line), dtype=int)
            i += 1
        line = handle.readline().strip()
    s = 1
    for val in np.nditer(arr):
        val = int(val)
        if not states.has_key(val):
            states[val] = s
            s += 1
    print len(states)
    translation = [str(states[int(a)]) for a in np.nditer(arr)]
    print " ".join(translation)

