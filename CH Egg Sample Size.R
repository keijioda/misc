
# CH Sample size calculation for Egg grant
library(tidyverse)

# Research Design ---------------------------------------------------------
# Two-arm parallel design
# Measurements at baseline and after intervention
# Compare change from baseline b/w the control and treatment

# Functions ---------------------------------------------------------------
# Function to calc SD of difference assuming equal variance
sd_diff <- function(sd, rho) sqrt(2 * (sd ^ 2) - 2 * rho * (sd ^ 2))

# Function to calc n based on two-sample t-test
ss_calc <- function(delta, sd) power.t.test(delta = delta, sd = sd, power = power)$n

# Assumptions -------------------------------------------------------------
# Normality of the outcome
# Equal variance b/w baseline and post-intervention
# Equal variance b/w the control and treatment
# Two-tailed with alpha = 0.05

# Parameters --------------------------------------------------------------
# Assumes 80% power
power  <- 0.80

# SS calculation for BP ---------------------------------------------------
# Effect size and SD
delta <- c(0.6, 0.8, 1.0)
sd    <- c(1.0, 1.2)
rho   <- c(0.4, 0.5)

out <- expand.grid(delta = delta, sd = sd, corr = rho) %>% 
  arrange(delta, corr, sd) %>% 
  mutate(sd_change = sd_diff(sd, corr),
         n = unlist(map2(delta, sd_change, ss_calc)))
out %>% 
  mutate(sd_change = round(sd_change, 2),
         n = ceiling(n))

# SS calculation for HDL --------------------------------------------------
# Effect size and SD
delta <- c(0.025, 0.075, 0.1)
sd    <- c(0.05, 0.20)
rho   <- c(0.4, 0.5)

out <- expand.grid(delta = delta, sd = sd, corr = rho) %>% 
  arrange(delta, corr, sd) %>% 
  mutate(sd_change = sd_diff(sd, corr),
         n = unlist(map2(delta, sd_change, ss_calc)))
out %>% 
  mutate(sd_change = round(sd_change, 2),
         n = ceiling(n))
