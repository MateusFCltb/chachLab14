## Script that calculates all calculated values for this lab

### Step 4 : Relating price to corn stock-to-use ratio (SURt)

WASDE$SUR <- ((WASDE$end_stocks)/WASDE$total_use)


### Step 5 : Corn price v sur regression (linear) model

reg1 <- lm(corn_price ~ SUR, data = WASDE) # corn price vs sur
#summary(Reg1) #uncomment to check


## testing gtsummary
library(gtsummary)
reg1_summary <- tbl_regression(reg1, intercept = TRUE) %>%
  add_glance_source_note(include = c(r.squared, nobs))


### Price elasticity calcs

#### needs means
mean_sur <- mean(WASDE$SUR)
mean_price <- mean(WASDE$corn_price)
elasticity <- reg1$coefficients[2]*(mean_sur/mean_price)

#elasticity <- reg1$coefficients[2]*(WASDE$SUR/WASDE$corn_price) ## not this, needs means so is over time, per year tells nothing of actual valie

##### explor resuduals
# Summary statistics of residuals
reg1_residualSummary <- summary(resid(reg1))
# Table that is formatted for rmarkdown for reg1_residualSummary not as a data frame
t_reg1_residualSummary <- data.frame(
  Min = min(resid(reg1)),
  Q1 = quantile(resid(reg1), 0.25),
  Median = median(resid(reg1)),
  Mean = mean(resid(reg1)),
  Q3 = quantile(resid(reg1), 0.75),
  Max = max(resid(reg1))
)


# Histogram of residuals
g_histResid <- plot(hist(resid(reg1)), 
     main = "Histogram of Linear Regression Errors",
     xlab = "Linear Model Residuals")


