# E-Commerce Customer Segmentation using RFM Analysis

## 📌 Project Overview
This data science project applies **RFM (Recency, Frequency, Monetary) analysis** and unsupervised machine learning (**K-Means Clustering**) to segment an e-commerce customer base. Segmenting customers allows businesses to run targeted marketing campaigns, optimize retention strategies, and maximize Customer Lifetime Value (CLV).

## 📊 Methodology
1. **Data Pipeline:** Handled missing data points and transaction anomalies.
2. **Feature Engineering:** Extracted Recency, Frequency, and Monetary metrics per unique user.
3. **Data Scaling:** Log-transformed and standardized features to handle right-skewed distributions.
4. **Clustering:** Deployed a K-Means algorithm to isolate distinct customer profiles.

## 🗂️ Repository Structure
* `scripts/01_data_cleaning.R`: Simulates the transactional data pipeline and cleans anomalies.
* `scripts/02_rfm_modeling.R`: Normalizes features and runs the K-Means algorithm.
* `scripts/03_visualization.R`: Evaluates segments and exports analytical charts.

## 🚀 Key Insights
* **Loyal High-Spenders:** Frequent purchasers who spent the most revenue recently. Target with loyalty rewards.
* **New / Occasional Buyers:** Low recency but low frequency. Target with welcome offers.
* **At Risk / Hibernating:** High recency (haven't bought in a long time). Target with win-back email campaigns.

## 🛠️ Tech Stack & Packages
* **Language:** R
* **Core Packages:** `tidyverse` (dplyr, ggplot2, purrr, readr), `lubridate`

## Future Improvements
The project may have a few errors such as mismatched entries or declaration issues. I will use the errors made this time to improve on future projects.
