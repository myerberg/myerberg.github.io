# Tyler Myerberg
# 3.26.24
# Logistic Regression vs. Naive Bayes - Spam/Ham SMS Classification
# Dataset Source: https://www.kaggle.com/datasets/uciml/sms-spam-collection-dataset/data

# Load necessary libraries

# dplyr: Used for data manipulation, transforming spam/ham into binary labels with mutate() and selecting relevant columns with select()
library(dplyr)

# naivebayes: Implements Naive Bayes model training with Laplace smoothing on using the naive_bayes() function
library(naivebayes)

# ggplot2: Utilized for plotting ROC curves and creating visual comparisons between models using the ggplot() function
library(ggplot2)

# caret: Facilitates splitting the dataset into training and testing sets with createDataPartition(), and evaluates model performance with confusionMatrix()
library(caret)

# tm: Supports text preprocessing tasks like converting to lowercase, removing punctuation/numbers, and excluding stopwords with functions like tolower(), removePunctuation(), and removeWords()
library(tm)

# glmnet: Employed for fitting a logistic regression model with cross-validation on TF-IDF transformed text data using cv.glmnet() function
library(glmnet)

# pROC: Provides functionality for computing ROC curves and AUC statistics for model evaluation using roc() and auc() functions
library(pROC)

# text2vec: Utilized for tokenization, creation of a vocabulary, and building a Document-Term Matrix from text data using itoken(), create_vocabulary(), and create_dtm() functions
library(text2vec)

# Matrix: Converts Document-Term Matrices into sparse matrices for efficient logistic regression modeling with glmnet using the as() function with CsparseMatrix
library(Matrix)

# ROSE: Applied to oversample the minority class in the training data, addressing class imbalance to improve model performance using the ovun.sample() function
library(ROSE)

# Load the dataset
data <- read.csv("spam.csv", stringsAsFactors = TRUE)

# Preprocess the text
clean_text <- function(x) {
  x <- iconv(x, "UTF-8", "ASCII//TRANSLIT")
  x <- tolower(x)
  x <- removePunctuation(x)
  x <- removeNumbers(x)
  x <- removeWords(x, stopwords("english"))
  return(x)
}

# Applies clean_text function to data$v2, storing results in data$text
data$text <- sapply(data$v2, clean_text)

# Data preparation, transforming spam and ham into binary labels
data <- data %>%
  mutate(v1 = as.factor(ifelse(v1 == "spam", 1, 0))) %>%
  select(v1, v2)

# Split the data into training and testing sets
set.seed(0) # For reproducibility
index <- createDataPartition(data$v1, p = .8, list = FALSE)
trainData <- data[index, ]
testData <- data[-index, ]

# Oversampling the minority class in the training data
trainDataOversampled <- ovun.sample(v1 ~ ., data = trainData, method = "over", N = length(trainData$v1))$data

# Train a Naive Bayes model with Laplace smoothing on the oversampled training data
model_nb <- naive_bayes(v1 ~ ., data = trainDataOversampled, laplace = 1)

# Generates NB model predictions for testData
predictions_nb <- predict(model_nb, testData)

# Evaluate model performance
confMat_nb <- confusionMatrix(predictions_nb, testData$v1)
print(confMat_nb)

# Generate probability predictions
prob_predictions_nb <- predict(model_nb, testData, type = "prob")[,2]

# Compute the ROC curve
roc_nb <- roc(testData$v1, prob_predictions_nb)

# Create a data frame for Naive Bayes ROC (FPR is False Positive Rate, TPR is True Positive Rate)
roc_data_nb <- data.frame(
  FPR = 1 - roc_nb$specificities,
  TPR = roc_nb$sensitivities,
  Model = 'Naive Bayes'
)

# AUC for Naive Bayes
auc_nb <- auc(roc_nb)

