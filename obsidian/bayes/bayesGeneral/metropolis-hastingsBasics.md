# Metropolis–Hastings Algorithm

## Introduction to Metropolis–Hastings Algorithm

- Draws samples from any probability distribution with probability density \( P(x) \).
- Requires a function \( f(x) \) proportional to \( P(x) \) with calculable values.
- Overcomes the challenge of computing the normalization factor in practice.

## Algorithm Overview

- Generates a sequence of sample values.
- Distribution of values progressively approximates the desired distribution.
- Operates iteratively, forming a Markov chain.

## Markov Chain Structure

- Next sample's distribution depends solely on the current sample.
- Iterative generation creates a Markov chain.

## Iteration Process

- Proposes a candidate for the next sample based on the current sample.
- Accepts or rejects the candidate with a certain probability.
- Probability of acceptance determined by comparing \( f(x) \) values for current and candidate samples with respect to the desired distribution.

# Metropolis Algorithm (Symmetric Proposal Distribution)

## Metropolis Algorithm Overview

- Generates samples from a probability distribution with density \( P(x) \).
- Utilizes a function \( f(x) \) proportional to \( P(x) \) for the Markov Chain Monte Carlo (MCMC) method.
- Operates iteratively, attempting random moves in the sample space.

## Initialization

- Choose an arbitrary starting point \( x_t \).
- Select a symmetric proposal density function \( g(x' | y) \), often a Gaussian distribution centered at \( y \).

## Iteration Process

- Generate a candidate \( x' \) from \( g(x' | x_t) \).
- Calculate acceptance ratio \( \alpha = P(x') / P(x_t) \).
- Accept or reject the candidate based on \( u \), a uniform random number.

## Acceptance or Rejection

- If \( u \leq \alpha \), accept the candidate (\( x_{t+1} = x' \)).
- If \( u > \alpha \), reject the candidate (\( x_{t+1} = x_t \)).

## Intuition behind Acceptance

- \( \alpha > 1 \): Move is always accepted for more probable points.
- \( \alpha \leq 1 \): Move is occasionally rejected for less probable points.

## Algorithm Characteristics

- Tends to stay in high-density regions of \( P(x) \).
- Occasionally explores low-density regions.
- Effectively generates samples following the desired distribution.
