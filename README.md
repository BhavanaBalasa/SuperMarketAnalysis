# SuperMarketAnalysis
### Project Overview:
    The Supermarket Sales Analysis project aims to analyze the sales performance of a supermarket chain to gain actionable insights into various aspects of its operations. This project focuses on understanding sales trends, customer behavior, and product performance, ultimately supporting business decisions to optimize revenue and customer satisfaction.
### Tools and Technologies:
  - Excel/CSV: For data storage and quick review.
  - SQL: Used MYSQl to query and analyze the dataset, perform aggregations, and extract insights.
 ### ER diagram:
  ![](https://github.com/BhavanaBalasa/SuperMarketAnalysis/blob/main/erd.png)    

## Dataset Overview:
    The SuperMarketSales dataset contains transactional sales data from a supermarket. 
    The dataset provides detailed information about each sale, including customer demographics, purchase details, 
    and sales metrics.It can be used for sales analysis, customer segmentation, and performance evaluation of different product lines.
## Columns Description:
### Invoice ID:	
     A unique identifier is assigned to each transaction or purchase. It helps track and reference individual sales.
### Branch:
     Represents the branch of the supermarket where the transaction took place.
### City:
    The city where the supermarket branch is located. It provides geographic information about the sales distribution.
### Customer Type:
     Classifies the customer as either a "Member" (who might have loyalty benefits) or a "Normal" customer (one-time or non-member customer).
### Gender:
	The gender of the customer involved in the transaction. This can help in analyzing purchasing behaviors by gender.
### Product Line:
	Describes the category or department of the product purchased. The supermarket typically offers multiple product lines such as Fashion, Electronics, Groceries, etc.
### Unit Price:
	The price of a single unit of the product sold, expressed in the local currency.
### Quantity:
    The number of units of the product purchased in the transaction.
### Tax 5%:
	The amount of tax applied to the transaction, calculated as 5% of the total sales amount. This tax is usually added on top of the product price.
### Sales:
	The total amount of the sale, including the product price and tax.
	Formula: Sales = Unit Price * Quantity + Tax
### Date:
	The date on which the transaction occurred. This helps in tracking sales over time and analyzing trends.
	Format: MM/DD/YYYY
	Example: 01/05/2023
### Time:
	The exact time of the transaction, useful for identifying peak hours of sales activity.
	Format: HH:MM (24-hour format)
	Example: 14:30 (indicates 2:30 PM)
### Payment:
	The method of payment used by the customer. This can help in analyzing payment preferences (e.g., Cash, Credit Card, etc.).
	Example: Credit card, Cash
### COGS (Cost of Goods Sold):
	The cost incurred by the supermarket to acquire or produce the goods sold. This helps in profit margin calculations.
	Formula: COGS = Sales - Tax - Gross Income
	Example: 90.00
### Gross Margin Percentage:
	The percentage representing the supermarket’s gross profit margin. It shows the profitability of the sales made.
	Formula: Gross Margin % = (Gross Income / Sales) * 100
	Example: 4.76%
### Gross Income:
	The gross profit from the sale, which is the difference between sales and the cost of goods sold (COGS). ### Why Choose This Project?
	Formula: Gross Income = Sales - COGS
### Rating:
	Customer satisfaction rating for the purchase, typically on a scale of 1 to 10. This column is useful for analyzing customer feedback and satisfaction.
 ### Data Cleaning and Preprocessing:
 #### In Excel:
 - ** 1.In the Excel File, the Date column is not in the correct format it is contained in two forms (mm-dd-yyyy (Date) &  mm/dd/yyyy(General)).
 - ** 2. Using Filter I filtered the Date in general converted it to text and created a new column using the Excel function =DATE(RIGHT(L5,4),LEFT(L5,1),MID(L5,3,2))) and copied the remaining Date values using 
        =L1, removed the previous Date column.
#### In SQL:
- Changed the column name of InvoiceID used the Sql querie
       - ALTER TABLE supermarketanalysis CHANGE `ï»¿Invoice ID` `InvoiceID` varchar(50);
- To change the data type of each column to appropiate type
   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN Branch varchar(50);

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN City varchar(50);

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN `Customer type`  varchar(50);

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN Gender varchar(50);

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN `Product line` varchar(50);

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN `Unit price` varchar(50);

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN Date date;

   - ALTER TABLE supermarketanalysis
     MODIFY COLUMN Time time;
 - Assigned primary key to a column InvoiceID
    - ALTER TABLE supermarketanalysis
       ADD PRIMARY KEY (InvoiceID);

### Why I Choose This Project?
- Hands_on Learning: Practical experience with  datasets and advanced business problem-solving.
- Interest in the Domain: I have a strong interest in writing the sql quereies and finding the logic involved.

### Findings/Insights:
 - 
