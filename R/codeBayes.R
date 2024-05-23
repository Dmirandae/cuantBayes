# Bayesian Coin Bias Estimation [[A single coin]]

# Prior distribution for bias
prior_bias <- dbeta(seq(0, 1, by = 0.01), 2, 2)

# Likelihood function
likelihood <- function(data, bias) {
  heads <- sum(data == 'H')
  tails <- sum(data == 'T')
  return (dbinom(heads, heads + tails, bias))
}

# Posterior distribution
update_posterior <- function(prior, likelihood) {
  unnormalized_posterior <- prior * likelihood
  posterior <- unnormalized_posterior / sum(unnormalized_posterior)
  return (posterior)
}
# Simulate coin flips data
coin_flips_data <- c('H', 'T', 'H', 'H', 'T', 'T', 'H', 'H', 'H', 'T')

# Initial prior
prior <- dbeta(seq(0, 1, by = 0.01), 2, 2)

# Bayesian updating
for (flip in coin_flips_data) {
  likelihood_values <- likelihood(coin_flips_data, seq(0, 1, by = 0.01))
  posterior <- update_posterior(prior, likelihood_values)
  prior <- posterior
}

# Plot the results
plot(seq(0, 1, by = 0.01), prior, type = 'l', 
     xlab = 'Bias', ylab = 'Posterior Probability',
     main = 'Bayesian Coin Bias Estimation')