# Plot the Naive Bayes ROC curve using ggplot2
ggplot() + 
  geom_line(aes(x = 1 - roc_nb$specificities, y = roc_nb$sensitivities), color = "blue") + 
  geom_line(aes(x = c(0, 1), y = c(0, 1)), linetype = "dashed") +  # Draw no-skill line
  geom_text(aes(x = 0.75, y = 0.68, label = "No-skill line"), color = "darkblue") +  # Label for the no-skill line
  labs(title = "ROC Curve for Naive Bayes Model", 
       subtitle = paste0("AUC: ", round(auc_nb, 3)),  # Add subtitle for AUC
       x = "False Positive Rate (1 - Specificity)", 
       y = "True Positive Rate (Sensitivity)",
       caption = "The ROC curve demonstrates the trade-off between sensitivity and specificity at various threshold settings.\nAn AUC of 0.607 tells us that the model has a moderate ability to discriminate between the positive and negative classes; specifically,\nthere is a 60.7% chance that the model will rank a randomly chosen positive instance higher than a randomly chosen negative instance.") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),  # Center title
        plot.subtitle = element_text(hjust = 0.5),  # Center subtitle
        plot.caption = element_text(hjust = 0.5))  # Center caption

# Reload the dataset
data <- read.csv("spam.csv", stringsAsFactors = FALSE)

# Preprocess the text
clean_text <- function(x) {
  x <- iconv(x, "UTF-8", "ASCII//TRANSLIT")
  x <- tolower(x)
  x <- removePunctuation(x)
  x <- removeNumbers(x)
  x <- removeWords(x, stopwords("english"))
  return(x)
}

# Applies clean_text function to data$v2, storing results in data$text
data$text <- sapply(data$v2, clean_text)

# Transform spam and ham into binary labels
data$v1 <- as.factor(ifelse(data$v1 == "spam", 1, 0))

# Split the data into training and testing sets
set.seed(0) # For reproducibility
train_indices <- createDataPartition(data$v1, p = 0.8, list = FALSE)
trainData <- data[train_indices, ]
testData <- data[-train_indices, ]

# Tokenization and creation of a vocabulary
it_train <- itoken(trainData$text, progressbar = FALSE)
it_test <- itoken(testData$text, progressbar = FALSE)
vectorizer <- vocab_vectorizer(vocabulary = create_vocabulary(it_train))

# Creation of Document-Term Matrix for both training and test data
dtm_train <- create_dtm(it_train, vectorizer)
dtm_test <- create_dtm(it_test, vectorizer)

# Apply TF-IDF transformation
tfidf <- TfIdf$new()
dtm_train_tfidf <- fit_transform(dtm_train, tfidf)
dtm_test_tfidf <- transform(dtm_test, tfidf)

# Convert to sparse matrices expected by glmnet
X_train_sparse <- as(dtm_train_tfidf, "CsparseMatrix")
X_test_sparse <- as(dtm_test_tfidf, "CsparseMatrix")
y_train <- as.numeric(trainData$v1) # Ensure binary numeric format

# Fit logistic regression model with cross-validation
cv_fit <- cv.glmnet(X_train_sparse, y_train, family = "binomial")

# Generate probability predictions
prob_predictions_lr <- predict(cv_fit, newx = X_test_sparse, s = "lambda.min", type = "response")

# Convert probabilities to binary predictions
predicted_classes_lr <- ifelse(prob_predictions_lr > 0.5, 1, 0)

# Convert binary predictions to factor for confusion matrix
predicted_classes_factor <- factor(predicted_classes_lr, levels = levels(testData$v1))

# Compute the confusion matrix
confusion_matrix_lr <- confusionMatrix(predicted_classes_factor, testData$v1)

# Print the confusion matrix
print(confusion_matrix_lr)

# Compute and plot the ROC curve
roc_data_lr <- roc(response = as.numeric(as.character(testData$v1)), predictor = prob_predictions_lr)

# AUC for Logistic Regression
auc_lr <- auc(roc_data_lr)

# Compute the ROC curve for Logistic Regression predictions
roc_lr <- roc(response = as.numeric(as.character(testData$v1)), predictor = prob_predictions_lr)

# Create a data frame for plotting with ggplot2 (FPR is False Positive Rate, TPR is True Positive Rate)
roc_data_lr <- data.frame(
  FPR = 1 - roc_lr$specificities,
  TPR = roc_lr$sensitivities
)

