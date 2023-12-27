
# Example 4.2 Hobbs 2015: Probability nd beta Distribution

# Given the parameters
k <- 0.01
sigma2 <- 6e-4
t <- 30
observed_yt <- 0.7



# Function to calculate alpha and beta based on moment matching [[eq. in book]]
calculate_alpha_beta <- function(mu_t, sigma2) {
  alpha_t  <-  (mu_t^2 - mu_t^3 - (mu_t * sigma2)) / sigma2
  beta_t    <- (mu_t - 2 * mu_t^2 + mu_t^3 - sigma2 + (mu_t * sigma2)) / sigma2
  return(c(alpha_t, beta_t))
}



# Calculate alpha and beta for day 30
mu_t_30 <- exp(-k * t)
params_30 <- calculate_alpha_beta(mu_t_30, sigma2)
alpha_30 <- params_30[1]
beta_30 <- params_30[2]

# Calculate the probability density for yt = 0.7 at time t = 30
probability_density <- dbeta(observed_yt, alpha_30, beta_30)

# Display results
cat("Alpha for day",t,":", alpha_30, "\n")
cat("Beta for day",t,":", beta_30, "\n")
cat("Probability density for yt =",observed_yt," at time t =",t,":", probability_density, "\n")

