# Metropolis–Hastings Example
metropolis_hastings <- function(target_distribution, proposal_distribution, num_samples) {
  samples <- numeric(num_samples)
  current_state <- 1  # Initial state
  
  for (i in 1:num_samples) {
    # Propose a new state
    proposed_state <- proposal_distribution(current_state)
    
    # Acceptance ratio
    acceptance_ratio <- target_distribution(proposed_state) / target_distribution(current_state)
    
    # Accept or reject the proposed state
    if (runif(1) < acceptance_ratio) {
      current_state <- proposed_state
    }
    
    samples[i] <- current_state
  }
  
  return(samples)
}

# Gibbs Sampling Example
gibbs_sampling <- function(target_distribution, num_samples) {
  samples <- matrix(0, nrow = num_samples, ncol = length(target_distribution))
  current_state <- numeric(length(target_distribution))  # Initial state
  
  for (i in 1:num_samples) {
    for (j in 1:length(target_distribution)) {
      # Update each coordinate based on its full conditional distribution
      current_state[j] <- rnorm(1, mean = 0, sd = 1)  # Example, replace with actual full conditional distribution
    }
    
    samples[i, ] <- current_state
  }
  
  return(samples)
}


# MALA Example
mala <- function(target_distribution, gradient, step_size, num_samples) {
  samples <- numeric(num_samples)
  current_state <- 1  # Initial state
  
  for (i in 1:num_samples) {
    # Update using MALA proposal
    proposed_state <- current_state + 0.5 * step_size * gradient(current_state) + rnorm(1)
    
    # Acceptance ratio
    acceptance_ratio <- exp(target_distribution(proposed_state) - target_distribution(current_state))
    
    # Accept or reject the proposed state
    if (runif(1) < acceptance_ratio) {
      current_state <- proposed_state
    }
    
    samples[i] <- current_state
  }
  
  return(samples)
}

# Pseudo-Marginal Example
pseudo_marginal <- function(target_distribution, unbiased_estimate, num_samples) {
  samples <- numeric(num_samples)
  current_state <- 1  # Initial state
  
  for (i in 1:num_samples) {
    # Propose a new state
    proposed_state <- rnorm(1)
    
    # Acceptance ratio using unbiased estimate
    acceptance_ratio <- unbiased_estimate(proposed_state) / unbiased_estimate(current_state)
    
    # Accept or reject the proposed state
    if (runif(1) < acceptance_ratio) {
      current_state <- proposed_state
    }
    
    samples[i] <- current_state
  }
  
  return(samples)
}

# Slice Sampling Example
slice_sampling <- function(target_distribution, num_samples) {
  samples <- numeric(num_samples)
  current_state <- 1  # Initial state
  
  for (i in 1:num_samples) {
    # Sample uniformly from the vertical direction
    vertical_position <- runif(1, min = 0, max = target_distribution(current_state))
    
    # Slice sampling
    current_state <- sample_from_slice(target_distribution, current_state, vertical_position)
    
    samples[i] <- current_state
  }
  
  return(samples)
}

sample_from_slice <- function(target_distribution, current_state, vertical_position) {
  # Perform binary search to find the horizontal 'slice'
  left <- -Inf
  right <- Inf
  
  while (TRUE) {
    proposed_state <- runif(1, min = left, max = right)
    
    if (vertical_position < target_distribution(proposed_state)) {
      return(proposed_state)
    } else {
      if (proposed_state < current_state) {
        left <- proposed_state
      } else {
        right <- proposed_state
      }
    }
  }
}


######


