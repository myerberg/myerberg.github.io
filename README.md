# Using Ridge Regression to Predict NBA Win Percentage

## Introduction
Welcome to my data science tutorial, where I will guide you through the fascinating world of data science and its application in analyzing NBA professional basketball. The goal here is to unveil the “magic” of data science and regression analysis, demonstrating how they can be used to predict the performance of NBA teams accurately. This tutorial is designed to take you on a journey through the realm of NBA basketball statistics, where the analysis of comprehensive datasets has become an indispensable tool in shaping team strategies, player development, and making crucial financial decisions.

Throughout this tutorial, I will explore the statistical analysis of NBA team performance using a dataset that encompasses a broad spectrum of team features, including scoring patterns and defensive capabilities. You will learn how to apply data science methodologies to analyze these rich datasets effectively. We will delve into identifying key predictors of a team’s win percentage, a process that involves quantifying and using data to forecast a team’s future success accurately.

The focus will be on understanding and implementing two types of regression models — linear regression and Ridge regression — and unraveling their significance in making predictions. You will get insights into how multicollinearity affects the predictive models and how Ridge regression addresses this issue. Also, you will see firsthand how standardization plays a role in preparing our data for these models.

By the end of this tutorial, you should have a deeper understanding of the game from a data science perspective. This knowledge is not just academically fascinating; it equips team managers, coaches, and analysts with crucial insights, enabling informed decisions that could be the difference in a highly competitive sporting environment. Whether you are a data science enthusiast, a basketball fan, or someone interested in the intersection of sports and analytics, this tutorial is designed to offer you both foundational knowledge and practical skills in sports data analysis.  

## Data Gathering
In data gathering for data science projects, web scraping is a prominent technique used to collect data from the internet. A web scraper is essentially a program that downloads and processes content from the web. When considering a specific sports website for data collection, setting up a web scraper involves several detailed steps, particularly when using Python.

A web crawler can be used to navigate through the website. It is essentially a bot that systematically browses the web to identify and access the pages containing the data of interest. In the context of a sports website, it might be programmed to access specific sections like game results, player statistics, or team profiles. Once the crawler reaches the relevant pages, the scraper comes into play.  To set up a scraper for a sports website, you could use a Python library such as Beautiful Soup. It is designed to parse and extract structured data from HTML content. For instance, if you are scraping a basketball statistics website, your scraper would be coded to identify and extract specific elements like tables of player statistics or scores from games based upon patterns in the HTML.

This process involves:

1) Sending an HTTP request to the webpage URL.
2) Parsing the HTML content of the page, which is received in response.
3) Identifying the HTML elements that contain the data you need. This might involve inspecting the webpage to understand its structure, such as finding the specific tags, classes, or IDs that enclose the desired data.
4) Extracting and storing this data, typically in a structured format like CSV or JSON, or directly into a Pandas DataFrame for further analysis.

This setup allows for targeted extraction of data from specific parts of a website, making it a powerful tool for collecting up-to-date sports data. However, it is crucial to be aware of the legal and ethical considerations, as not all websites permit scraping, and heavy scraping activity can burden a website’s servers.  For my project on professional basketball data analysis, I chose to utilize a ready-made dataset from Kaggle, which contained comprehensive NBA data spanning from 1937 to 2012. By using this dataset, I was able to skip the web scraping phase and focus directly on data exploration and analysis. This pre-compiled dataset saved time and effort that would otherwise be spent in writing and testing web scraping scripts, parsing the scraped data, and dealing with potential issues like web page changes or data access restrictions (ESPN imposes these very restrictions, blocking web scrapers from pulling its data). However, for projects where up-to-date or specific data is required, writing a web scraper in Python is an invaluable skill that allows for the collection of real-time data directly from the web.

Source: https://www.kaggle.com/datasets/open-source-sports/mens-professional-basketball  

## Data Ethics

Data ethics, an integral part of responsible data science practice, extends far beyond just sports analytics and is vital in all domains where data is used to make decisions. Ethical considerations in data science encompass how data is collected, processed, analyzed, and interpreted. This is particularly important as the outcomes of data analysis can significantly influence real-world decisions and perceptions.

