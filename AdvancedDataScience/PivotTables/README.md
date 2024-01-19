<div class="centered-content" style="text-align:center;">
  
  <h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Pivot Tables are integral in the world of data analysis and visualization.</h4>

</div>

<br/><br/>

## Table of Contents
[What](#what)<br/>
[Why](#why)<br/>
[How](#how)<br/>
[Data](#data)<br/>
<br/><br/>

## What
In this tutorial on Pivot Tables in Microsoft Excel, we will learn how this powerful tool can be used to summarize, analyze, explore, and present your data. Pivot Tables allow us to easily rearrange and manipulate large amounts of data in a dynamic way, offering insights and patterns that might not be immediately evident. We can group and sort data, as well as perform calculations like sums, averages, and counts, all with simple drag-and-drop functionality. Pivot Tables are ideal for large datasets, where we can create concise reports and visualizations, making our data more accessible and understandable.

## Why
Pivot Tables are an invaluable tool for dealing with large and complex datasets, such as business analysts, researchers, or financial professionals. They are particularly useful for summarizing and analyzing data, allowing us to spot trends, patterns, and anomalies quickly. Example uses could include creating comprehensive sales reports, performing customer segmentation, or analyzing financial data. Pivot Tables offer a flexible and efficient way to rearrange, group, and summarize data. They are also extremely helpful in preparing data for presentations or decision-making, as they can turn extensive datasets into concise tables and clear charts. In essence, Pivot Tables save time and enhance the clarity of data analysis.

## How

### Dataset 1 - Sales Data

#### 1. Data Preparation:

— Ensure the dataset is in a table format with clear headers.
— Each column should have a unique name (i.e. Date, Product Category, Salesperson, etc.).

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">An example dataset formatted correctly in Excel.</h4>

#### 2. Inserting a Pivot Table:

— Click anywhere inside your dataset.
— Navigate to the "Insert" tab on the Excel ribbon.
- Click on "PivotTable."

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">'PivotTable' option in ribbon.</h4>

- In the "Create PivotTable" dialog box, ensure your table range is correct and choose where you want the Pivot Table to be placed (New Worksheet is often preferred for clarity).

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Create PivotTable dialog box.</h4>

#### 3. Setting Up Pivot Table:

- In the PivotTable Fields pane, drag "Product Category" to the Rows area.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Product Category" to Rows.</h4>

- Drag "Total Sale" to the Values area. By default, Excel will sum the values.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Total Sale" to Values.</h4>

-  This setup will show the total sales per category.

#### 4. Adding a Layer to Identify Top Salesperson:

- Drag "Salesperson" to the Rows area, placing it below "Product Category." This will breakdown the sales within each category by salesperson.
- Now, the Pivot Table shows total sales per category and further breaks it down by each salesperson.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Updated Pivot Table with both categories and salesperson details.</h4>

#### 5. Sorting to Identify Best-Selling Category and Top Salesperson:

- Click on any number in the "Sum of Total Sale" column.
- Go to the "Data" tab, and use the "Sort Largest to Smallest" feature.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Before Sort.</h4> 

- This sorts categories by total sales and salespeople by total sales within each category.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">After Sort.</h4>

#### 6. Analyzing and Interpreting the Data:

- The top item in the Pivot Table is now the best-selling category.
- Within each category, the top-listed salesperson is the one with the highest sales.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Highlighted top of the list.</h4>

This Pivot Table helps in quickly identifying which categories are most lucrative and which salespeople are performing best in each category. Such insights are essential for strategic decision-making in sales management, like incentivizing top performers, allocating resources, or tailoring marketing strategies based on successful categories.

Pivot Tables are dynamic. As the dataset updates/grows, we can refresh the Pivot Table to reflect the latest data. This makes them incredibly powerful for ongoing analysis.

### Dataset 2 - Employee Attendance

#### 1. Data Preparation:

— Ensure the dataset is in a table format with clear headers.
— Each column should have a unique name (i.e. Date, Product Category, Salesperson, etc.).

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">An example dataset formatted correctly in Excel.</h4>

#### 2. Inserting a Pivot Table:

— Click anywhere inside your dataset.
— Navigate to the "Insert" tab on the Excel ribbon.
- Click on "PivotTable."

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"PivotTable" option in ribbon.</h4>

- In the "Create PivotTable" dialog box, ensure your table range is correct and choose where you want the Pivot Table to be placed (New Worksheet is often preferred for clarity).

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Create PivotTable dialog box.</h4>

#### 3. Setting Up Pivot Table:

- In the PivotTable Fields pane, drag "Department" to the Rows area.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Department" to Rows.</h4>

- Drag "Status" to the Columns area.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Status" to Columns.</h4>

- Drag 'Status' again to the Values area. Change the Value Field Setting to 'Count'.

<img src="https://myerberg.github.io/assets/images/" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Status" to Values and change setting to "Count."</h4>

-  This setup provides a count of different attendance statuses (Present, Absent, Late) for each department.

## Data
