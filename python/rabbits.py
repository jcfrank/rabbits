#!/usr/bin/env python3.3

"""
2
2
2
4
6
8
12
18
26
...
f(n) = f(n-1) + f(n-3)
"""

# It's similar to fibonacci, but somewhat different.
# recursive version
def rabbits_recur(months):
    if months <= 2:
        return 2
    else:
        return rabbits_recur(months - 1) + rabbits_recur(months - 3)

# tail recursive. Meaningless in Python, but better for languages support tail recursive elimination.
def rabbits_tail_recur(months):
    return _do_tail_recur(months, 2, 2, 0)

def _do_tail_recur(months, one_month, two_month, adults):
    if months == 0:
        return adults + one_month
    elif months == 1:
        return _do_tail_recur(months - 1, 0, 0, adults + one_month)
    elif months == 2:
        return _do_tail_recur(months - 1, 0, adults, adults + one_month)
    else:
        return _do_tail_recur(months - 1, adults, one_month, adults + two_month)

# iterative
def count_rabbits_2(months):
    new_rabbits = 2
    m1_rabbots = 0
    m2_rabbits = 0
    adult_rabbits = 0

    for month in range(months):
        adult_rabbits += m2_rabbits
        m2_rabbits = m1_rabbots
        m1_rabbots = new_rabbits
        new_rabbits = adult_rabbits
    return adult_rabbits + m2_rabbits + m1_rabbots + new_rabbits

# Main
if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Please give the number of months.")
        exit()
    months = int(sys.argv[1])
    print("Number of rabbits: %d" % count_rabbits_2(months))

