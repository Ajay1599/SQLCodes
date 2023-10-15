Create Database BRAND1
Create Database PRODUCT1

Use BRAND1
create table ITEM_Table(
Item_Id int Not Null,
Item_Description Varchar(50),
Vender_Nos int,
Vender_Name Varchar(100),
Bottle_Size int,
Bottle_Price Float,
);


Insert into ITEM_Table

VALUES 
--(1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750, 9.77); 
--(2,'D aristi Xtabentun',392,'Anchor Distilling(preiss imports)',750, 14.12);   
--(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,6.50);
--(4,'Oak Cross Whiske',305,'Mhw Ltd',750, 25.33);
--(5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,1.97);
--(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,6.37);
--(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750, 5.06); 
--(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750, 23.61);

Select * From  ITEM_Table

Use PRODUCT1
create table PRODUCT_Table(
Item_Id int Not Null,
Country Varchar(50),
Product Varchar(1000),
Unit_Sold int,
Manufacturing_Price Float,
Sale_Price Float,
Gross_Sale Float,
Sales Float,
COGS Float,
Profit Float,
Date date,
Month_No int,
Month_Name Varchar(50),
Year int);

Select * From  PRODUCT_Table

Insert into PRODUCT_Table

VALUES 
--(1,'Canada','Carretera',1618.50,3.00,20.00,32370.00,32370.00,16185.00,16185.00,'01-01-2024',1,'January',2014);
--(2,'Germany', 'Carretera',1321,3.00,20.00,26420.00,26420.00,13210.00,13210.00,'01-01-2014',1,'January',2015);
--(3,'France','Carretera',2178,3.00,15.00,32670.00,32670.00,21780.00,10890.00,'01-06-2014',6,'June',2016);
--(4,'Germany','Carretera',888,3.00,15.00,13320.00,13320.00,8880.00,4440.00,'01-06-2014',6,'June',2017);
--(5,'Mexico','Carretera',2470,3.00,15.00,37050.00,37050.00,24700.00,12350.00,'01-06-2014',6,'June',2018);
--(6,'Germany','Carretera',1513,3.00,350.00,529550.00,529550.00,393380.00,136170.00,'01-12-2014',12,'December',2019);
--(7,'Germany','Montana',921,5.00,15.00,13815.00,13815.00,9210.00,4605.00,'01-03-2014',3,'March',2020);
--(8,'Canada','Montana',2518,5.00,12.00,30216.00,30216.00,7554.00,22662.00,'01-06-2014',6,'June',2021);

Select * From  PRODUCT_Table

BEGIN TRAN
delete from PRODUCT_Table where Unit_Sold = 1618.50
delete from PRODUCT_Table where Unit_Sold = 888
delete from PRODUCT_Table where Unit_Sold = 2470

commit/rollback
;
drop table PRODUCT_Table

Create table PRODUCT_TABLE(
Item_Id int Not Null,
--BY Mistake i use Item_Id
Country Varchar(50),
Product Varchar(1000),
Unit_Sold int,
Manufacturing_Price Float,
Sale_Price Float,
Gross_Sale Float,
Sales Float,
COGS Float,
Profit Float,
Date date,
Month_No int,
Month_Name Varchar(50),
Year int);

Insert into PRODUCT_Table

VALUES 
--(1,'Canada','Carretera',1618.50,3.00,20.00,32370.00,32370.00,16185.00,16185.00,'01-01-2024',1,'January',2014);
--(2,'Germany', 'Carretera',1321,3.00,20.00,26420.00,26420.00,13210.00,13210.00,'01-01-2014',1,'January',2015);
--(3,'France','Carretera',2178,3.00,15.00,32670.00,32670.00,21780.00,10890.00,'01-06-2014',6,'June',2016);
--(4,'Germany','Carretera',888,3.00,15.00,13320.00,13320.00,8880.00,4440.00,'01-06-2014',6,'June',2017);
--(5,'Mexico','Carretera',2470,3.00,15.00,37050.00,37050.00,24700.00,12350.00,'01-06-2014',6,'June',2018);
--(6,'Germany','Carretera',1513,3.00,350.00,529550.00,529550.00,393380.00,136170.00,'01-12-2014',12,'December',2019);
--(7,'Germany','Montana',921,5.00,15.00,13815.00,13815.00,9210.00,4605.00,'01-03-2014',3,'March',2020);
--(8,'Canada','Montana',2518,5.00,12.00,30216.00,30216.00,7554.00,22662.00,'01-06-2014',6,'June',2021);

Select * From  PRODUCT_Table

-- Intermediate Questions 1 to 5
--Big Table Question 

Select Sum(Sale_Price)from PRODUCT_Table 
Select Sum(Gross_Sale)from PRODUCT_Table

Select MAX(Sales)from PRODUCT_TABLE

Select item_id,Product from PRODUCT_TABLE where Gross_Sale=37050.00

Select Country from PRODUCT_TABLE where Profit Between 4605 And 22662

select Item_Id  from PRODUCT_Table where COGS = 24700;  
--( As per Question @24700 amount not in sale column its showing COGS Column that's why i use this)

--Small Table Question 
Use BRAND1
Select * From ITEM_TABLE
Select item_description from ITEM_TABLE where bottle_size =750

Select vender_name from ITEM_TABLE where Vender_Nos = 305
Select vender_name from ITEM_TABLE where Vender_Nos = 380
Select vender_name from ITEM_TABLE where Vender_Nos = 391

Select Sum(Bottle_Price) from ITEM_TABLE;

alter table ITEM_TABLE
ADD Constraint PK_ID Primary Key (Item_id);

Select item_id from ITEM_Table where Bottle_Price =5.06

--Advance Question

Select * from BRAND1.dbo.ITEM_TABLE as IT
Inner Join PRODUCT1.dbo.PRODUCT_Table as PT           ---Inner Join
on IT.item_id = PT.item_id;

Select * From BRAND1.dbo.ITEM_TABLE as IT
Full Outer Join PRODUCT1.dbo.PRODUCT_TABLE as PT      ---Full Outer Join
On IT.item_id = PT.item_id;

Select * From BRAND1.dbo.ITEM_TABLE as IT
Left Outer Join PRODUCT1.dbo.PRODUCT_TABLE as PT	 ---Left Outer Join
On IT.item_id = PT.item_id;

Select * From BRAND1.dbo.ITEM_TABLE as IT
Right Outer Join  PRODUCT1.dbo.PRODUCT_TABLE as PT	 ---Right Outer Join
on IT.item_id = PT.item_id;

Select * From BRAND1.dbo.ITEM_TABLE 
Cross Join PRODUCT1.dbo.PRODUCT_TABLE				--- Cross Join
	
Select Item_Description, Product from BRAND1.dbo.ITEM_TABLE, PRODUCT1.dbo.PRODUCT_TABLE where gross_sale = 13320;

Select 
IT.bottle_Price,
PT.Profit,
(Select Sum(bottle_price) from BRAND1.dbo.ITEM_TABLE) AS Total_Bottle_Price,
(Select Sum(Profit) from PRODUCT1.dbo.PRODUCT_TABLE) AS Total_Profit
From BRAND1.dbo.ITEM_TABLE AS IT
Join PRODUCT1.dbo.PRODUCT_TABLE AS PT on IT.Item_Id = PT.item_id;

Select Substring(Item_Description,1, Charindex(' ', Item_Description) - 1) As Item_Desc1,
Substring(Item_Description, Charindex(' ',Item_Description) + 1, LEN(Item_Description)) AS Item_Desc2
From BRAND1.dbo.ITEM_TABLE;