One key ethical concern in data science is bias. Bias in data can arise from various sources — from the way data is collected to how it is processed and interpreted.  In sports analytics, data often involves human performance metrics, team strategies, and player statistics, making it a domain sensitive to ethical considerations. The way this data is collected, processed, and interpreted can have significant implications. For instance, biases in data collection or analysis can inadvertently reinforce stereotypes or lead to unfair assessments of players and teams. Historical data, for example, might carry legacy biases regarding player selection or team strategies, which, if not carefully accounted for, could skew the analysis and perpetuate these biases.
 Similarly, in broader data science applications, biases can manifest in algorithms that are trained on non-representative datasets. This could lead to models that perpetuate existing stereotypes or inequalities, as they essentially “learn” from biased historical patterns.

Another ethical issue is the misrepresentation of information. Misinterpretation of data, either unintentionally or deliberately, can lead to erroneous conclusions. This is particularly risky when complex statistical methods are simplified for broader consumption, sometimes leading to the loss of crucial nuances.  In the context of NBA data, this might mean oversimplifying the contribution of a single player to a team’s success, ignoring the multifaceted nature of the game. Inaccurate or biased data can lead to misrepresentations, which not only distort our understanding of the game but could also impact decision-making processes in team management, player evaluation, and overall game strategy. The decisions based on such data could unfairly affect careers, team compositions, and the sport’s development.

To avoid these pitfalls, it is crucial to approach data science with a critical eye. This means:
1) Actively seeking diverse and representative datasets to mitigate the risk of biased models.
2) Being transparent about the limitations of the data and the methods used in analysis.
3) Regularly revisiting and revising models and assumptions to incorporate new data and insights, thus ensuring that analyses remain relevant and accurate.
4) Employing robust statistical methods to understand and account for potential biases in the data.

Ethical data handling is paramount to ensure the accuracy and fairness of the conclusions drawn. This involves being vigilant about how data is sourced and ensuring it is representative of the diverse aspects of the sport. It is essential to question and understand the underlying assumptions in the data, and to be transparent about the methodologies used in analysis.

In my analysis of NBA data, I approach the task with a keen awareness of data ethics. Initially, I meticulously assess the origins of my data, ensuring that it is sourced from reliable and credible platforms. For instance, the dataset used in my analysis is obtained from a reputable source, which guarantees a certain level of accuracy and comprehensiveness. During the analytical process, I rigorously examine the methods and techniques employed. This includes not just applying statistical models like linear and Ridge regression but also critically evaluating their appropriateness for the data at hand. For example, I chose Ridge regression specifically to address the multicollinearity in the dataset, ensuring that my model does not overly rely on interdependent variables. 

Continual model refinement is a key part of my process. I frequently revisit my models to integrate new data, adjust assumptions, and revalidate findings. This iterative process is crucial, especially in a dynamic field like NBA basketball, where player performance and team strategies evolve over time. Such updates help in maintaining the relevance and accuracy of my analysis.

My goal through this rigorous process is to achieve a deeper, more nuanced understanding of basketball, grounded in data integrity and ethical practice. In doing so, I aim to contribute positively to the field of data science, ensuring that the insights and conclusions drawn are both fair and trustworthy. This commitment to ethical data practices is vital not only in sports analytics but across all domains where data plays a pivotal role in decision-making.  

## Munging, Wrangling, and Cleaning Data 

In the realm of data science, particularly when working with extensive datasets like the one I accessed from Kaggle for NBA team analysis, data munging, wrangling, and cleaning are essential processes to ensure the reliability and accuracy of the outcomes. These datasets often contain a mix of relevant and irrelevant information, missing values, duplicates, and various formats that need to be addressed before any meaningful analysis can be conducted.

For my project, I meticulously combed through the CSV file, identifying and removing columns that contained a significant amount of missing data. An example of this was the statistics on rebounds, which were not consistently recorded throughout the years in the dataset. Including such incomplete data could have skewed the results of my analysis, leading to inaccurate predictions and conclusions. Hence, I chose to exclude these attributes from my analysis.

Additionally, I limited the range of my “cleaned” CSV file to include years 1946 to 2011. This is because 1937 to 1945, as well as 2012, were missing the important attributes I looked to analyze.

