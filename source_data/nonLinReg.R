# Create the inverse of stock-to-use ratio, run the regression, and examine the error terms
WASDE$SUR_Inv <- 1 / WASDE$SUR
reg2 <- lm(corn_price ~ SUR_Inv, data=WASDE)

summary(reg2)
# Summary 
library(gtsummary)
reg2_summary <- tbl_regression(reg2, intercept = TRUE) %>%
  add_glance_source_note(include = c(r.squared, nobs))

reg2_summary

# Residual analysis
summary(resid(reg2))
hist(resid(reg2), main="Histogram of Non-linear Regression Errors", xlab="Non-linear Model Residuals")

# Residuals vs SUR plot
ggplot(data=WASDE, aes(x=SUR, y=resid(reg2))) +
  geom_point(shape=1) +
  ggtitle("Non-linear Regression Errors vs. Stock-to-Use Ratio") +
  labs(y="Errors", x="Stock-to-Use Ratio")
