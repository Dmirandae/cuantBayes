
## using Distributions

# Function to calculate alpha and beta parameters for the beta distribution
function calculate_alpha_beta(μ, σ²)
    α = μ^2 - μ^3 - μ * σ² / σ²
    β = μ - 2μ^2 + μ^3 - σ² + μ * σ² / σ²
    return α, β
end

# Function to calculate probability density for a given observation y
function calculate_probability_density(y, α, β)
    dist = Beta(α, β)
    return pdf(dist, y)
end

# Given parameters
k = 0.01  # Decay rate
σ² = 6e-4  # Variance

# Calculate μt for t = 30
t = 30
μt = exp(-k * t)

# Calculate alpha and beta parameters
α30, β30 = calculate_alpha_beta(μt, σ²)

# Given observation
yt = 0.7

# Calculate probability density for yt at time t = 30
probability_density = calculate_probability_density(yt, α30, β30)

# Display results
println("Alpha for t = 30: ", α30)
println("Beta for t = 30: ", β30)
println("Probability density for yt = $yt at t = $t: ", probability_density)