Furthermore, I implemented methods in my code to handle NaN (Not a Number) entries, effectively skipping over them to maintain the integrity of the dataset. This step is crucial as NaN values can disrupt many computational processes and lead to erroneous results if not appropriately managed.

In addition to handling missing data, part of the data munging process involved removing irrelevant information that does not contribute to the analysis’s objectives. For instance, the dataset included details about stadium names and capacities — information that, while interesting, was not pertinent to predicting team performances. By removing such irrelevant data, I could focus the analysis on variables that directly impact team success.

Lastly, I addressed the issue of duplicate data. The dataset had instances where information was repeated under different column names, such as various ways of writing the team name. Identifying and removing these duplicates was vital to streamline the dataset and prevent redundancy, which could otherwise lead to inefficiencies in the analysis process.

These transformations — handling missing values, removing irrelevant information, and eliminating duplicates — are integral to preparing the dataset for analysis. By cleaning and wrangling the data, I ensured that the dataset was optimized for developing a robust model, capable of providing insightful and accurate predictions about NBA team performances. This process not only enhances the quality of the analysis but also builds the foundation for deriving meaningful and trustworthy conclusions from the data.

## Analysis

My analysis of the NBA team dataset using regression models is rooted in the fundamental principles of statistical learning. Regression, at its core, is about establishing a relationship between a dependent variable and one or more independent variables. The objective is to predict the dependent variable based on the values of the independent variables. In this context, I aimed to predict a team’s win-loss percentage (dependent variable) from selected features (independent variables) such as field goal percentage, offensive points, assists, defensive points, and free throws made.

The process began by loading the dataset and calculating two critical metrics: field goal percentage and win-loss percentage. The field goal percentage (fg_percentage) is calculated as the ratio of field goals made (o_fgm) to field goals attempted (o_fga), and the win-loss percentage is the ratio of games won to total games played. These calculations are essential as they convert raw data into meaningful metrics that can be analyzed.

Following data preparation, I addressed data quality by removing any infinite or NaN (Not a Number) values. This step is crucial for ensuring the integrity and reliability of the analysis, as regression models require numerical input and cannot interpret NaN values.

In our analysis of NBA team data, we used two types of statistical models: linear regression and Ridge regression. Let’s break down these concepts for clarity:

### Linear Regression:

This is a basic form of regression analysis, which is a statistical method used to understand relationships between variables. Imagine it as finding the best straight line that goes through a scatter plot of data points. In linear regression, this best line represents the predicted relationship between an independent variable (or feature, like points scored) and a dependent variable (something you want to predict, like win-loss percentage). Each feature gets its own linear regression model in this analysis. To evaluate how well these models work, we use two metrics: 

### R-squared:

This tells us how much of the variation in our dependent variable (win-loss percentage) can be explained by the independent variable (like points scored). An R-squared value closer to 1 means the model explains a lot of the variation, which is good.

### Mean Squared Error (MSE):

This measures the average of the squares of the errors, that is, the average squared difference between the actual values and the values predicted by the model. A lower MSE means the model is more accurate.

### Ridge Regression:

In my analysis of NBA statistics, I chose Ridge Regression, an advanced variant of linear regression, to tackle a specific issue known as multicollinearity. Multicollinearity in this context refers to the situation where the independent variables (the features I am using for prediction) are highly correlated with each other. For example, in basketball, aspects such as field goals made and offensive points are likely to be correlated since more field goals generally lead to more points. This correlation between variables can cause problems in standard linear regression models, as it makes it difficult to determine the individual effect of each feature on the dependent variable, which in this case is the team’s win-loss percentage.

Ridge Regression modifies linear regression by introducing a penalty on the size of the coefficients. Here, coefficients are numerical values that represent the strength and direction of the relationship between each independent variable and the dependent variable. However, in Ridge Regression, there’s an additional component in the calculation that penalizes large coefficients, which prevents any single feature from having a disproportionately large influence on the predictions. This approach is particularly effective in addressing the challenges posed by multicollinearity. The penalty term’s strength is determined by a parameter known as 'alpha.' The higher the value of alpha, the greater the penalty imposed on large coefficients, which in turn reduces the risk of overfitting. Overfitting occurs when a model is too closely fitted to the specific details of the training data, making it perform poorly on new data.

