#load cleaned data
data <- read_csv("data/cleaned_ecommerce_data.csv")

#set analysis date to 1 day after aximum order date
analysis_date <- max(data$OrderDate) + 1

#calculate rfm  metrics
rfm_table <- data%>%
group_by(CustomerID) %>%
  summarise(
    Recency = as.numeric(analysis_date - max(OrderDate)),
    Frequency = n_distinct(OrderID),
    Monetary = sum(TotalRevenue)
  )

#k means (data transformation)
rfm_scaled <- rfm_table %>%
  mutate(
    log_R = log(Recency),
    log_F = log(Frequency),
    log_M = log(Monetary)
  ) %>%
  select(log_R, log_F, log_M) %>%
  scale()

#applying k means (k = 3)
set.seed(123)
kmeans_model <- kmeans(rfm_scaled, centers = 3, nstart = 25)

#assigning clusters to original RFM table
final_segments <- rfm_table %>%
  mutate(Cluster = as.factor(kmeans_model$cluster)) %>%
  mutate(SegmentName = case_when(
    Cluster == 1 ~ "at risk",
    Cluster == 2 ~ "loyal high",
    Cluster == 3 ~ "new/occasional buyers",
    TRUE ~ "Other"
  ))

write_csv(final_segments, "data/customer_segments.csv")
print("RFM segments generated")