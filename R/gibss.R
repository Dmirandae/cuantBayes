
#~ **Summary:**
#~ Gibbs sampling, a specialized case of the Metropolis–Hastings algorithm, provides a method for obtaining samples from a joint distribution by iteratively sampling each variable from its conditional distribution. The key idea is to simplify sampling from a multivariate distribution by focusing on conditional distributions rather than integrating over the entire joint distribution. The Gibbs sampling procedure is as follows:

#~ 1. Begin with an initial value, denoted as \(X^{(0)}\).
#~ 2. To obtain the next sample \(X^{(i+1)}\), sample each component \(x_j^{(i+1)}\) of the vector sequentially. Condition on components up to \(x_{j-1}^{(i+1)}\) and from \(x_{j+1}^{(i)}\) to \(x_n^{(i)}\).
#~ 3. Formally, sample \(x_j^{(i+1)}\) from the distribution \(p(x_j^{(i+1)} | x_1^{(i+1)}, \ldots, x_{j-1}^{(i+1)}, x_{j+1}^{(i)}, \ldots, x_n^{(i)})\).
#~ 4. Repeat the above step \(k\) times to obtain \(k\) samples.


# Function for conditional distribution sampling
sample_conditional <- function(j, current_sample) {
  # Example: Conditional distribution as a normal distribution
  mean_conditional <- sum(current_sample[-j]) / (length(current_sample) - 1)
  sd_conditional <- 1
  return(rnorm(1, mean = mean_conditional, sd = sd_conditional))
}

# Gibbs sampling algorithm
gibbs_sampling <- function(num_iterations, num_variables) {
  samples <- matrix(0, nrow = num_iterations, ncol = num_variables)
  
  # Initial value
  current_sample <- rep(0, num_variables)
  
  for (i in 1:num_iterations) {
    for (j in 1:num_variables) {
      # Sample from the conditional distribution
      current_sample[j] <- sample_conditional(j, current_sample)
    }
    
    # Store the current sample
    samples[i,] <- current_sample
  }
  
  return(samples)
}

# Number of iterations and variables
num_iterations <- 1000
num_variables <- 3

# Run Gibbs sampling
gibbs_samples <- gibbs_sampling(num_iterations, num_variables)

# Display the samples
print(gibbs_samples)