In my implementation of the Ridge regression model for the NBA dataset, I used a “pipeline” approach. The first step in this pipeline was standardization, a process that adjusts the values of each feature in the dataset to have a mean of zero and a standard deviation of one. Standardization is critical because it ensures that all features contribute equally to the prediction and no single feature with large values overpowers the model. This step is especially important for Ridge Regression, as the penalty applied to the coefficients is effective only when all features are on a comparable scale. This approach allowed me to accurately assess the impact of each basketball statistic on a team’s win-loss percentage, despite the potential correlations among these features.  

### Let us examine my code step-by-step:

1) Ensure that you have the necessaries Python libraries installed on your machine. You can comment this line of code out if they are already installed.

```python
#install the necessary libraries on your machine
!pip install pandas numpy matplotlib scikit-learn
```

2) We delve into the practical application of data science techniques using our NBA dataset loaded from a CSV file. Our first step involves importing the necessary Python libraries that provide tools for data manipulation, statistical modeling, and visualization. 

We use Pandas for data handling, Numpy for numerical operations, and Matplotlib for plotting graphs. After loading the data, we calculate crucial basketball statistics like field goal percentage and win-loss percentage, providing us with insightful metrics for our analysis. These calculations are not just mere arithmetic; they transform raw data into meaningful information that reflects team performance.

To ensure the quality and reliability of our analysis, we also address data cleaning by handling infinite values and removing any rows with missing data. This step is critical in preparing our dataset for accurate and meaningful analysis.

Finally, we define a set of features for regression analysis. These features, such as total points scored and assists, are used to predict the win-loss percentage of teams, our target variable. By assigning descriptive titles to these features, we make our plots more understandable, laying a strong foundation for the regression analysis that follows.

```python
#import the necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression, RidgeCV
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.metrics import r2_score, mean_squared_error

#read the CSV file containing the NBA data into a pandas DataFrame
data = pd.read_csv('basketball_teams_cleaned.csv')

#calculate the field goal percentage as field goals made divided by field goals attempted
data['fg_percentage'] = data['o_fgm'] / data['o_fga']

#calculate the win-loss percentage as the number of games won divided by total games
data['win_loss_percentage'] = data['won'] / data['games']

#replace infinite values with NaN, and then drop rows with NaN values
data.replace([np.inf, -np.inf], np.nan, inplace=True)
data.dropna(inplace=True)

#define a list of feature names for the regression analysis
features = ['fg_percentage', 'o_pts', 'o_asts', 'd_pts', 'o_ftm']

#assign the win-loss percentage column as the target variable for the regression
y = data['win_loss_percentage']

#map feature names to more descriptive titles for plotting
feature_names = {
    
    'fg_percentage': 'Field Goal Percentage',
    'o_pts': 'Total Points Scored',
    'o_asts': 'Total Assists',
    'd_pts': 'Total Points Allowed',
    'o_ftm': 'Total Free Throws Made'
    
}
```

3) We take a closer look at each individual feature in our dataset and examine its relationship with the team’s win-loss percentage. To do this, we employ linear regression, a fundamental statistical technique that allows us to understand and quantify the relationship between a single independent variable (our feature) and a dependent variable (the win-loss percentage).

For each feature, we create a separate plot. These plots show the actual data points for each team and include a regression line. This line is the result of our linear regression model, representing the best fit through the data points, thereby illustrating the trend or relationship between the feature and the win-loss percentage.

By fitting a linear regression model to each feature, we also extract valuable statistics like the coefficient (indicating the rate of change of win-loss percentage with respect to the feature) and the intercept (the expected win-loss percentage when the feature value is zero). We also compute the R-squared value, which tells us how well the model explains the variation in win-loss percentage, and the Mean Squared Error, giving us a sense of the average prediction error. 

Each plot displays these insights, making it easier to understand the impact of each individual basketball statistic on a team’s overall performance. This approach provides a clear, visual representation of the data, aiding in our understanding of the complex dynamics of basketball team performance.

