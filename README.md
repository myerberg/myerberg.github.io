# **Using Ridge Regression to Predict NBA Win Percentage**

### **Introduction**
Welcome to this tutorial where I will guide you through the fascinating world of data science and its application in analyzing NBA professional basketball. The goal here is to unveil the “magic” of data science and regression analysis, demonstrating how they can be used to predict the performance of NBA teams accurately. This tutorial is designed to take you on a journey through the realm of NBA basketball, where the analysis of comprehensive datasets has become an indispensable tool in shaping team strategies, player development, and making crucial financial decisions.

Throughout this tutorial, I will explore the statistical analysis of NBA team performance using a dataset that encompasses a broad spectrum of team features, including scoring patterns and defensive capabilities. You will learn how to apply data science methodologies to analyze these rich datasets effectively. We will delve into identifying key predictors of a team’s win percentage, a process that involves quantifying and using data to forecast a team’s future success accurately.

The focus will be on understanding and implementing two types of regression models — linear regression and Ridge regression — and unraveling their significance in making predictions. You will get insights into how multicollinearity affects the predictive models and how Ridge regression addresses this issue. Also, you will see firsthand how standardization plays a role in preparing our data for these models.

By the end of this tutorial, you should have a deeper understanding of the game from a data science perspective. This knowledge is not just academically fascinating; it equips team managers, coaches, and analysts with crucial insights, enabling informed decisions that could be the difference in a highly competitive sporting environment. Whether you are a data science enthusiast, a basketball fan, or someone interested in the intersection of sports and analytics, this tutorial is designed to offer you both foundational knowledge and practical skills in sports data analysis. 


1) Ensure that you have the necessaries Python libraries installed on your machine. You can comment this line of code out if they are already installed.

```python
#install the necessary libraries on your machine
!pip install pandas numpy matplotlib scikit-learn
```

2) We delve into the practical application of data science techniques using our NBA dataset loaded from a CSV file. Our first step will involve importing the necessary Python libraries that provide tools for data manipulation, statistical modeling, and visualization. 

We use Pandas for data handling, Numpy for numerical operations, and Matplotlib for plotting graphs. After loading the data, we will calculate crucial basketball statistics like field goal percentage and win-loss percentage, providing us with insightful metrics for our analysis. These calculations are not just mere arithmetic; they transform raw data into meaningful information that reflects team performance.

To ensure the quality and reliability of our analysis, we also address data cleaning by handling infinite values and removing any rows with missing data. This step is critical in preparing our dataset for accurate and meaningful analysis.

Finally, we define a set of features for regression analysis. These features, such as total points scored and assists, will be used to predict the win-loss percentage of teams, our target variable. By assigning descriptive titles to these features, we make our plots more understandable, laying a strong foundation for the regression analysis that follows.

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

3) We take a closer look at each individual feature in our dataset and examine its relationship with the team's win-loss percentage. To do this, we will employ linear regression, a fundamental statistical technique that allows us to understand and quantify the relationship between a single independent variable (our feature) and a dependent variable (the win-loss percentage).

For each feature, we will create a separate plot. These plots show the actual data points for each team and include a regression line. This line is the result of our linear regression model, representing the best fit through the data points, thereby illustrating the trend or relationship between the feature and the win-loss percentage.

By fitting a linear regression model to each feature, we also extract valuable statistics like the coefficient (indicating the rate of change of win-loss percentage with respect to the feature) and the intercept (the expected win-loss percentage when the feature value is zero). We also compute the R-squared value, which tells us how well the model explains the variation in win-loss percentage, and the Mean Squared Error, giving us a sense of the average prediction error. 

Each plot will display these insights, making it easier to understand the impact of each individual basketball statistic on a team's overall performance. This approach will provide a clear, visual representation of the data, aiding in our understanding of the complex dynamics of basketball team performance.

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
![assets/images/plot-1-regression-analysis-for-field-goal-percentage.png]
![assets/images/plot-2-regression-analysis-for-total-points-scored.png]
![assets/images/plot-3-regression-analysis-for-total-assists.png]
![assets/images/plot-4-regression-analysis-for-total-points-allowed.png]
![assets/images/plot-5-regression-analysis-for-total-free-throws-made.png]
