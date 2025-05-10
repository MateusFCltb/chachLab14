# Create a character variable denoting the two time periods, create a dummy variable for the post-2006 period, graph a scatterplot of price on SUR with unique colors and regression lines for each period
WASDE$period <- ifelse(WASDE$year >= 2006, "2006-2019", "1973-2005")
WASDE$P2006 <- as.numeric(WASDE$year >= 2006)

ggplot(data=WASDE, aes(x=SUR, y=corn_price, color=period)) +
  geom_point(shape=1) +
  geom_smooth(method=lm, se=FALSE) +
  ggtitle("Corn Prices vs. Stock-to-Use Ratio (1973–2019)") +
  labs(y="Corn Price ($)", x="Stock-to-Use Ratio")+
  ylim(0, 7) 

# Run a linear regression with time period specific
reg3 <- lm(corn_price ~ SUR + P2006 + SUR:P2006, data=WASDE)

summary(reg3)
## summary
reg3_summary <- tbl_regression(reg3, intercept = TRUE) %>%
  add_glance_source_note(include = c(r.squared, nobs))

reg3_summary
