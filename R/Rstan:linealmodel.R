library(rstan)

                                        # Simulate data
set.seed(123)  # Set a seed for reproducibility
N <- 100       # Number of data points
x <- runif(N, min = 0, max = 10)  # Random x values between 0 and 10
beta <- 2                        # Slope of the linear relationship
alpha <- 3                       # Intercept of the linear relationship
sigma <- 1                        # Standard deviation of the error term
y <- alpha + beta * x + rnorm(N, mean = 0, sd = sigma)  # Generate y values based on the model with error

model <-

  ?stan_model(file = "stanModelLineal.stan")



stancode <- 'data {real y_mean;} parameters {real y;} model {y ~ normal(y_mean,1);}'
modn     <- stan_model(model_code = stancode, verbose = TRUE)
fit      <- sampling(mod, data = list(y_mean = 0))
fit2     <- sampling(mod, data = list(y_mean = 5))

fit@mode

plot(fit)


library(Rstanarm)

?Rstanarm


## https://stackoverflow.com/questions/69306392/running-regression-estimation-using-rstan


## https://discourse.mc-stan.org/t/multiple-regression-in-rstan-with-factors/3189/5
