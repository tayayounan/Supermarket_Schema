--Check which Store has Bueno--
SELECT Store.Store_ID, Store.Store_Name, Product_Store.Product_availability
FROM Store
JOIN Product_Store ON Store.Store_ID = Product_Store.Store_ID
WHERE Product_Store.Product_ID = 100
AND Product_Store.Product_availability > 0;

--Total sales by Store
SELECT Store.Store_ID, Store.Store_Name, SUM(Transactions.Payment_Amount) AS Total_Sales
FROM Store
LEFT JOIN Transactions ON Store.Store_ID = Transactions.Store_ID
GROUP BY Store.Store_ID, Store.Store_Name;

--Top 3 Customers with Highest Loyalty Points
SELECT Customer_ID, First_Name, Last_Name, Loyalty_Points
FROM Customer
ORDER BY Loyalty_Points DESC
LIMIT 3;

--Average Rating of Products by Category
SELECT c.Category_name, AVG(pr.Rating) AS Average_Rating
FROM Product p
JOIN ProductReview pr ON p.Product_ID = pr.Product_ID
JOIN Category c ON p.Category_ID = c.Category_ID
GROUP BY c.Category_name;

--Supplier Details along with Product Count
SELECT Supplier.Supplier_ID, Supplier.Supplier_Name, Supplier.Supplier_email, COUNT(Product.Product_ID) AS Product_Count
FROM Supplier
JOIN Product ON Supplier.Supplier_ID = Product.Supplier_ID
GROUP BY Supplier.Supplier_ID, Supplier.Supplier_Name, Supplier.Supplier_email;

--Staff Members by Department
SELECT Department, COUNT(*) AS Staff_Count
FROM Staff
GROUP BY Department;

--Count of Customer Service Requests by Status
SELECT Status, COUNT(*) AS Request_Count
FROM CustomerServiceRequest
GROUP BY Status;

--Product availability in store
SELECT p.Product_name , a.Product_availability 
FROM Product_store a
JOIN Product p ON p.Product_ID = a.Product_ID
WHERE a.Store_ID=202

--Average Purchase Amount by Customer Rating 
SELECT c.Customer_Rating, AVG(t.Payment_Amount) AS Average_Purchase_Amount
FROM Customer c
JOIN Transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Rating;

--Top Selling Products
SELECT p.Product_Name, COUNT(t.Transaction_ID) AS Total_Sales
FROM Product p
LEFT JOIN Transactions t ON p.Product_ID = t.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

--Monthly Sales Trend
SELECT strftime('%Y', Purchase_Date) AS Year, 
       strftime('%m', Purchase_Date) AS Month, 
       SUM(Payment_Amount) AS Total_Sale
FROM Transactions
GROUP BY Year, Month
ORDER BY Year, Month;

--Top Spending Customers
SELECT c.Customer_ID, c.First_Name, c.Last_Name, SUM(t.Payment_Amount) AS Total_Spending
FROM Customer c
JOIN Transactions t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_ID, c.First_Name, c.Last_Name
ORDER BY Total_Spending DESC
LIMIT 5;

--Average Payment Amount by Payment Method:
SELECT Payment_Method, AVG(Payment_Amount) AS Average_Payment_Amount
FROM Transactions
GROUP BY Payment_Method;

--Customers who have only made one purchase
SELECT Customer_ID, First_Name, Last_Name
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Transactions
    GROUP BY Customer_ID
    HAVING COUNT(*) = 1
);


