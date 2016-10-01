"""
Created On: 5/13/16

Python access to trueskill library to give us the following functionality:

+ [DONE]: Rating calculation
+ [GTH]: Leaderboard sorting

NOTE: quality of a match seems to be bonkers, I have no idea how it works...
"""

from trueskill.trueskill import Rating, rate_1vs1

__author__ = 'mazyod'


def calculate_ranks(winner, loser, tie):

    p1 = Rating(*winner)
    p2 = Rating(*loser)

    p1, p2 = rate_1vs1(p1, p2, drawn=tie)

    return (p1.mu, p1.sigma), (p2.mu, p2.sigma)


if __name__ == '__main__':
    # quick test
    print(repr(calculate_ranks([1400, 30], [1400, 50], False)))
