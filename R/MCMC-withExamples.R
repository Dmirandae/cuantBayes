


## new chat gpt comment

# Metropolis-Hastings Algorithm
metropolis_hastings <- function(target_distribution, proposal_distribution, num_samples) {
  # Initialize empty array to store samples and current state
  samples <- numeric(num_samples)
  current_state <- 1

  # Loop to generate samples
  for (i in 1:num_samples) {
    # Propose a new state using the proposal distribution
    proposed_state <- proposal_distribution(current_state)

    # Calculate acceptance ratio based on target distribution at current and proposed states
    acceptance_ratio <- target_distribution(proposed_state) / target_distribution(current_state)

    # Decide whether to accept or reject based on a uniform random number
    if (runif(1) < acceptance_ratio) {
      # Accept: update current state with proposed state
      current_state <- proposed_state
    }

    # Store the accepted state in the samples array
    samples[i] <- current_state
  }

  # Return the generated samples
  return(samples)
}

# Gibbs Sampling
gibbs_sampling <- function(target_distribution, num_samples) {
  # Initialize matrix to store samples and current state for all variables
  samples <- matrix(0, nrow = num_samples, ncol = length(target_distribution))
  current_state <- numeric(length(target_distribution))

  # Loop to generate samples
  for (i in 1:num_samples) {
    # Loop over each variable in the target distribution
    for (j in 1:length(target_distribution)) {
      # Update each variable's value by sampling from its full conditional distribution
      current_state[j] <- rnorm(1, mean = 0, sd = 1)  # Replace with actual full conditional distribution
    }

    # Store the updated state in the corresponding row of the samples matrix
    samples[i, ] <- current_state
  }

  # Return the generated samples
  return(samples)
}


# Metropolis-adjusted Langevin Algorithm (MALA)
mala <- function(target_distribution, gradient, step_size, num_samples) {
  # Initialize empty array to store samples and current state
  samples <- numeric(num_samples)
  current_state <- 1

  # Loop to generate samples
  for (i in 1:num_samples) {
    # Update using MALA proposal: add gradient information and random noise
    proposed_state <- current_state + 0.5 * step_size * gradient(current_state) + rnorm(1)

    # Calculate acceptance ratio based on target distribution at current and proposed states
    acceptance_ratio <- exp(target_distribution(proposed_state) - target_distribution(current_state))

    # Decide whether to accept or reject based on a uniform random number
    if (runif(1) < acceptance_ratio) {
      # Accept: update current state with proposed state
      current_state <- proposed_state
    }

    # Store the accepted state in the samples array
    samples[i] <- current_state
  }

  # Return the generated samples
  return(samples)
}

# Pseudo-Marginal Metropolis-Hastings
pseudo_marginal <- function(target_distribution, unbiased_estimate, num_samples) {
  # Initialize empty array to store samples and current state
  samples <- numeric(num_samples)
  current_state <- 1

  # Loop to generate samples
  for (i in 1:num_samples) {
    # Propose a new state using a uniform distribution
    proposed_state <- rnorm(1)

    # Calculate acceptance ratio using unbiased estimate of the target distribution
    acceptance_ratio <- unbiased_estimate(proposed_state) / unbiased_estimate(current_state)

    # Decide whether to accept or reject based on a uniform random number
    if (runif(1) < acceptance_ratio) {
      # Accept: update current state with proposed state
      current_state <- proposed_state
    }

    # Store the accepted state in the samples array
    samples[i] <- current_state
  }

  # Return the generated samples
  return(samples)
}



## data set to test

# Define the target distribution function (replace with your desired distribution)
target_distribution <- function(x) {
  # Example bimodal distribution
  weight1 <- 0.6
  weight2 <- 0.4
  norm1 <- dnorm(x, mean = -2, sd = 1)
  norm2 <- dnorm(x, mean = 2, sd = 1)
  return(weight1 * norm1 + weight2 * norm2)
}

# Define proposal distribution (adjust standard deviation for Metropolis-Hastings and MALA)
proposal_distribution <- function(current_state) {
  rnorm(1, mean = current_state, sd = 0.1)
}

# Set the number of samples
num_samples <- 1000

# Initial states for each function
initial_states <- list(
  metropolis_hastings = 0,
  gibbs_sampling = NA,  # Not applicable for this example
  mala = 0,
  pseudo_marginal = 0,
  slice_sampling = 0
)

# Simulated data sets (empty lists to be filled)
simulated_data <- list()

# Run MCMC simulations for each function (modify as needed)
for (function_name in names(initial_states)) {
  # Check if the function requires an initial state
  if (!is.na(initial_states[[function_name]])) {
    # Define arguments based on the function
    if (function_name == "metropolis_hastings" | function_name == "mala") {
      simulated_data[[function_name]] <- eval(parse(text = paste0(function_name, "(target_distribution, proposal_distribution, ", num_samples, ")")))
    } else {
      simulated_data[[function_name]] <- eval(parse(text = paste0(function_name, "(target_distribution, ", num_samples, ")")))
    }
  } else {
    # Handle cases where initial state is not applicable (e.g., Gibbs sampling)
    simulated_data[[function_name]] <- NA
  }
}

# Example usage: Access simulated data from a specific function
metropolis_samples <- simulated_data[["metropolis_hastings"]]

# Visualize the results (optional)
hist(metropolis_samples, main = "Metropolis-Hastings MCMC Samples")



