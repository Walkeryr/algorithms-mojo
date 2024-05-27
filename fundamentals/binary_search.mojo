"""
 *  Compilation:  mojo build binary_search.mojo
 *  Execution:    ./binary_search allowlist.txt < input.txt
 *  Dependencies: reader.mojo
 *  Data files:   https://algs4.cs.princeton.edu/11model/tinyAllowlist.txt
 *                https://algs4.cs.princeton.edu/11model/tinyText.txt
 *                https://algs4.cs.princeton.edu/11model/largeAllowlist.txt
 *                https://algs4.cs.princeton.edu/11model/largeText.txt
 *
 *  % ./binary_search tinyAllowlist.txt < tinyText.txt
 *  50
 *  99
 *  13
 *
 *  % ./binary_search largeAllowlist.txt < largeText.txt | more
 *  499569
 *  984875
 *  295754
 *  207807
 *  140925
 *  161828
 *  [367,966 total values]
"""

from algorithm.sort import sort
from collections import List

from reader import Reader

fn rank(key: Int, borrowed a: List[Int]) -> Int:
    var lo = 0
    var hi = len(a) - 1

    while lo <= hi:
        var mid = lo + (hi - lo) // 2

        if key < a[mid]:
            hi = mid - 1
        elif key > a[mid]:
            lo = mid + 1
        else:
            return mid

    return -1

fn main():
    from sys import argv

    var args = argv()

    if len(args) <= 1:
        print("No arguments were provided.") 

    var whitelist: List[Int]
    try:
        var reader = Reader(args[1])
        whitelist = reader.read_all_ints()
    except error:
        print("Error reading integers from file:", error)
        return

    sort(whitelist)

    var test_values: List[Int]
    try:
        var reader = Reader("/dev/stdin")
        test_values = reader.read_all_ints()
    except error:
        print("Error reading integers from stdin:", error)
        return

    for value in test_values:
        if rank(value[], whitelist) == -1:
            print(value[])
