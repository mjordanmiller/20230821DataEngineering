Use retail_db;

BULK INSERT dbo.categories FROM 'data\categories.csv' WITH (FORMAT='CSV', ROWTERMINATOR = '0x0a', FIRSTROW=2) ;
BULK INSERT dbo.customers FROM 'data\customers.csv' WITH (FORMAT='CSV', ROWTERMINATOR = '0x0a', FIRSTROW=2) ;
BULK INSERT dbo.departments FROM 'data\departments.csv' WITH (FORMAT='CSV', ROWTERMINATOR = '0x0a', FIRSTROW=2) ;
BULK INSERT dbo.order_items FROM 'data\order_items.csv' WITH (FORMAT='CSV', ROWTERMINATOR = '0x0a', FIRSTROW=2) ;
BULK INSERT dbo.orders FROM 'data\orders.csv' WITH (FORMAT='CSV', ROWTERMINATOR = '0x0a', FIRSTROW=2) ;
BULK INSERT dbo.products FROM 'data\products.csv' WITH (FORMAT='CSV', ROWTERMINATOR = '0x0a', FIRSTROW=2) ;