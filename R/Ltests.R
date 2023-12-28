# Simulated data for hierarchical tests

set.seed(123)
group1 <- rnorm(30, mean = 10, sd = 2)
group2 <- rnorm(25, mean = 12, sd = 2)
group3 <- rnorm(28, mean = 8, sd = 2)

## MIND: sd is equal for the data sets 

# One-way ANOVA as a hierarchical test
hierarchical_test <- aov(c(group1, group2, group3) ~ rep(c("Group1", "Group2", "Group3"), c(30, 25, 28)))

# Print ANOVA table
print(summary(hierarchical_test))



####

# Simulated data for hLrT
set.seed(456)
groupA <- rnorm(40, mean = 15, sd = 3)
groupB <- rnorm(35, mean = 12, sd = 3)

# Fit nested models
full_model <- lm(c(groupA, groupB) ~ rep(c("GroupA", "GroupB"), c(40, 35)))
reduced_model <- lm(c(groupA, groupB) ~ 1)

# Perform hLrT
hlrt <- lrtest(full_model, reduced_model)

# Print likelihood ratio test results
print(hlrt)


# Simulated data for Bayes Factors
set.seed(789)
treatment <- rnorm(50, mean = 20, sd = 5)
control <- rnorm(45, mean = 15, sd = 5)

# Bayesian t-test using BayesFactor package
library(BayesFactor)

# Conduct Bayesian t-test
bf_result <- ttestBF(treatment, control)

# Print Bayes Factor results
print(bf_result)

