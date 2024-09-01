library(tidyverse)
library(lubridate)
library(janitor)
library(ggplot2)
library(skimr)

install.packages('dplyr')
library(dplyr)

# Loading the datasets
#There are more datasets however these are the 3 that I used.
daily_activity <- read_csv("/cloud/project/data/dailyActivity_merged.csv")
heartrate_data <- read_csv("/cloud/project/data/heartrate_seconds_merged.csv")
weightLogInfo <- read_csv("/cloud/project/data/weightLogInfo_merged.csv")

#preview the datasets
weightLogInfo
heartrate_data


# Count the number of unique IDs in weightLogInfo
num_unique_ids <- weightLogInfo %>% summarise(unique_ids = n_distinct(Id))


# Display the result
num_unique_ids

#this calculates the weight Difference  
weight_diff <- weightLogInfo %>%
  arrange(Id, Date) %>%  # Sort by ID and Date
  group_by(Id) %>%
  summarize(
    InitialWeight = first(WeightKg),  # Get the first weight entry for each ID
    FinalWeight = last(WeightKg),     # Get the last weight entry for each ID
    WeightChange = FinalWeight - InitialWeight  # Calculate the difference
  ) %>%
  ungroup()


weight_diff

#average distance
average_distance_by_id <- daily_activity %>%
  group_by(Id) %>%  # Group by each unique ID
  summarize(
    AverageDistance = mean(TotalDistance, na.rm = TRUE),
    AverageCalories = mean(Calories, na.rm= TRUE)
            
            
            )

daily_activity <- daily_activity %>%
  mutate(ActivityDate = mdy(ActivityDate))

duration <- daily_activity %>%
  group_by(Id) %>%
  summarize(
    
    DurationDays = as.numeric(difftime(max(ActivityDate), min(ActivityDate), units = "days"))
  )%>%
  ungroup()

duration

average_distance_by_id

heartrate_data

max_heartrate <- heartrate_data %>%
  group_by(Id) %>%
  summarize(
    max = max(Value)  
  )

max_heartrate


sum_of_activity <- dailyActivity_merged %>%
  group_by(Id) %>%
  summarize(
    
    totalSteps = sum(TotalSteps, na.rm = TRUE),
    totalCalories = sum(Calories, na.rm = TRUE),
    
    
  )


sum_of_activity

# Compare Ids between data frames
intersect(weight_diff$Id, average_heartrate$Id)

#Combines Average distance + Duration + Heart Rate
combined_data <- weight_diff %>%
  left_join(average_distance_by_id, by = "Id") %>%
  left_join(duration, by = "Id") %>%
  left_join(max_heartrate, by = "Id")%>%
  left_join(sum_of_activity, by = "Id")


combined_data

ggplot(sum_of_activity, aes(x = totalSteps, y = totalCalories)) +
  geom_point(color = "purple", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Relationship Between Steps and Calories Burned", x = "Total Steps", y = "Calories Burned")







lm_eqn <- function(model) {
  intercept <- coef(model)[1]  # Extract the intercept
  slope <- coef(model)[2]      # Extract the slope
  r_squared <- summary(model)$r.squared
  
  # Create a formatted equation as a character string
  eq <- paste0("y = ", round(intercept, 2), " + ", round(slope, 2), "x", 
               ",   ", "R² = ", round(r_squared, 3))
  return(eq)
}

# Fit the linear model
model <- lm(totalCalories ~ DurationDays, data = combined_data)


long_data <- pivot_longer(combined_data, 
                          cols = c(InitialWeight, FinalWeight), 
                          names_to = "WeightType", values_to = "Weight")

combined_data <- combined_data %>%
  mutate(Digit = dense_rank(Id))

combined_data

ggplot(long_data, aes(x = factor(Digit), y = Weight, fill = WeightType)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Initial and Final Weights for Each ID",
       x = "ID_Digit", y = "Weight (kg)") +
  theme_minimal()


install.packages("devtools")
library(devtools)
