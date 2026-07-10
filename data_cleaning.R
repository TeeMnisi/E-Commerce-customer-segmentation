#data cleaning

library(lubridate)

#e commerce data
set.seed(42)
n_orders <- 5000
customer_ids <- paste0("CUST-", sprintf("%04d", sample(1:800, n_orders, replace = TRUE)))

start_date <- as.Date("2025-01-01")
end_date <- as.Date("2026-06-30")
order_dates <- sample(seq(start_date, end_date, by="day"), n_orders, replace = TRUE)

raw_data <- tibble(
  OrderID = paste0("ORD-", 1000 + 1:n_orders),
  CustomerID = customer_ids,
  OrderDate = order_dates,
  Quantity = sample(1:10, n_orders, replace = TRUE, prob = c(0.4, 0.3, 0.15, 0.08, 0.03, 0.01, 0.01, 0.01, 0.005, 0.005)),
  UnitPrice = round(runif(n_orders, 5, 150), 2)
)%>%
  mutate(TotalRevenue = Quantity * UnitPrice)

raw_data$CustomerID[sample(1:n_orders, 50)]<-NA

#data cleaning
cleaned_data <- raw_data %>%
  
  #remove rows with missing customerIDs
  filter(!is.na(CustomerID)) %>%
  
  # filter anomalies
  filter(Quantity > 0, UnitPrice >0)

#cleaned data for next step
dir.create("data", showWarnings = FALSE)
write_csv(cleaned_data, "data/cleaned_ecommerce_data.csv")
print("data cleaned and saved")