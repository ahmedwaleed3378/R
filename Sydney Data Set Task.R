#احمد وليد اصلان 
#رابعه بايو 


# First we should read the  file
sydneyDataSet <- read.csv("G3_sydney_hobart_times.csv", header = TRUE)
sydneyDataSet
# Remove "day" from the Time column and convert it to numeric
sydneyDataSet$Time <- as.numeric(sub("day", "", sydneyDataSet$Time))

# get a mean of time to input the missing value 
mean_time <- mean(sydneyDataSet$Time)
cat("Mean Time:", mean_time, "\n")
rows_to_update <- c(5, 9, 13, 19, 31, 46, 58)
sydneyDataSet[rows_to_update, "Time"] <- 6.959848
#make inputation to the column code.time,less.than.3
rows_to_update <- 1:72
sydneyDataSet[rows_to_update, "Code.Time.less.than.3"] <- ifelse(sydneyDataSet$Time < 3, "less than 3", "more than 3")
sydneyDataSet
# Check the structure of the dataframe
str(sydneyDataSet)

# Calculate the minimum and maximum time
min_time <- min(sydneyDataSet$Time)
max_time <- max(sydneyDataSet$Time)
cat("Minimum Time:", min_time, "\n")
cat("Maximum Time:", max_time, "\n")
library(ggplot2)

# Create the bar chart of code.time.less.than.3
ggplot(sydneyDataSet, aes(x = Year, fill = Code.Time.less.than.3)) +
  geom_bar() +
  labs(x = "Year", y = "Count", fill = "Code Time") +
  scale_fill_manual(values = c("more than 3" = "black", "less than 3" = "grey")) +
  theme_minimal()
library(ggplot2)

# Create scatter plot of fleet start and fleet finish 
ggplot(sydneyDataSet) +
  geom_point(aes(x = fleet_start, y = fleet_finish), color = "blue", size = 3) +
  labs(title = "Start Fleet vs Finish Fleet",
       x = "Fleet Start",
       y = "Fleet Finish") +
  theme_minimal()
# Create a histogram of year
ggplot(sydneyDataSet) +
  geom_histogram(aes(x = Year), binwidth = 1, fill = "lightblue", color = "black") +
  labs(title = "Histogram of Year",
       x = "Year",
       y = "Frequency") +
  theme_minimal()
# Create a histogram of Time
hist(sydneyDataSet$Time, breaks = 20, xlab = "Time", ylab = "Frequency", main = "Distribution of Recorded Times")
ggplot(sydneyDataSet) +
  geom_point(aes(x =Year, y = Time, color = Code.Time.less.than.3), size = 3) +
  labs(title = "yearvs time"
       x = "year",
       y = "time") +
  theme_minimal()

ggplot(sydneyDataSet) +
  geom_point(aes(x =Year, y = fleet_start, color = Code.Time.less.than.3), size = 3) +
  labs(title = "year startfleet",
       y = "Fleet Start",
       x = "year") +
  theme_minimal()
ggplot(sydneyDataSet) +
  geom_point(aes(x =Year, y = fleet_finish, color = Code.Time.less.than.3), size = 3) +
  labs(title = "year fleet_finish",
       y = "fleet_finisht",
       x = "year") +
  theme_minimal()