##$$$%%%%%

# Slice Sampling
slice_sampling <- function(target_distribution, num_samples) {
  # Initialize empty array to store samples and current state
  samples <- numeric(num_samples)
  current_state <- 1  # Initial state

  # Loop to generate samples
  for (i in 1:num_samples) {
    # Sample uniformly from the vertical direction (between 0 and target distribution at current state)
    vertical_position <- runif(1, min = 0, max = target_distribution(current_state))

    # Perform slice sampling to find a valid sample within the slice
    current_state <- sample_from_slice(target_distribution, current_state, vertical_position)

    # Store the sampled state in the samples array
    samples[i] <- current_state
  }

  # Return the generated samples
  return(samples)
}

# Helper function for slice sampling
sample_from_slice <- function(target_distribution, current_state, vertical_position) {
  # Initialize bounds for the horizontal search (negative and positive infinity)
  left <- -Inf
  right <- Inf

  # Loop until a valid sample is found within the slice
  while (TRUE) {
    # Propose a new state uniformly within the current bounds
    proposed_state <- runif(1, min = left, max = right)

    # Check if the proposed state falls below the slice defined by vertical_position
    if (vertical_position < target_distribution(proposed_state)) {
      # If it does, return the proposed state as a valid sample
      return(proposed_state)
    } else {
      # If not, update the bounds based on the proposed state's position relative to current state
      if (proposed_state < current_state) {
        # If the proposed state is to the left of the current state, update the left bound
        left <- proposed_state
      } else {
        # If the proposed state is to the right of the current state, update the right bound
        right <- proposed_state
      }
    }
  }
}


##$$%%&&


# Define the target distribution function
target_distribution <- function(x) {
  # Weights for each mode (adjust these for different peak heights)
  weight1 <- 0.6
  weight2 <- 0.4
  
  # Normal distributions for each mode
  norm1 <- dnorm(x, mean = -2, sd = 1)
  norm2 <- dnorm(x, mean = 2, sd = 1)
  
  # Combine weighted normal distributions
  return(weight1 * norm1 + weight2 * norm2)
}


# Initial states for each function
initial_states <- list(
  metropolis_hastings = 0,
  gibbs_sampling = NA,  # Not applicable for this example
  mala = 0,
  pseudo_marginal = 0,
  slice_sampling = 0
)



# Define a proposal distribution (e.g., normal distribution with small standard deviation)
proposal_distribution <- function(current_state) {
  rnorm(1, mean = current_state, sd = 0.1)
}

# Set the number of samples
num_samples <- 1000

# Run Metropolis-Hastings MCMC
mcmc_samples <- metropolis_hastings(target_distribution, proposal_distribution, num_samples)

# Visualize the results (optional)
hist(mcmc_samples, main = "Metropolis-Hastings MCMC Samples")

## same but heavily commented


# Define the target distribution function (replace with your desired distribution)
target_distribution <- function(x) {
  # Example bimodal distribution
  weight1 <- 0.6
  weight2 <- 0.4
  norm1 <- dnorm(x, mean = -2, sd = 1)
  norm2 <- dnorm(x, mean = 2, sd = 1)
  return(weight1 * norm1 + weight2 * norm2)
}

# Define proposal distribution (adjust standard deviation for Metropolis-Hastings and MALA)
proposal_distribution <- function(current_state) {
  rnorm(1, mean = current_state, sd = 0.1)
}

# Set the number of samples
num_samples <- 1000

# Initial states for each function
initial_states <- list(
  metropolis_hastings = 0,
  gibbs_sampling = NA,  # Not applicable for this example
  mala = 0,
  pseudo_marginal = 0,
  slice_sampling = 0
)

# Simulated data sets (empty lists to be filled)
simulated_data <- list()

# Run MCMC simulations for each function (modify as needed)
for (function_name in names(initial_states)) {
  # Check if the function requires an initial state
  if (!is.na(initial_states[[function_name]])) {
    # Define arguments based on the function
    if (function_name == "metropolis_hastings" | function_name == "mala") {
      # Construct function call for Metropolis-Hastings or MALA (require proposal distribution)
      simulated_data[[function_name]] <- eval(parse(text = paste0(function_name, "(target_distribution, proposal_distribution, ", num_samples, ")")))
    } else {
      # Construct function call for other functions (don't include proposal distribution)
      simulated_data[[function_name]] <- eval(parse(text = paste0(function_name, "(target_distribution, ", num_samples, ")")))
    }
  } else {
    # Handle cases where initial state is not applicable (e.g., Gibbs sampling)
    simulated_data[[function_name]] <- NA
  }
}

# Example usage: Access simulated data from a specific function
metropolis_samples <- simulated_data[["metropolis_hastings"]]

# Visualize the results (optional)
hist(metropolis_samples, main = "Metropolis-Hastings MCMC Samples")



######

## Basic MCMC

# Define transition matrix
transition_matrix <- matrix(c(0.7, 0.3, 0.2, 0.8), 
                            nrow = 2, byrow = TRUE)

# Initial state
initial_state <- c(0.5, 0.5)

# Simulate Markov Chain
set.seed(123)
num_steps <- 10
states <- matrix(0, nrow = num_steps, ncol = 2)

for (i in 1:num_steps) {
  if (i == 1) states[i, ] <- initial_state
  else states[i, ] <- states[i - 1, ] %*% transition_matrix
}

# Display the result
print(states)