```python
#loop through each feature in the 'features' list to create individual regression plots
for feature in features:
    
    #create a new figure and axis for each plot with specified size
    # 'fig' refers to the entire figure, 'ax' refers to the specific axes object in the figure
    #setting the size to 8x6 inches for better visibility of the plot
    fig, ax = plt.subplots(figsize=(8, 6))

    #select the data for the current feature as the independent variable (X)
    #this step isolates the data for one specific feature to analyze its relationship with the target variable
    X_feature = data[[feature]]

    #initialize a linear regression model
    #LinearRegression() is a method from scikit-learn to perform linear regression
    lin_model = LinearRegression()

    #fit the linear regression model to the data
    #this process involves finding the best line that fits the data points for the current feature
    #the model learns the relationship between the feature (X_feature) and the target (y)
    lin_model.fit(X_feature, y)

    #make predictions using the fitted model
    #the model predicts the target variable (win-loss percentage) based on the feature data
    y_pred = lin_model.predict(X_feature)
    
    #extract the coefficient (slope) and intercept from the fitted model
    #the coefficient represents the change in the target variable for a one-unit change in the feature
    #the intercept is the value of the target variable when the feature is zero
    coefficient = lin_model.coef_[0]
    intercept = lin_model.intercept_

    #construct the linear regression formula as a string for display
    #this string represents the equation of the line fitted by the linear regression model
    formula = f'Win-Loss = {coefficient:.4f}*{feature} + {intercept:.4f}'

    #calculate the R-squared value for the model
    #R-squared is a statistical measure that represents the proportion of the variance in the dependent variable
    #that is predictable from the independent variable(s)
    #it represents how close the data are to the fitted regression line and is also known as the coefficient of determination
    #this metric provides an indication of the goodness of fit of the model
    #a higher R-squared value means the model explains more variability in the target variable relative to its mean
    #it provides an indication of how well the model explains the variation in the target variable
    r2 = r2_score(y, y_pred)

    #calculate the Mean Squared Error for the model
    #MSE is a measure of the average of the squares of the errors
    #the 'error' here is the difference between the actual and predicted values
    #MSE is a common measure of the accuracy of a regression model
    #a lower MSE indicates a closer fit of the model to the data
    mse = mean_squared_error(y, y_pred)

    #plot the actual data points on the plot
    #scatter plot is used to visualize the individual data points
    ax.scatter(X_feature, y, color='blue', alpha=0.5, label='Actual')

    #plot the regression line based on the model's predictions
    #the 'ax.plot' function is used to draw the line on the plot
    #'X_feature' represents the values of the current feature being analyzed
    #'y_pred' contains the predicted values of the target variable (win-loss percentage) by the linear regression model
    #these predictions are based on the learned relationship between 'X_feature' and 'y'
    #the line drawn represents the 'best fit' line through the data points
    #a 'best fit' line is the one where the total sum of the squares of the vertical distances of the points
    #from the line is minimized
    #this line visually demonstrates the trend or relationship as determined by the linear regression model
    #the closer the data points are to this line, the better the model is at predicting the target variable
    ax.plot(X_feature, y_pred, color='red', label='Predicted')

    #set the title, labels, and legend for the plot
    ax.set_title(f'Regression Analysis for {feature_names[feature]}')
    ax.set_xlabel(feature_names[feature])
    ax.set_ylabel('Win-Loss Percentage')
    ax.legend()

    #add the regression formula, R-squared value, and MSE value as a caption below the plot
    #this additional information provides insight into the model's equation and how well it fits
    plt.figtext(0.5, -0.1, f'Formula: {formula}\nR-squared: {r2:.4f}, MSE: {mse:.4f}', ha='center', fontsize=10)

    #display the plot
    #this command renders the plot and displays it to the user
    plt.show()
```

Sources: https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Ridge.html https://machinelearningmastery.com/ridge-regression-with-python/

![](https://myerberg.github.io/assets/images/plot-1-regression-analysis-for-field-goal-percentage.png)
![](https://myerberg.github.io/assets/images/plot-2-regression-analysis-for-total-points-scored.png)
![](https://myerberg.github.io/assets/images/plot-3-regression-analysis-for-total-assists.png)
![](https://myerberg.github.io/assets/images/plot-4-regression-analysis-for-total-points-allowed.png)
![](https://myerberg.github.io/assets/images/plot-5-regression-analysis-for-total-free-throws-made.png)
