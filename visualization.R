#load segment data
segments <- read_csv("data/customer_segments.csv")

#summary stats
cluster_summary <- segments %>%
  group_by(SegmentName)%>%
  summarise(
    CustomerCount = n(),
    AvgRegency = mean(Recency),
    AvgFrequency = mean(Frequency),
    AvgMonetary = mean(Monetary)
  )

print(cluster_summary)
#plot Frequency vs Monetary by Segment
segment_plot <- ggplot(segments, aes(x = Frequency, y = Monetary, color = SegmentName))+
  geom_jitter(alpha = 0.6, size = 2) +
  scale_x_log10() + scale_y_log10(labels = scales::dollar_format())+
  theme_minimal()+
  labs(
    title = "Customer Segmentation Analysis",
    subtitle = "RFM Clustering using K-Means",
    x = "Frequency of purchases (Log Scale)",
    y = "Total Revenue Contribution (Log Scale)",
    color = "Customer Segment"
  )+
    theme(legend.position = "bottom")

#save plot
ggsave("customer_segments_plot.png", plot = segment_plot, width = 8, height = 6)
print("Visualization saved as customer_segments_plot.png")
  
