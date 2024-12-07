
# Function to find the optimal number of clusters for k-means analysis using the Elbow Method

find_optimal_k <- function(wcss_values, k_values) {
  # Check that input lengths match
  if (length(wcss_values) != length(k_values)) {
    stop("The lengths of wcss_values and k_values must be the same.")
  }
  
  # Normalize k_values and wcss_values to calculate distances
  norm_k <- (k_values - min(k_values)) / (max(k_values) - min(k_values))
  norm_wcss <- (wcss_values - min(wcss_values)) / (max(wcss_values) - min(wcss_values))
  
  # Calculate the "elbow" distance for each point
  start_point <- c(norm_k[1], norm_wcss[1])
  end_point <- c(norm_k[length(norm_k)], norm_wcss[length(norm_wcss)])
  
  distances <- sapply(seq_along(norm_k), function(i) {
    point <- c(norm_k[i], norm_wcss[i])
    dist <- abs((end_point[2] - start_point[2]) * point[1] - 
                  (end_point[1] - start_point[1]) * point[2] + 
                  end_point[1] * start_point[2] - end_point[2] * start_point[1]) /
      sqrt((end_point[2] - start_point[2])^2 + (end_point[1] - start_point[1])^2)
    return(dist)
  })
  
  # Find the index of the maximum distance (the elbow)
  optimal_index <- which.max(distances)
  
  # Return the corresponding k value
  return(k_values[optimal_index])
}
