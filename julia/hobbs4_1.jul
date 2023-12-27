
# Define the Poisson probability function
function poisson_probability(y, λ)
    return exp(-λ) * λ^y / factorial(y)
end

# Given data
y1 = 14
y2 = 34
λ_true = 23

# Calculate individual probabilities
prob_y1_given_λ = poisson_probability(y1, λ_true)
prob_y2_given_λ = poisson_probability(y2, λ_true)

# Calculate joint probability (assuming independence)
joint_probability = prob_y1_given_λ * prob_y2_given_λ

# Print results
println("Probability of observing $y1 tadpoles given λ = $λ_true: $prob_y1_given_λ")
println("Probability of observing $y2 tadpoles given λ = $λ_true: $prob_y2_given_λ")
println("Joint probability of the data conditional on λ: $joint_probability")