# Plot the Logistic Regression ROC curve using ggplot2
ggplot() + 
  geom_line(aes(x = 1 - roc_lr$specificities, y = roc_lr$sensitivities), color = "blue") + 
  geom_line(aes(x = c(0, 1), y = c(0, 1)), linetype = "dashed") +  # Draw no-skill line
  geom_text(aes(x = 0.75, y = 0.68, label = "No-skill line"), color = "darkblue") +  # Label for the no-skill line
  labs(title = "ROC Curve for Logistic Regression Model", 
       subtitle = paste0("AUC: ", round(auc_lr, 3)),  # Add subtitle for AUC
       x = "False Positive Rate (1 - Specificity)", 
       y = "True Positive Rate (Sensitivity)",
       caption = "The ROC curve illustrates the balance between sensitivity and specificity at different thresholds. With an AUC of 0.961, this model has a\n96.1% chance of ranking a randomly chosen positive instance higher than a negative one. This is significant improvement over Naive Bayes.") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),  # Center title
        plot.subtitle = element_text(hjust = 0.5),  # Center subtitle
        plot.caption = element_text(hjust = 0.5))  # Center caption

# Combine the data frames with an additional Model column for distinguishing the models in the plot
roc_data_nb$Model <- 'Naive Bayes'
roc_data_lr$Model <- 'Logistic Regression'
roc_data_combined <- rbind(roc_data_nb, roc_data_lr)

# Create the combined NB/LR ROC plot with ggplot2
roc_plot <- ggplot(roc_data_combined, aes(x = FPR, y = TPR, color = Model)) +
  geom_line() +  # Draw ROC curves
  geom_abline(linetype = "dashed", color = "gray", slope = 1, intercept = 0) +  # Draw no-skill line
  geom_text(aes(x = 0.5, y = 0.5, label = "No-skill line"), color = "darkblue", vjust = 2.5) +  # Label for the no-skill line
  scale_color_manual(values = c("Naive Bayes" = "blue", "Logistic Regression" = "red")) +  
  labs(title = "ROC Curve Comparison", 
       subtitle = paste0("AUC for Naive Bayes: ", round(auc_nb, 3), "; AUC for Logistic Regression: ", round(auc_lr, 3)),
       x = "False Positive Rate (1 - Specificity)", 
       y = "True Positive Rate (Sensitivity)",
       caption = "The ROC curve closer to the top-left corner indicates better performance.\nLogistic Regression offers superior performance to Naive Bayes for this dataset.") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),  # Center the title
        plot.subtitle = element_text(hjust = 0.5),  # Center the subtitle
        plot.caption = element_text(hjust = 0.5),  # Center the caption
        legend.position = "right",  # Move legend to right
        legend.title = element_text(hjust = 0.5))  # Center legend title

# Print the ROC plot
print(roc_plot)

# Define a sequence of FPR values
fpr_seq <- seq(0, 1, length.out = 100)

# Interpolate TPR values at these FPR values for both models
tpr_nb_interp <- approx(roc_nb$specificities, roc_nb$sensitivities, xout = 1 - fpr_seq)$y
tpr_lr_interp <- approx(roc_lr$specificities, roc_lr$sensitivities, xout = 1 - fpr_seq)$y

# Create a data frame for the ribbons
ribbon_data <- data.frame(
  FPR = fpr_seq,
  TPR_NB = tpr_nb_interp,
  TPR_LR = tpr_lr_interp,
  TPR_Base = rep(0, length(fpr_seq))  # Baseline TPR (0) for the bottom part of the ribbon
)

# Combine the data frames
roc_data <- rbind(roc_data_nb, roc_data_lr)

# Create the combined ROC curve plot with ribbons
roc_plot_with_ribbon <- ggplot() +
  geom_ribbon(data = ribbon_data, aes(x = FPR, ymin = TPR_Base, ymax = TPR_NB), fill = "skyblue", alpha = 0.5) +
  geom_ribbon(data = ribbon_data, aes(x = FPR, ymin = TPR_Base, ymax = TPR_LR), fill = "lightgreen", alpha = 0.5) +
  geom_line(data = roc_data, aes(x = FPR, y = TPR, color = Model)) +
  geom_abline(linetype = "dashed", color = "gray", slope = 1, intercept = 0) +  # Draw no-skill line
  geom_text(aes(x = 0.5, y = 0.5, label = "No-skill line"), color = "darkblue", vjust = 3.4) +  # Label for the no-skill line
  scale_color_manual(values = c("Naive Bayes" = "blue", "Logistic Regression" = "red")) +
  labs(title = "ROC Curve Comparison with AUC Values",
       subtitle = paste0("AUC for Naive Bayes: ", round(auc_nb, 3), 
                         "; AUC for Logistic Regression: ", round(auc_lr, 3)),
       x = "False Positive Rate (1 - Specificity)", 
       y = "True Positive Rate (Sensitivity)",
       caption = "The shaded areas illustrate the uncertainty range for each model's performance on the ROC curve.\nThe lighter green area represents improved performance of Logistic Regression over Naive Bayes.") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 16), # Center and adjust the size of the title
        plot.subtitle = element_text(hjust = 0.5), # Center the subtitle
        legend.position = "right", # Move legend to right
        plot.caption = element_text(hjust = 0.5), # Center the caption
        legend.title = element_text(hjust = 0.5)) # Center the legend title

