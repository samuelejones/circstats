# circstats
R functions to perform circular statistics

The scripts define the arc containing all points by calculating the shortest arc length that contains all the points. The scripts then rotate the arc so that all points are contained within the same periodic window and calculates simple statistics. For the min, max and mean, the values are then rotated back by the original amount (and then the modulo taken) in order to get the correct values.

This repository contains the following scripts:

circ.diff.R - calculates the distance between two points on the circle with circumference "int"

circ.min.R - determines which value is the minimum on the arc containing all points

circ.max.R - determines which values is the maximum on the arc containing all points

circ.mean.R - calculates the mean of all the points on the arc containing all points

circ.range.R - calculates difference between min and max

circ.var.R - calculates the variance of points on the arc


These functions have not been extensively tested so please let me know if there are any cases for which they fail to produce the correct value. Please feel free to modify these scripts if you see ways in which they can improved.
  
