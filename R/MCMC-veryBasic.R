# Set random seed for reproducibility
set.seed(123)

# Define a simple target distribution (bimodal)
target_distribution <- function(x) {
  cat("This function defines a bimodal target distribution as a weighted sum of two normal distributions.\n")
  weight1 <- 0.6  # Weight for the first normal distribution
  weight2 <- 0.4  # Weight for the second normal distribution
  norm1 <- dnorm(x, mean = 0, sd = 1)  # First normal distribution (mean 0, sd 1)
  norm2 <- dnorm(x, mean = 5, sd = 1)  # Second normal distribution (mean 5, sd 1)
  return(weight1 * norm1 + weight2 * norm2)  # Combine weighted normal distributions
}

# Simulate a random walk (not MCMC)
num_steps <- 20
current_state <- 0
states <- numeric(num_steps)

for (i in 1:num_steps) {
  # Randomly move left or right with equal probability
  step <- ifelse(runif(1) < 0.5, -1, 1)
  current_state <- current_state + step
  
  # Store the current state
  states[i] <- current_state
}

# Visualize the random walk
plot(1:num_steps, states, type = "b", xlab = "Steps", ylab = "State")
abline(h = 0, lty = 2, col = "gray")
title("Random Walk (Not MCMC)")

# Simulate a Metropolis-Hastings MCMC for demonstration
num_samples <- 1000
initial_state <- 0
mcmc_samples <- numeric(num_samples)

proposal_distribution <- function(current_state) {
  cat("This function defines a proposal distribution as a normal distribution centered at the current state with a small standard deviation.\n")
  rnorm(1, mean = current_state, sd = 0.5)
}

# Metropolis-Hastings loop
for (i in 1:num_samples) {
  # Propose a new state based on the proposal distribution
  proposed_state <- proposal_distribution(current_state)

  # Simplified acceptance ratio for demonstration (not actual calculation)
  acceptance_ratio <- 1  

  # Decide whether to accept or reject based on a uniform random number
  if (runif(1) < acceptance_ratio) {
    current_state <- proposed_state
  }

  # Store the accepted state
  mcmc_samples[i] <- current_state
}

# Visualize the MCMC samples
hist(mcmc_samples, main = "Metropolis-Hastings MCMC Samples", breaks = 20)
abline(v = 0, lty = 2, col = "gray")

# Create an example file (optional)
# This code snippet creates a new text file named "mcmc_example.txt"
# containing some comments and the target distribution definition.
# You can modify the content and filename as needed.
#writeLines(c("# This is an example file for MCMC demonstration",
#             "# It defines the target distribution"), "mcmc_example.txt")
#writeLines(paste0("target_distribution <- function(x) {", collapse = "\n"), "mcmc_example.txt", append = TRUE)
#writeLines(c("  weight1 <- 0.6",
#             "  weight2 <- 0.4",
#             "  norm1 <- dnorm(x, mean = 0, sd = 1)",
#             "  norm2 <- dnorm(x, mean = 5, sd = 1)",
#             "  return(weight1 * norm1 + weight2 * norm2)",
#             "}"), "mcmc_example.txt", append = TRUE)
#writeLines("}", "mcmc_example.txt", append = TRUE)
