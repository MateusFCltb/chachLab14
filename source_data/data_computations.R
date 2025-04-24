## Script that calculates all calculated values for this lab

### Step 4 : Relating price to corn stock-to-use ratio (SURt)

WASDE$SUR <- ((WASDE$end_stocks)/WASDE$total_use)


### Step 5 : Corn price v sur regression (linear) model

reg1 <- lm(corn_price ~ SUR, data = WASDE) # corn price vs sur
#summary(Reg1) #uncomment to check


## testing gtsummary
library(gtsummary)
tbl_regression(reg1, intercept = TRUE) %>%
  add_glance_source_note(include = c(r.squared, nobs))


### Price elasticity calcs

#### needs means
mean_sur <- mean(WASDE$SUR)
mean_price <- mean(WASDE$corn_price)
elasticity <- reg1$coefficients[2]*(mean_sur/mean_price)

#elasticity <- reg1$coefficients[2]*(WASDE$SUR/WASDE$corn_price) ## not this, needs means so is over time, per year tells nothing of actual valie

##### explor resuduals
# Summary statistics of residuals
summary(resid(reg1))

# Histogram of residuals
hist(resid(reg1), 
     main = "Histogram of Linear Regression Errors",
     xlab = "Linear Model Residuals")


