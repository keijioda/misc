
# IN sample size calculation for GRASP grant
library(tidyverse)

# Research Design ---------------------------------------------------------
# 2x2 cross-over design
# Primary outcomes: Weight loss

# Assumptions -------------------------------------------------------------
# Normality of the outcome
# Two-tailed with alpha = 0.05
# Assume 10% dropout rate
# Assumes equal variances b/w two treatments

# Functions ---------------------------------------------------------------

# Power calculation for 2x2 cross-over, using the period-adjusted t test
# Sw = The within-subject standard deviation, Sw^2 = MSE
# Sw^2 = 1/2 * Sd(paired)^2 where Sd(paired)^2 is the variance of paired differences
# ncp = Non-centrality parameter

power2x2cross <- function(n, Sw, delta, alpha = .05){
  ncp <- delta /  (Sw / sqrt(n / 2))
  t <- qt(1 - alpha / 2, df = n - 2)
  power  <- 1 - pt(t, df = n - 2, ncp = ncp) + pt(-t, df = n - 2, ncp = ncp)
  return(power)
}

ss2x2cross <- function(Sw, delta, power = 0.8, alpha = .05){
  power2x2cross <- function(n, Sw, delta){
    ncp <- delta /  (Sw / sqrt(n / 2))
    t <- qt(1 - alpha / 2, df = n - 2)
    return(1 - pt(t, df = n - 2, ncp = ncp) + pt(-t, df = n - 2, ncp = ncp) - power)
  }
  n <- ceiling(uniroot(power2x2cross, Sw, delta, interval=c(3, 100000))$root)
  if(n %% 2 == 1){
    n <- n + 1
  }
  return(n)
}

# SS calculation for weight loss ------------------------------------------
delta <- c(1, 2, 4)
SD    <- c(2, 4)
rho   <- c(0.4, 0.5)
out   <- expand.grid(delta = delta, SD = SD, rho = rho) %>% 
  arrange(delta, SD, rho)

out <- out %>%
  mutate(S2_paired = 2 * SD ^ 2 - 2 * rho * SD ^ 2,
         Sw = sqrt(S2_paired / 2),
         n_total = mapply(ss2x2cross, Sw, delta),
         drop10 = ceiling(n_total / 0.9),
         drop10 = ifelse(drop10 %% 2 == 1, drop10 + 1, drop10)) %>% 
  select(-S2_paired) 
print(out, digits = 3, row.names = FALSE)

