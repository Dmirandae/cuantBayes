
# Function proportional to the desired probability density function P(x)
# Replace this with your actual function
target_distribution <- function(x) {
  # Example: a standard normal distribution
  return(dnorm(x))
}

# Metropolis algorithm with symmetric proposal distribution
metropolis_algorithm <- function(num_iterations) {
  samples <- numeric(num_iterations)
  
  # Initialization: Choose an arbitrary starting point
  current_sample <- 0
  
  for (t in 1:num_iterations) {
    # Generate a candidate for the next sample using a symmetric proposal distribution (e.g., Gaussian centered at the current sample)
    candidate_sample <- rnorm(1, mean = current_sample)
    
    # Calculate the acceptance ratio
    alpha <- target_distribution(candidate_sample) / target_distribution(current_sample)
    
    # Accept or reject the candidate
    if (runif(1) <= alpha) {
      current_sample <- candidate_sample
    }
    
    # Store the current sample in the sequence
    samples[t] <- current_sample
  }
  
  return(samples)
}

# Number of iterations
num_iterations <- 1000

# Run Metropolis algorithm
metropolis_samples <- metropolis_algorithm(num_iterations)

# Plot the results
hist(metropolis_samples, main = "Metropolis Algorithm", col = "lightblue", xlab = "Sample Values")


#~ This code defines the Metropolis algorithm, assuming a symmetric proposal distribution (a Gaussian centered at the current sample). It then generates a sequence of sample values and plots a histogram to visualize the distribution. 

