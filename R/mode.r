
## chatGPT generated


calculate_mode <- function(x) {
  uniq_x <- unique(x)
  freq <- tabulate(match(x, uniq_x))
  mode_value <- uniq_x[which.max(freq)]
  return(mode_value)
}



# Calculate geometric mean
geometric_mean <- exp(mean(log(cauca)))
