# Optimal-K

## Overview
`Optimal-K` is an R function to determine the optimal number of clusters in K-Means clustering using the Elbow Method. This function helps users decide the best value of `k` by identifying the elbow point on the WCSS (Within-Cluster Sum of Squares) curve.

## How It Works
The function works by calculating the perpendicular distance of each point on the WCSS curve to the line connecting the first and last points of the curve. The point with the maximum distance is identified as the "elbow," and its corresponding `k` value is returned.

### Function Definition:
```R
find_optimal_k(wcss_values, k_values)
```

![Screenshot 2024-12-06 231351](https://github.com/user-attachments/assets/8f8d667e-33d9-4079-ae00-a3d5d0bd241c)

