#!/usr/bin/env python3.3

"""
class Rabbit(object):
    def __init__(self):
        self._age = 0

    @property
    def age(self):
        return self._age

    def grow(self):
        self._age += 1

    def is_adult(self):
        return self._age >= 3

def count_rabbits(months):
    r1 = Rabbit()
    r2 = Rabbit()
    rabbits = [r1, r2]

    for month in range(1, months + 1):
        pair = 0
        new_rabbits = []
        for rabbit in rabbits:
            rabbit.grow()
            if not rabbit.is_adult():
                continue
            pair += 1
            if pair >= 2:
                new_rabbits += [Rabbit(), Rabbit()]
                pair = 0
        rabbits = rabbits + new_rabbits

    return len(rabbits)
"""

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

