#! /usr/bin/python3.7 --

################################################################################
#
# Author:               Alex Hiller
# Year:                 2019
# Program Description:  <++>
#
################################################################################

import pandas as pd
import matplotlib.pyplot as plt
FILENAME = 'battery_log'

"""
Main
"""
def main():
    series = pd.read_csv(FILENAME, header=0)
    series.plot()
    plt.show()


if __name__ == '__main__':
    main()
