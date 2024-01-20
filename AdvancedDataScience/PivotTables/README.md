## Table of Contents
[What](#what)<br/>
[Why](#why)<br/>
[How](#how)<br/>
[Data](#data)<br/>
<br/><br/>

## What
In this tutorial on PivotTables in Microsoft Excel, we will learn how this powerful tool can be used to summarize, analyze, explore, and present your data. PivotTables allow us to easily rearrange and manipulate large amounts of data in a dynamic way, offering insights and patterns that might not be immediately evident. We can group and sort data, as well as perform calculations like sums, averages, and counts, all with simple drag-and-drop functionality. PivotTables are ideal for large datasets, where we can create concise reports and visualizations, making our data more accessible and understandable.
<br/><br/>

## Why
PivotTables are an invaluable tool for dealing with large and complex datasets, such as business analysts, researchers, or financial professionals. They are particularly useful for summarizing and analyzing data, allowing us to spot trends, patterns, and anomalies quickly. Example uses could include creating comprehensive sales reports, performing customer segmentation, or analyzing financial data. PivotTables offer a flexible and efficient way to rearrange, group, and summarize data. They are also extremely helpful in preparing data for presentations or decision-making, as they can turn extensive datasets into concise tables and clear charts. In essence, Pivot Tables save time and enhance the clarity of data analysis.
<br/><br/>

## How
<br/><br/>

### Product Sales (Dataset 1)
<br/><br/>

## 1. Data Preparation:

- Ensure the dataset is in a table format with clear headers.
- Each column should have a unique name (i.e. Date, Product Category, Salesperson, etc.).

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_1.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">An example dataset formatted correctly in Excel.</h4>
</div>
<br/><br/>

## 2. Inserting a Pivot Table:

- Click anywhere inside your dataset.
- Navigate to the "Insert" tab on the Excel ribbon.
- Click on "PivotTable."

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_2.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">'PivotTable' option in ribbon.</h4>
</div>

- In the "Create PivotTable" dialog box, ensure your table range is correct and choose where you want the PivotTable to be placed (New Worksheet is often preferred for clarity). You can rename the Sheet where you PivotTable is populated for clarity. 

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_2.1.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Create PivotTable dialog box.</h4>
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_2.2.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">New sheet.</h4>
</div>
<br/><br/>

## 3. Setting Up PivotTable:

- In the PivotTable Fields pane, drag "Product Category" to the Rows area.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_3.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Product Category" to Rows.</h4>
</div>

- Drag "Total Sale" to the Values area. By default, Excel will sum the values.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_3.1.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Total Sale" to Values.</h4>
</div>

-  This setup will show the total sales per category.
<br/><br/>

## 4. Adding a Layer to Identify Top Salesperson:

- Drag "Salesperson" to the Rows area, placing it below "Product Category." This will breakdown the sales within each category by salesperson.
- Now, the PivotTable shows total sales per category and further breaks it down by each salesperson.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_4.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Updated Pivot Table with both categories and salesperson details.</h4>
</div>
<br/><br/>

## 5. Sorting to Identify Best-Selling Category and Top Salesperson:

- Click on any number in the "Sum of Total Sale" column that corresponds to a sales category.
- Go to the "Data" tab, select Sort & Filter, and choose the "Descending" feature. Ensure that the Summary description matches your intended results. Select OK.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_5.0.png" width="600" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Sort dialog box.</h4> 
</div>

- This sorts categories by total sales and salespeople by total sales within each category.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_5.1.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">After Sort.</h4>
</div>
<br/><br/>

## 6. Analyzing and Interpreting the Data:

- The top item in the PivotTable is now the best-selling category.
- Within each category, the top-listed salesperson is the one with the highest sales.
- These top results were manually highlighted for clarity.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_6.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Highlighted top of the list.</h4>
</div>

This PivotTable helps in quickly identifying which categories are most lucrative and which salespeople are performing best in each category. Such insights are essential for strategic decision-making in sales management, like incentivizing top performers, allocating resources, or tailoring marketing strategies based on successful categories.

PivotTables are dynamic. As the dataset updates/grows, we can refresh the PivotTable to reflect the latest data. This makes them incredibly powerful for ongoing analysis.
<br/><br/>

### Dataset 2 - Employee Attendance
<br/><br/>

## 1. Data Preparation:

— Ensure the dataset is in a table format with clear headers.
— Each column should have a unique name (i.e. Date, Product Category, Salesperson, etc.).

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_1.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">An example dataset formatted correctly in Excel.</h4>
</div>
<br/><br/>

## 2. Inserting a Pivot Table:

— Click anywhere inside your dataset.
— Navigate to the "Insert" tab on the Excel ribbon and click "PivotTable".

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_2.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"PivotTable" option in ribbon.</h4>
<br/><br/>
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_2.1.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"PivotTable" dialog box.</h4>
</div>

- In the "Create PivotTable" dialog box, ensure your table range is correct and choose where you want the Pivot Table to be placed (New Worksheet is often preferred for clarity). As with Dataset, you can rename the new Sheet for clarity.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_2.2.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Renamed sheet.</h4>
</div>
<br/><br/>

## 3. Setting Up Pivot Table:

- In the PivotTable Fields pane, drag "Department" to the Rows area.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_3.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Department" to Rows.</h4>
</div>

- Drag "Status" to the Columns area.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_3.1.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Status" to Columns.</h4>
</div>

- Drag 'Status' again to the Values area. The Field Setting should automatically set to "Count" (if not, adjust this setting accordingly).

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_3.2.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Status" to Values and change setting to "Count."</h4>
</div>

- This setup provides a count of different attendance statuses (Present, Absent, Late) for each department.
<br/><br/>

## 4. Setting Up Pivot Table to Analyze Hours Worked:

- Drag "Department" to the Rows area and "Employee Name" below it.
- Drag "Hours Worked" to the Values area. By default, it will sum the hours.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_4.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Showing hours worked.</h4>
</div>

- This setup shows the total hours worked by each employee and department.
<br/><br/>

## 5. Sorting to Identify Departments and Employees with Most Hours Worked:

- Click on any number in the "Total Sum of Hours Worked" column.
- Go to the "Data" tab, select "Sort Smallest to Largest" (a button with A, Z, and a downwards arrow).
<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_5.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Next we sort smallest to largest.</h4>
</div>
- This sorts the departments and employees based on the total hours worked.
<br/><br/>

## 6. Analyzing and Interpreting the Data:

- The top item in your PivotTable now represents the department with the least hours worked (in this case, Operations).
- Within each department, the top-listed employee is the one with the least hours.
<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_6.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Final PivotTable with sorted results, highlighting departments and employees with the most hours worked.</h4>
</div>

This analysis can help human resource managers understand attendance patterns and workload distribution across departments and employees. Such insights are crucial for managing workforce efficiency, identifying departments or employees that may be overburdened and ensuring equitable workload distribution.

As we mentioned above in our first example using Sales Data, we can refresh our PivotTables to reflect updated data, making them an effective tool for ongoing HR data analysis.
<br/><br/>

## Data
<br/>

### Here you can find the two pseudo-datasets used above in a single Excel spreadsheet (.xlsx), with the PivotTables generated according to the above instructions. :)
<br/>
<div class="centered-content" style="text-align:center;">
<h2 style="margin: 0;"><a href="" target="_blank" style="color:#B5E853">Product Sales & Employee Attendance Data</a></h2>
</div>
