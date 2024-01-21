## Table of Contents
[What](#what)<br/>
[Why](#why)<br/>
[How](#how)<br/>
[&nbsp;&nbsp;Product Sales (Dataset 1)](#product-sales-dataset-1)<br/>
[&nbsp;&nbsp;Employee Attendance (Dataset 2)](#employee-attendance-dataset-2)<br/>
[Data](#data)<br/>
<br/><br/>

## What
In this tutorial on PivotTables in Microsoft Excel, we will learn how this powerful tool can be used to summarize, analyze, explore, and present your data. PivotTables allow us to easily rearrange and manipulate large amounts of data in a dynamic way, offering insights and patterns that might not be immediately evident. We can group and sort data, as well as perform calculations like sums, averages, and counts, all with simple drag-and-drop functionality. PivotTables are ideal for large datasets, where we can create concise reports and visualizations, making our data more accessible and understandable. We can also refresh our PivotTables as our datasets change, allowing for seamless updates of these reports and visualizations.
<br/><br/>

## Why
PivotTables are an invaluable tool for dealing with large and complex datasets, such as business analysts, researchers, or financial professionals. They are particularly useful for summarizing and analyzing data, allowing us to spot trends, patterns, and anomalies quickly. Example uses could include creating comprehensive sales reports, performing customer segmentation, or analyzing financial data. PivotTables offer a flexible and efficient way to rearrange, group, and summarize data. They are also extremely helpful in preparing data for presentations or decision-making, as they can turn extensive datasets into concise tables and clear charts. In essence, PivotTables save time and enhance the clarity of data analysis.
<br/><br/>

## How
<br/>

## Product Sales (Dataset 1)
<br/>

## Step 1: Data Preparation

- Ensure the dataset is in a table format with clear headers.
- Each column should have a unique name (i.e. Date, Product Category, Salesperson, etc.).

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_1.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">An example dataset formatted correctly in Excel.</h4>
</div>
<br/><br/>

## Step 2: Inserting a PivotTable

- Click anywhere inside your dataset.
- Navigate to the "Insert" tab on the Excel ribbon.
- Click on "PivotTable".

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_2.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"PivotTable" option in ribbon.</h4>
</div>

- In the "Create PivotTable" dialog box, ensure your table range is correct and choose where you want the PivotTable to be placed (New Worksheet is often preferred for clarity). You can rename the Sheet where you PivotTable is populated. 

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_2.1.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Create PivotTable dialog box.</h4>
<br/>
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_2.2.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">New sheet.</h4>
</div>
<br/><br/>

## Step 3: Setting Up PivotTable

- In the PivotTable Fields pane, drag "Product Category" to the Rows field.
- Notice the four different "PivotTable Fields" on the right.
 
<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_3.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Product Category" to Rows.</h4>
</div>

- The Rows field populates the rows in your PivotTable, the Columns field populates the columns in your PivotTable, and the Values field populates the intersection of the rows and columns in the interior of your PivotTable.
- The Filters field can be used to narrow down the scope of the data included in your PivotTable by a particular attribute from your original dataset (i.e. only include a certain region).

<br/>

- Drag "Total Sale" to the Values area. By default, Excel will sum the values.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_3.1.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Total Sale" to Values.</h4>
</div>

-  This setup will show the total sales per category.
<br/><br/>

## Step 4: Adding a Layer to Identify Top Salesperson

- Drag "Salesperson" to the Rows area, placing it below "Product Category". This will breakdown the sales within each category by salesperson.
- Now, the PivotTable shows total sales per category and further breaks it down by each salesperson.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_1_Step_4.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Updated PivotTable with both categories and salesperson details.</h4>
</div>
<br/><br/>

## Step 5: Sorting to Identify Best-Selling Category and Top Salesperson

- Click on any number in the "Sum of Total Sale" column that corresponds to a "Product Category".
- Go to the "Data" tab, select Sort & Filter, and choose the "Descending" feature. Ensure that the Summary description matches your intended results. It should read "Sort Product Category by Sum of Total Sale in descending order". Select OK.

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

## Step 6: Analyzing and Interpreting the Data

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
<br/><br/>

## Employee Attendance (Dataset 2)
<br/>

## Step 1: Data Preparation

- Ensure the dataset is in a table format with clear headers.
- Each column should have a unique name (i.e. Date, Product Category, Salesperson, etc.).

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_1.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">An example dataset formatted correctly in Excel.</h4>
</div>
<br/><br/>

## Step 2: Inserting a PivotTable

- Click anywhere inside your dataset.
- Navigate to the "Insert" tab on the Excel ribbon and click "PivotTable".

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_2.0.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"PivotTable" option in ribbon.</h4>
<br/><br/>
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_2.1.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"PivotTable" dialog box.</h4>
</div>

- In the "Create PivotTable" dialog box, ensure your table range is correct and choose where you want the Pivot Table to be placed (New Worksheet is often preferred for clarity). As with Dataset 1, you can rename the new Sheet.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_2.2.png" width="500" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Renamed sheet.</h4>
</div>
<br/><br/>

## Step 3: Setting Up PivotTable

- In the "PivotTable Fields" pane, drag "Department" to the Rows area.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_3.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Department" to Rows.</h4>
</div>

- Drag "Status" to the Columns area.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_3.1.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Status" to Columns.</h4>
</div>

- Now drag "Status" to the Values area. The Field Setting should automatically set to "Count" (if not, adjust this setting accordingly).

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_3.2.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">"Status" to Values and change setting to "Count."</h4>
</div>

- This setup provides a count of different attendance statuses (Present, Absent, Late) for each department.
<br/><br/>

## Step 4: Setting Up PivotTable to Analyze Hours Worked

- Drag "Employee Name" below "Department" in Rows area.
- Drag "Hours Worked" to the Values area. By default, it will sum the hours.

<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_4.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Showing hours worked.</h4>
</div>

- This setup shows the total hours worked by each employee and department.
<br/><br/>

## Step 5: Sorting to Identify Departments and Employees with Most Hours Worked

- Click on any number in the "Total Sum of Hours Worked" column that corresponds to a "department" row.
- Go to the “Data” tab, select Sort & Filter, and choose the “Ascending” feature.
- Ensure that the Summary description matches your intended results. It should read "Sort Department by Sum of Hours Worked in ascending order using values in this column: Total Sum of Hours Worked". Select OK.
<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_5.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">We sort departments and the associated employees smallest to largest.</h4>
</div>
<br/>
- This sorts the departments based upon the total hours worked. It will also sort each department in ascending order by employee.
<br/><br/>

## Step 6: Analyzing and Interpreting the Data

- The top item in your PivotTable now represents the department with the least hours worked (in this case, Operations).
- Within each department, the top-listed employee is the one with the least hours.
<div class="centered-content" style="text-align:center;">
<img src="https://myerberg.github.io/AdvancedDataScience/PivotTables/assets/images/DataSet_2_Step_6.0.png" width="800" />
<h4 style="color:#B5E853; text-transform:uppercase; margin: 0.5em 0 0;">Final PivotTable with sorted results, revealing departments and employees with the least hours worked.</h4>
</div>

This analysis can help human resource managers understand attendance patterns and workload distribution across departments and employees. Such insights are crucial for managing workforce efficiency, identifying departments or employees that may be overburdened and ensuring equitable workload distribution.

As we mentioned above in our first example using Sales Data, we can refresh our PivotTables to reflect updated data, making them an effective tool for ongoing HR data analysis.
<br/><br/>

## Data

#### Here you can find the two pseudo-datasets used above in a single Excel spreadsheet (.xlsx), with the PivotTables generated according to the above instructions. Additionally, a third pseudo-dataset is included to try out your skills on something new.
<br/>
<div class="centered-content" style="text-align:center;">
<h2 style="margin: 0;"><a href="https://myerberg.github.io/AdvancedDataScience/PivotTables/PivotTables_Tutorial.xlsx" target="_blank" style="color:#B5E853">Product Sales, Employee Attendance, & Inventory Management Data</a></h2>
</div>
