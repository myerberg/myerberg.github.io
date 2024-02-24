<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/USChronicDiseaseIndicators/assets/images/Intro.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Can we discover insight among various chronic disease indicators in the U.S. from 2001 to 2021?</h4>
</div>
<br/><br/>

## Table of Contents
[Introduction](#introduction)<br/>
[Data Summary](#data-summary)<br/>
[Visualizations](#visualizations)<br/>
[Conclusion](#conclusion)<br/>
[Sources](#sources)<br/>
<br/><br/>

## Introduction
The intentions of my analysis are rooted in better understanding confounding factors within public health by examining a publicly available U.S. government dataset on chronic disease indicators from 2001 to 2021. As my parents age and deal with their own personal health problems, I find myself more interested than ever to see what lifestyle adjustments they could potentially make in order to achieve the best possible health outcomes. In this way, this analysis includes a rather personal component, giving me added curiosity and incentive to discover insight.

Among these 124 chronic indicators are a variety of interesting "questions"; in my examination of these indicators, I aimed to draw upon my pre-existing health knowledge to see if I could find interesting associations between different indicators. My goal in this data exploration is to uncover statistical validation for some of my correlation hypotheses. In the below Visualizations section, we will examine R^2 values to determine how well one variable predicts another. As you will see, I am able to demonstrate some relevant correlations through my statistical analysis. Nevertheless, given the multitudinous variables involved in health outcomes, it is very difficult to demonstrate direct correlations between two distinct health indicators.
<br/><br/>

## Data Summary
The Division of Population Health within the Centers for Disease Control and Prevention (CDC) provides this publicly available dataset of U.S. Chronic Disease Indicators, with data ranging from 2001 to 2021. Within this "cross-cutting set" are 124 disease indicators, which allow for uniformity across different states, territories, and metropolitan areas in terms of specific definitions and collection/reporting processes. The CDC falls under the U.S. Department of Health & Human Services.

This dataset contains over 1,000,000?????? entries, making it beyond the capabilities of using Excel to analyze it given its grid limitations. Therefore, using R was the logical approach. In terms of wrangling/cleaning the data, I was fortunate that the dataset well-maintained. Given this, the only step associated with data wrangling that was necessary was using functions within R to ignore cells with NA (empty) values.

A visual examination of the dataset does show some columns lacking consistency in the thoroughness of their content; however, these were irrelevant for the purposes of my analysis given that I focused on mainly three columns of data: the Question column (represeting one of the 124 disease indicators), the DataValue column (representing the corresponding data value for its associated Question, and the State column.

## Visualizations


<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/USChronicDiseaseIndicators/assets/images/Visualization1.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Obesity...</h4>
</div>
<br/><br/>



<br/><br/>
<br/><br/>


## Conclusion
As we have seen, it is clear that various indicators show interesting positive correlations. Nevertheless, we cannot make direct conclusions about health outcomes using only two indicators, even after exploring polynomial fits. In healthcare, it is best to take a holistic approach to improve outcomes, given that the affect of one indicator on overall health is compounded across the wide-range of linked biological pathways.

My conclusion for this data exploration is that certain lifestyle choices and government policies can effect individual health outcomes, but it can be difficult to make any sort of definite conclusion about what one indicator will reveal in terms of population-wide health. For example, higher alcohol consumption may be linked to higher incidence of liver disease, but this is certainly not a guarantee.

My hope for this project is that anyone who examines its statistical analyses keeps in mind their unique context, as well as remembering that this dataset, despite being vast, certainly is limited by the fact that it does not consistently capture every state/territory/metropolitan area for every unique indicator. Ultimately, my main takeaway from this project is the wisdom that we can impact our health with our own choices, and I hope to be able to use this sharpened understanding in my own life, for both myself and for the people I care most about.
<br/><br/>

## Sources

Here you can download this vast dataset in a variety of formats. As mentioned above, the CSV version was used in this analysis.
<br/>
<div class="centered-content" style="text-align:center;">
<h2 style="margin: 0;"><a href="https://catalog.data.gov/dataset/u-s-chronic-disease-indicators-cdi" target="_blank" style="color:#B5E853">U.S. Chronic Disease Indicators (CDI) </a></h2>
</div>
<div class="centered-content" style="text-align:center;">
<h2 style="margin: 0;"><a href="https://www.cdc.gov/mmwr/pdf/rr/rr6401.pdf" target="_blank" style="color:#B5E853">CDC's Detailed Methodology for the Dataset</a></h2>
</div>
