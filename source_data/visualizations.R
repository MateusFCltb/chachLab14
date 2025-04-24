## script containing visualzation code

### timeseries supply trends over time

# Plot corn prices, total corn supply, and total corn demand over time
g_price <- xy_line(WASDE, WASDE$year, WASDE$corn_price, "Corn Prices Over Time (1973-2019", 
                           c("Corn Price($)", "Year"), "red", FALSE)
g_price
#g_demand uses year on x axis and total_use for Y axis
g_demand <- xy_line(WASDE, WASDE$year, WASDE$total_use, "Corn Demand Over Time (1973-2019", 
                           c("Corn Demand($)", "Year"), "blue", FALSE)
g_demand
  
g_supply <- xy_line(WASDE, WASDE$year, WASDE$total_supply, "Corn Supply Over Time (1973-2019", 
                           c("Corn Supply($)", "Year"), "green", FALSE)
g_supply
  
grid.arrange(g_price, g_demand, g_supply, nrow=3)

# use gg save to save all plots with an appropriate name
ggsave("corn_supply_demand_price.png", 
       plot = grid.arrange(g_price, g_demand, g_supply, nrow=3), 
       width = 8, height = 10, dpi = 300)

#=================================
# PRICEvsSUR

g_pricevsSUR <- xy_point(WASDE, WASDE$SUR, WASDE$corn_price, "Corn Price vs Stock to use ratio (1973-2019)", c( "Corn Price ($)", "Stock to use ratio"), "orange", TRUE)
g_pricevsSUR

#================================

# Residuals vs sur plot
g_residVSsur <- xy_point(WASDE, WASDE$SUR, resid(reg1), "Residuals Vs SUR", c("SUR", "Residuals"), "orange", FALSE)
g_residVSsur

