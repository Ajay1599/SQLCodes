Create Database ORDER_STORE1_DATA

Create table Order_Tables(

Order_id int  Not Null,
Order_Date date,
Region varchar(50),
Rep_name varchar(100),
Order_Item Varchar(100),
Units int,
Units_Cost float,
Total_Price float,
);

Select * From Order_Tables

Create Table Store_Tables(
Store_id int Not Null,
Store_Type Varchar(50),
Assortment int,
Competition_Distance int,
Month_Number int,	
Year int,
Promo_Interval Varchar(100)
);

Insert into Order_Tables
Values
	(1,'1-6-21','East','Auna','Pencil',95,189,05);
	(2,'1-23-21','Central','Kivell','Eraser',50,19.99,999.50);
	(3,'2-9-21','Central','Ganesh','Null',36,4.99,179.64);
	(4,'2-26-21','Central','Payal','Null',27,19.99,539.73);
	(5,'3-15-21','West','Sorvino','Null',56,2.99,167.44);
	(6,'4-1-21','East','Hitesh','Pencil',60,4.99,299.40);	
	(7,'4-18-21','Central','Akshita','Null',75,1.99,149.25);
	(8,'5-5-21','Central','Ruchika','Books',90,4.99,449.10);
	(9,'5-22-21','West','Surbhi','Null',32,1.99,63.68);
	(10,'6-8-21','East','Jones','Suitcase',60,8.99,539.40);

Select * From Order_Tables


Insert into Store_Tables
Values
(1,'c',32,1270,9,2008,'Jan');
(2,'a',29,570,11,2007,'Feb');
(3,'a',19,14130,12,2006,'Mar');
(4,'c',11,620,9,2009,'Null');
(5,'a',44,29910,4,2015,'May');
(6,'a',44,310,12,2013,'June');
(7,'a',44,24000,4,2013,'Null');	
(8,'a',18,7520,10,2014,'Aug');
(9,'a',33,2030,8,2000,'Null');	
(10,'a',43,3160,9,2009,'Oct');

Select * From Store_Tables

Alter Table Order_Tables 
ADD CONSTRAINT PK_Orders PRIMARY KEY (Order_Id);

Alter Table Store_Tables
ADD Store_Name Varchar(30);



begin tran
UPDATE Store_Tables
SET Store_Name = CASE 
                    WHEN Store_ID = 1 THEN 'Car'					
                    WHEN Store_ID = 2 THEN 'Bikes'
                    WHEN Store_ID = 3 THEN 'Hardware'
                    WHEN Store_ID = 4 THEN 'Electrics'
                    WHEN Store_ID = 5 THEN 'Fibers'
                    WHEN Store_ID = 6 THEN 'Elastics'
                    WHEN Store_ID = 7 THEN 'Books'
                    WHEN Store_ID = 8 THEN 'Shoes'
                    WHEN Store_ID = 9 THEN 'Clothes'
                    WHEN Store_ID = 10 THEN 'Scraps'
                    ELSE Store_Name
                 END
Where Store_ID in (1,2,3,4,5,6,7,8,9,10);
commit/rollback;


Select * From Store_Tables

-----5 Question

ALTER TABLE Stores_Tables
ADD CONSTRAINT FK_Store FOREIGN KEY (Store_ID) References Order_Tables(Order_ID);

--- 6 Question

Alter Table Order_Tables
ADD Order_Item Varchar(30);

begin tran
Update Order_Tables
Set Order_item = CASE
				When Order_ID = 3 Then 'Compass'
				When Order_ID = 4 Then 'Torch'
				When Order_ID = 5 Then 'Phone'
				When Order_ID = 7 Then 'Laptop'
				When Order_ID = 9 Then 'Box'
				Else Order_item
			End
Where Order_ID in (3,4,5,7,9);
commit / rollback;

Select * From Order_Tables

begin tran
UPDATE Store_Tables
SET Promo_Interval = CASE 
                    WHEN Store_ID = 4 THEN 'Apr'
					WHEN Store_ID = 7 THEN 'Jul'
					WHEN Store_ID = 9 THEN 'Sep'
					Else Promo_Interval
				End
Where Store_ID in (4,7,9);
commit / rollback;

select * From Store_Tables

Exec sp_rename 'Store_Tables.Assortment', 'Store_Nos', 'Column';
select * from Store_Tables

Exec sp_rename 'Order_Tables.Order_Item', 'item_Name', 'Column';
select * from Order_tables

Exec sp_rename 'Order_Tables.REP_NAME', 'Customer_name ', 'Column';
select * from Order_tables

Select * from Orders_table order by Units_cost desc

Select * from Orders_table order by Total_price asc 

Exec sp_rename 'Order_Tables.Customers_Name', 'Cus_Name', 'Column';
Select * From Order_Tables

---- 12
select SUM(Total_Price) as Sum_of_Total, SUM(Units_Cost) as Sum_of_units_Cost
from Order_Tables;

---13

CREATE VIEW Order_Store_Table AS
SELECT O.Order_Date, O.[Units_cost], S.Store_Type, S.YEAR
FROM Order_Tables AS O
JOIN Store_Tables AS S ON O.Order_ID = S.Store_ID;

Select * From Order_Store_Table


select * from Order_Tables
select * from Store_Tables

--14

select Item_Name, Region 
from Order_Tables
where Order_ID in (4,5,6,9);

--15

select Year, Competition_Distance 
from Store_Tables
where Competition_Distance in (29910, 310, 3160);

--16

select item_name
from Order_Tables
where Total_price between 200 and 400;

--17

Exec sp_rename 'Store_Tables.Competition_Distance', 'CD', 'Column';
select Sum(CD) as Total_CD 
from Store_Tables;

--18

select COUNT(Store_Type) as Total_Store_Type_Count, COUNT(CD) as Total_CD_Count
from Store_Tables

---19

Select * 
from Order_Tables
cross join Store_Tables;


begin tran

drop table Store_Tables, Order_Tables	 
drop database ORDER_STORE1_DATA 

commit / rollback;

