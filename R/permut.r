
## CHAT GPT 3.5 2023 12 19

# Function to generate permutations of a vector
permute <- function(v) {
  if (length(v) <= 1) {
    return(list(v))
  } else {
    result <- list()
    for (i in seq_along(v)) {
      rest <- v[-i]
      perm_rest <- permute(rest)
      for (p in perm_rest) {
        result <- c(result, list(c(v[i], p)))
      }
    }
    return(result)
  }
}

# Example usage
my_vector <- c("A", "B", "C")
permutations <- permute(my_vector)

# Print the permutations
print(permutations)



