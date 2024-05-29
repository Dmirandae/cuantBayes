
# Load required libraries

library(BayesFactor)
library(bayeslm)
library(dplyr)
library(ggplot2)
library(mcmcr)
library(rstan)
library(rstanarm)




## data for simple models



p = 20
n = 100

kappa = 1.25
beta_true = c(c(1,2,3),rnorm(p-3,0,0.01))
sig_true = kappa*sqrt(sum(beta_true^2))

beta_true

sig_true

x = matrix(rnorm(p*n),n,p)
y = x %*% beta_true + sig_true * rnorm(n)


x = as.matrix(x)
y = as.matrix(y)


head(x)

head(y)


data = data.frame(x = x, y = y)

block_vec = rep(1, p) # slice-within-Gibbs sampler, put every coefficient in its own block

fitOLS = lm(y~x-1)  ## standard lm

                                        # call the function using formulas
fita = bayeslm(y ~ x, prior = 'horseshoe', 
               block_vec = block_vec, N = 10000, burnin = 2000)
                                        # summary the results
summary(fita)
summary(fita$beta)

?bayeslm::bayeslm()

## Gemini comments
#~ If you need to perform more complex Bayesian analysis or have specific 
#~ prior distributions in mind, Stan is likely the better choice. If 
#~ you're looking for a simpler solution within R for basic Bayesian 
#~ linear regression, then packages like bayeslm can be a good starting 
#~ point.

# Load rstan package
library(rstan)

# Simulate data
set.seed(123)

N     <- 100
x     <- runif(N, 1, 10)
beta  <- 2  # True slope
alpha <- 3  # True intercept
sigma <- 1  # True standard deviation
y <- alpha + beta * x + rnorm(N, mean = 0, sd = sigma)

# Stan model code
stancode_2 <- 'data {real y_mean;} parameters {real y;} model {y ~ normal(y_mean,1);}'


stancode_1 <- "
data {
  int<lower=1> N;
  vector[N] x;
  vector[N] y;
}

parameters {
  real alpha;
  real beta;
  real sigma;
}

model {
  y ~ normal(alpha + beta * x, sigma);
}
"

rstan_options(threads_per_chain = 1)



# Compile the Stan model 1  / fit
## simple model / data

?stan_model


?stan_model()


mod_1 <- stan_model(model_code = stancode_1, verbose = TRUE)


fit  <- sampling(mod_1, data = list(y_mean = 0))

fit2 <- sampling(mod_1, data = list(y_mean = 5))

summary(fit)

summary(fit2)



# Compile the Stan model 2  / fit
##  simple model / data

model <- stan_model(model_code = stancode_2)

# Fit the model to the data 
fit <- sampling(model, data = list(N = N, x = x, y = y), chains = 4, iter = 2000)

# Summarize the posterior distribution
summary(fit)


## gemini
#~ This code simulates data from a linear regression model, defines the 
#~ Stan model code, compiles the model, fits it to the data, and 
#~ summarizes the posterior distribution of the model parameters.






# Load rstanarm package for plotting
library(rstanarm)
library(mcmcr)
library(dplyr)

?rstanarm

# ... (rest of the code for simulating data, defining Stan model, compiling, and fitting)

# Extract posterior samples
posterior <- mcmcr::as.mcmc(fit)

# Get trace for plotting
trace <- posterior %>%  extract(pars = c("alpha", "beta"))

# Generate fitted values based on posterior draws
y_fit <- alpha + beta * x

y_fit

x
y


###https://medium.com/@josef.waples/understanding-bayesian-linear-regression-model-output-in-r-using-mtcars-0bf2a098e20b

library(rstanarm)



                                        # Plot original data and fitted values

                                        #
library(ggplot2)

data(mtcars)
stan_glm(mpg ~ wt, data = mtcars)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_abline(intercept = 37.3, slope = -5.3, color = '#1e466e') +
  ggtitle("mtcars") +
  labs(subtitle = "mpg ~ wt") 



## Gemini
#~ This code snippet utilizes the rstanarm package to create a ggplot fo
#~ visualizing the model results. It extracts the posterior samples for 
#~ the intercept and slope parameters, generates fitted values based on 
#~ posterior draws, and finally constructs a plot with the original data 
#~ points and overlaid regression lines representing the posterior uncertainty.
