Gamma hurdle model
================

## Gamma hurdle model for sparsely eaten foods

Let $Y_i$ be the gram intake (gram/day) of a sparsely eaten food for subject $i$, $i=1,2, \cdots, n$. Some subjects never eat the food and let $\pi$ be the proportion of $Y = 0$. For the rest of the subjects who consume the food with $Y > 0$, we expect that the distribution of such gram intakes is right-skewed. Assume that such a conditional distribution $Y|Y>0$ follows a gamma distribution with shape $k$ and scale $\theta$. 

Then the distribution of $Y$, $f(y)$, can be modeled as a **finite mixture model** of two components:

$$ f(y) = \pi_i (y = 0) + (1 - \pi_i) f(y | y > 0)$$

where the conditional distribution $f(y | y > 0) \sim Gamma(k, \theta)$.

This is a two-part model where the mixing probability $\pi_i$ can be estimated separately from $f(y | y > 0)$ using logistic regression:

$$ log \left( \frac{\pi_i}{1 - \pi_i} \right) = \boldsymbol{X_i\beta}$$

Non-zero intake of $Y_i$ can be estimated by a generalized linear model with a gamma distribution. 