# Print the ROC plot with ribbons
print(roc_plot_with_ribbon)

# Retrieve metrics from the confusion matrix outputs
nb_accuracy <- confMat_nb$overall['Accuracy']
nb_confint <- confMat_nb$byClass['95% CI']
lr_accuracy <- confusion_matrix_lr$overall['Accuracy']
lr_confint <- confusion_matrix_lr$byClass['95% CI']

# Calculates NB CI bounds and width
nb_confint_lower <- confMat_nb$overall['AccuracyLower']
nb_confint_upper <- confMat_nb$overall['AccuracyUpper']
nb_ci_width <- nb_confint_upper - nb_confint_lower

# Calculating LR CI bounds and width
lr_confint_lower <- confusion_matrix_lr$overall['AccuracyLower']
lr_confint_upper <- confusion_matrix_lr$overall['AccuracyUpper']
lr_ci_width <- lr_confint_upper - lr_confint_lower

# For Naive Bayes
nb_sensitivity <- confMat_nb$byClass['Sensitivity']
nb_specificity <- confMat_nb$byClass['Specificity']
nb_balanced_accuracy <- (nb_sensitivity + nb_specificity) / 2

# For Logistic Regression
lr_sensitivity <- confusion_matrix_lr$byClass['Sensitivity']
lr_specificity <- confusion_matrix_lr$byClass['Specificity']
lr_balanced_accuracy <- (lr_sensitivity + lr_specificity) / 2

# Creates the DataFrame for ggplot
metrics_data <- data.frame(
  Metric = rep(c("Accuracy", "95% CI Range", "AUC", "Sensitivity", "Specificity", "Balanced Accuracy"), times = 2),
  Value = c(nb_accuracy, nb_ci_width, auc_nb, nb_sensitivity, nb_specificity, nb_balanced_accuracy,  # NB metrics
            lr_accuracy, lr_ci_width, auc_lr, lr_sensitivity, lr_specificity, lr_balanced_accuracy),  # LR metrics
  Model = rep(c("Naive Bayes", "Logistic Regression"), each = 6)
)

# Adjust the factor levels for the Metric column to control the order of bars
metrics_data$Metric <- factor(metrics_data$Metric, levels = c("Accuracy", "95% CI Range", "Balanced Accuracy", "Sensitivity", "Specificity", "AUC"))

# Create metrics bar graph using ggplot2
ggplot(metrics_data, aes(x = Metric, y = Value, fill = Model)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_hline(yintercept = 0.866, color = "red", linetype = "dashed", size = 1) +
  geom_text(aes(x = "Balanced Accuracy", y = 0.866, label = "Dataset % 'Ham'"), 
            color = "darkblue", vjust = -1, hjust = 1.6) +
  scale_y_continuous(limits = c(0, 1), 
                     breaks = seq(0, 1, 0.1)) +
  labs(title = "Comparison of Naive Bayes and Logistic Regression Metrics",
       subtitle = "Logistic Regression shows superiority over Naive Bayes, which barely exceeds the baseline 'Dataset % Ham'.",
       x = "",
       y = "Proportion",
       fill = "Model",
       caption = "The Logistic Regression model markedly outperforms the Naive Bayes approach across measured metrics. Notably, the Naive Bayes model's\nperformance hovers around the baseline 'Dataset % Ham' level, indicating little to no actual improvement over simply guessing the majority class.\nThis emphasizes the Logistic Regression model's superior predictive power and its effectiveness in classifying spam in the SMS dataset accurately.") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 16),  # Center and adjust the size of the title
        plot.subtitle = element_text(hjust = 0.5),  # Center the subtitle
        plot.caption = element_text(hjust = 0.5),  # Center the caption
        legend.title = element_text(hjust = 0.5))  # Center the legend title
