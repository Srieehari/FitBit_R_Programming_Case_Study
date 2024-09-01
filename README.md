Hello ! My name is Srieehari Muthu and this is my first Data Analysis Project using R. Through this simple case study I learned numerous R functions such as creating graphs, mutating data frames, and how the data analysis process works in general. I hope to use this expereicne in the future and apply this knowledge to more complex data frames. 

**Introduction:**

Purpose of the Case Study: Bella beat, a small upcoming wellness technology company, seeks to expand its market presence by leveraging insights from smart device usage data. As a Junior Data analyst on the marketing analytics team, I will analyze this data to discover trends on how consumers use smart devise and provide recommendations for Bellabeat’s marketing strategy.  This analysis will focus on how these trends can be applied to one of Bellabeat’s products, helping future marketing efforts.
Scenario: This case study is intended to simulate a real-world situation where a growing company needs to leverage data insights and improve its marketing strategy. The dataset used to make these insights will be from the public Fitbit dataset found on Kaggle. 

**Identified Problems:**
Understanding Consumer Behavior: Bellabeat needs to understand how users interact with their smart devices to determine opportunities to enhance their products.
Data Limitations: The available Fitbit dataset may not fully represent Bellabeat’s target audience due to factors such as drive to be healthy.


**Data Analysis Approach:**

1.Loading and Previewing Data:
Datasets Loaded:
daily_activity: Contains information on users' daily activities, including total distance covered, total steps, and calories burned.
heartrate_data: Contains heart rate data collected at regular intervals.
weightLogInfo: Includes user weight data, such as initial and final weights over time.

2. Calculating Weight Difference:
Objective: Determine if there were significant changes in users' weights over time.


Sorted the weightLogInfo data by Id and Date.
Calculated the first and last recorded weights (InitialWeight and FinalWeight) for each user.
Computed the weight difference (WeightChange) for each user.
Outcome: Provides insights into how much weight change occurred for each user, which is critical in understanding the effectiveness of physical activity for weight management.

3. Calculating Average Distance and Calories Burned:
Objective: Understand the average physical activity levels and calorie expenditure for each user.


Grouped the daily_activity dataset by user Id.
Calculated the average total distance (AverageDistance) and average calories burned (AverageCalories) for each user.
Outcome: Helps to identify patterns in physical activity and caloric burn across different users, which can inform recommendations for Bellabeat’s products.

4. Analyzing Maximum Heart Rate:
Objective: Identify the maximum heart rate achieved by each user, which may correlate with fitness levels or exertion intensity.


Grouped the heartrate_data by user Id.
Calculated the maximum heart rate (max) for each user.
Outcome: This information can provide insights into user fitness levels and help tailor health recommendations for Bellabeat’s products.

5. Combining Data for Comprehensive Analysis:
Objective: Create a unified dataset to analyze the relationship between various metrics such as weight change, distance, calories burned, and heart rate.


Merged (left_join) the different datasets (weight_diff, average_distance_by_id, max_heartrate) on Id to create a combined_data table.
Outcome: This integrated dataset allows for more holistic analysis and correlations between multiple factors that affect user health and behavior.

6. Visualizing Key Relationships:

Graphs Created:
Relationship Between Steps and Calories Burned:
Objective: Visualize the correlation between the number of steps taken and calories burned.
Method: Scatter plot with a linear regression line to show trends between total steps and calories burned.
Outcome: Provides insights into how physical activity directly influences caloric expenditure.
Initial and Final Weights for Each ID:
Objective: Compare the initial and final weights of each user to visualize weight changes.
Method: Bar plot showing initial and final weights side by side for each user.




**Graphs **
![StepsVCalories](https://github.com/user-attachments/assets/5a8123c7-d8ff-494e-96d6-1ff61adc9a34)
![Initial Vs Final Weight](https://github.com/user-attachments/assets/da80561b-93c8-4e13-b1ff-9d86630f8fcd)

**Key points **
The analysis reveals a slight correlation between the distance covered and the number of calories burned, indicating that increased physical activity does have some impact on calorie expenditure. However, the data shows almost no change in weight for most individuals, suggesting that distance alone may not be a sufficient indicator of weight loss. 

Other factors, such as individual health conditions, dietary habits, and metabolism, likely play significant roles in achieving weight loss goals. It is recommended that the company further investigate these factors to provide a more comprehensive approach to weight management, tailoring their programs to address these variables for better client outcomes.



**What Was Learned: The case study highlighted the importance of data-driven decision-making in shaping marketing strategies. By analyzing consumer behavior, Bellabeat can refine its product positioning, identify new market opportunities, and drive customer engagement.
**
**Future Plans**

 •Investigate Additional Factors: Conduct further research to identify and analyze other variables that may influence weight loss including:
•	dietary intake
•	metabolism
•	underlying health conditions. 
I want to do this by collecting additional data on nutrition and health metrics.
•  Enhance Data Collection: Expand the scope of data collection to include more datasets that are provided in the Kaggle Dataset. This can help in building a more accurate and comprehensive model for predicting weight loss.
•  Monitor and Evaluate: In the event that new interventions are applied I want to incorporate this programs and the data that is collected from them. I want to collect feedback and evaluate the impact on users’ weight and overall health to ensure that the adjustments are making a positive difference.
•  Update Marketing Strategies: Adjust marketing strategies to highlight the comprehensive approach of the company’s wellness programs. Emphasize the importance of a holistic approach to health, integrating both physical activity and other critical factors.

