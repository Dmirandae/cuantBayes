# Markov Processes
- A **Markov process** exhibits the *Markov property*.
- Predictions about future outcomes depend *solely on the current state*.
- *Independent of the process's history*.

---

# Markov Chains
- A **Markov chain** is a specific type of Markov process.
- It has a *discrete state space or index set*.
- Can be defined with *discrete or continuous time* and a *countable state space*.

---

# Wikipedia: Markov
![Markov Image](../figures/Markovkate_01.pdf)

---

# Markov Chains in R
```r
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
```

# Applications of Markov Chains

- Markov chains are used to model sequences of events.
- Probability of each event depends *only on the previous state*.
- Applications in various fields:
  - Cruise control systems
  - Customer queues
  - Currency exchange rates
  - Animal population dynamics
