# Collect the residuals from the last regression, create a time series of the errors with a one-year lag of the error, then regress the error terms on the lagged error terms
error <- ts(resid(reg3), start=1973, end=2019, frequency=1)   # the ts() function tells R to set the errors as a time-series 
lag_error <- lag(error, -1)                                   # the lag() function creates a one-period lag of the error term
error <- cbind(error, lag_error)                              # cbind() binds the specified vectors together as columns to create a new data frame

reg4 <- lm(error ~ lag_error, data=error)

summary(reg4)

# Summary
reg4_summary <- tbl_regression(reg4, intercept = TRUE) %>%
  add_glance_source_note(include = c(r.squared, nobs))
reg4_summary
