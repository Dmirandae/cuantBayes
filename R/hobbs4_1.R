
# Example 4.1 Hobbs 2015: Poisson Distribution

# Given values
lambda <- 23  # True average number of tadpoles per liter
y1 <- 14      # Number of tadpoles in the first sample
y2 <- 34      # Number of tadpoles in the second sample

# Calculate individual probabilities for each observation
prob_y1 <- dpois(y1, lambda)
prob_y2 <- dpois(y2, lambda)

# Calculate joint probability assuming independence
joint_prob <- prob_y1 * prob_y2

# Print results
cat("Probability of observing", y1, "tadpoles in the first sample:", prob_y1, "\n")
cat("Probability of observing", y2, "tadpoles in the second sample:", prob_y2, "\n")
cat("Joint probability of the data assuming independence:", joint_prob, "\n")

