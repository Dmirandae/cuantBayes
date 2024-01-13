# Two-Way Distributions
- Conditional Probability
- Independence of Attributes

---

# Conditional Probability
Conditional probability is the probability of an event occurring given that another event has already occurred. It is denoted by \($ P(A | B)$ \), representing the probability of event A given that event B has occurred. The formula for conditional probability is:
\[ $P(A | B) = \frac{P(A \cap B)}{P(B)}$ \]
where \( $P(A \cap B)$ \) is the probability of both events A and B occurring, and \( $P(B)$ \) is the probability of event B occurring.

---

# Independence of Attributes
Two events, A and B, are considered independent if the occurrence or non-occurrence of one event does not affect the probability of the other event. Mathematically, events A and B are independent if:
\[ $P(A \cap B) = P(A) \cdot P(B)$ \]
In other words, the joint probability of A and B equals the product of their individual probabilities. If this equation holds, A and B are independent; otherwise, they are dependent.

---

# Conditional Probability
- Conditional Probability: \( $P(A | B) = \frac{P(A \cap B)}{P(B)}$ \)
- Example:
  - Suppose you have a deck of cards. Let \( A \) be the event of drawing a red card, and \( B \) be the event of drawing a heart. The conditional probability of drawing a red card given that it is a heart is:
  \[ $P(A | B) = \frac{P(A \cap B)}{P(B)} = \frac{\frac{1}{2}}{\frac{1}{4}} = \frac{2}{1} = 2$ \]

---

# Independence of Attributes
- Independence of Attributes: \( $P(A \cap B) = P(A) \cdot P(B)$ \)
- Example:
  - Consider two events: \( C \) is the event of rolling a 4 on a six-sided die, and \( D \) is the event of getting heads on a fair coin toss. If \( C \) and \( D \) are independent, then:
  \[ $(C \cap D) = P(C) \cdot P(D) = \frac{1}{6} \cdot \frac{1}{2} = \frac{1}{12}$ \]

---

# Joint Probability
- Definition: The probability of the occurrence of two or more events simultaneously.
- Denoted as \( $P(A \cap B) \) for events \( A \) and \( B$ \).

---

# Joint Probability Example
- Consider rolling a six-sided die.
- Let \( A \): The event of rolling an even number.
- Let \( B \): The event of rolling a number greater than 3.
- Find \( $P(A \cap B)$ \).

---

# Calculating Joint Probability
- Using the formula: \( $P(A \cap B) = P(A) \times P(B|A)$ \)
- \( $P(A)$ \): Probability of event \( A \)
- \( $P(B|A)$ \): Probability of event \( B \) given that event \( A \) has occurred.

---

# Joint Probability Example
- \( $P(A)$ \): Probability of rolling an even number = \( $\frac{3}{6} = \frac{1}{2}$ \)
- \( $P(B|A)$ \): Probability of rolling a number greater than 3 given that an even number is rolled = \( $\frac{2}{3}$ \)
- \( $P(A \cap B) = \frac{1}{2} \times \frac{2}{3} = \frac{1}{3}$ 

---

# Joint Probability Interpretation
- Joint probability provides a measure of the likelihood of multiple events occurring together.
- Important in understanding relationships between events.

---

# Applications
- Finance: Probability of a stock both gaining value and exceeding a certain threshold.
- Medicine: Probability of a patient having multiple symptoms simultaneously.
- Weather: Probability of rain and high winds occurring together.

---

# Rules of Factoring Joint Probabilities

---

# Rule 1: Product Rule
- Product Rule Formula:
  \[ $P(A \cap B) = P(A|B) \cdot P(B)$ \]
- Interpretation: Probability of both events A and B occurring.
- or, it expresses the joint probability in terms of the conditional probability of A given B and the marginal probability of B.

---

# Rule 1: Product Rule: Example
- Consider events A and B representing the outcomes of rolling a fair six-sided die.
- Let A be the event of getting an even number (2, 4, or 6), and B be the event of getting a number greater than 3 (4, 5, or 6).
- The probability of A given B is \( $P(A|B) = \frac{2}{3}$ \), and the probability of B is \( $P(B) = \frac{1}{2}$ \).
- Applying the product rule:
  \[ $P(A \cap B) = \frac{2}{3} \cdot \frac{1}{2} = \frac{1}{3}$ 

---

# Example: Genetic Inheritance
- Event A: Offspring having a specific genetic trait.
- Event B: Parent carrying the gene for the trait.
- Using the product rule to calculate the joint probability.

---

# Example: Species Coexistence in Ecology
- Event A: Presence of species X in an ecosystem.
- Event B: Availability of a specific environmental condition.
- Applying the product rule to understand coexistence probabilities.

---

# Rule 2: Chain Rule
- Chain Rule Formula:
  \[ $P(A \cap B \cap C) = P(A|B \cap C) \cdot P(B|C) \cdot P(C)$ \]
- The formula for three events, generalizable to more variables.

---

# Application in Biology
- **Example 1: Gene Expression**
  - $A$: Gene activation, $B$: Cellular environment, $C$: External signals.
  - Probability of gene activation influenced by the cellular environment **AND** external signals.

---

# Application in Biology
- **Example 2: Ecosystem Dynamics**
  - $A$: Predation occurrence, $B$: Prey abundance, $C$: Environmental conditions.
  - Probability of predation depends on prey abundance  **AND** environmental conditions.

---

# Generalization
- Rule 2 can be generalized to more variables.
- **Example 3: Evolutionary Processes**
  - $A$: Adaptation, $B$: Genetic variation, $C$: Selection pressure.
  - Probability of adaptation influenced by genetic variation  **AND** selection pressure.

---

# Rule 3: Marginalization
- Marginal Probability:
  \[ $P(A) = \sum_{B} P(A \cap B)$ \]
- Interpretation and practical implications.

---

# Example: Marginalization
- Consider a joint probability distribution table representing the occurrence of two traits in a population.
- Traits: Trait A (dominant/recessive) and Trait B (present/absent).
- Joint probabilities are given in the table.

---

# Joint Probability Distribution Table
\begin{center}
  \begin{tabular}{|

c|c|c|}
    \hline
    & 123 & 456 \\
    \hline
    Even  & \only<2>{1} & \only<2>{2}   \\
    \hline
    Uneven & \only<2>{2}  & \only<2>{1} \\
    \hline
  \end{tabular}
\end{center}

---

# Joint Probability Distribution Table
\begin{center}
  \begin{tabular}{|c|c|c|}
    \hline
    & Trait B Present & Trait B Absent \\
    \hline
    Trait A Dominant & $P(A, B)$ & $P(A, \neg B)$ \\
    \hline
    Trait A Recessive & $P(\neg A, B)$ & $P(\neg A, \neg B)$ \\
    \hline
  \end{tabular}
\end{center}

---

# Calculation of Marginal Probabilities
- Marginal probability of Trait A: \( $P(A) = P(A, B) + P(A, \neg B)$ \)
- Marginal probability of Trait B: \( $P(B) = P(A, B) + P(\neg A, B)$ \)

---

# Calculation of Marginal Probabilities
- TABLE 3.1 [[@hobbs2015]]

---

# Interpretation
- Marginalization allows us to analyze the probability of individual traits independently.
- This is crucial for understanding the genetic composition of a population.
