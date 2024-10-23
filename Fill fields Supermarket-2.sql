-- Insert into Customer table
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Phone_Number, Email, Membership_ID, Loyalty_Points, Customer_Rating)
VALUES
    (1, 'Ahmed', 'Fathy', '01227888498', 'ahmed@aucegypt.edu', 1001, 100, 4.5),
    (2, 'Daniel', 'Nazmy', '0122105987', 'daniel@aucegypt.edu', 1002, 150, 4.8),
    (3, 'Celine', 'Emad', '01223995764', 'celine@aucegypt.edu', 1003, 0, 3.9);

-- Insert into Product table
INSERT INTO Product (Product_ID, Product_Name, Category_ID, Price, Supplier_ID, Expiry_Date)
VALUES
	(100, 'Kinder Bueno', 876 , 25.5, 501, '9-9-2024'),
    (101, 'nacho chips', 987, 19.99, 501, '10-10-2025'),
    (102, 'chicken', 654, 59.99, 502, NULL),
    (103,'salmon fillet',543, 150, 503, '2-8-2027');
    
-- Insert into Product Category table
INSERT INTO Category (Category_ID, Category_Name)
VALUES
	(876,'Chocolates'),
    (987,'snacks'),
    (654, 'poultry'),
    (543, 'seafood');
    
-- Insert into Store table
INSERT INTO Store (Store_ID, Store_Name, Store_Manager, Opening_Hours)
VALUES
    (201, 'Main Store', 'Mostafa Hakim', '9:00 AM - 6:00 PM'),
    (202, 'Downtown Store', 'Monia Bergo', '10:00 AM - 8:00 PM');

-- Insert into Store Location table
INSERT INTO StoreLoc (postal_code, Store_ID, street_name, city)
VALUES
	('12345', 201, '123 Main St', 'New Cairo'),
	('54321', 202, '456 Nozha St', 'October');

-- Insert into Product in Store table
INSERT INTO Product_Store (Store_ID, Product_ID, Product_availability)
VALUES
	(201, 100, 0),
    (202, 100, 2),
	(201, 101, 30),
    (201, 102, 150),
    (201, 103, 16),
    (202, 101, 50),
    (202, 102, 300),
    (202, 103, 33);


-- Insert into Transaction table
INSERT INTO Transactions (Transaction_ID, Customer_ID, Store_ID, Purchase_Date, Product_ID, Payment_Date, Payment_Amount, Payment_Method)
VALUES
	(4, 1, 202, '2023-03-12', 101, '2023-03-12', 102, 'Credit Card'),
    (5, 2, 202, '2022-07-12', 103, '022-07-12', 98,'Cash'),
    (1, 1, 201, '2024-05-12', 101, '2024-05-12', 19.99, 'Credit Card'),
    (2, 2, 202, '2024-05-11', 102, '2024-05-11', 39.95, 'Cash'),
    (3, 3, 201, '2024-05-10', 103, '2024-05-10', 59.99, 'Debit Card');

-- Insert into CustomerServiceRequest table
INSERT INTO CustomerServiceRequest (Request_ID, Customer_ID, Purchase_ID, Request_Date, Request_Type, Description, Status, Assigned_Staff)
VALUES
	(400, 3, 303, '2024-07-07', 'Refund', 'Not mentioned', 'In progress', 101),
    (401, 1, 301, '2024-05-12', 'Complaint', 'Issue with size', 'Open', 101),
    (402, 2, 302, '2024-05-11', 'Return', 'Wrong purchase', 'Closed', 102),
    (403, 3, 303, '2024-05-10', 'Inquiry', 'Product availability', 'Open', 103);

-- Insert into Staff table
INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Position, Contact_Information, Store_ID, Department, Aisle)
VALUES
    (101, 'Mark', 'Johnson', 'Sales Associate', 'mark@store.com', 201, 'Sales', 'Aisle 1'),
    (102, 'Sarah', 'Williams', 'Manager', 'sarah@store.com', 202, 'Management', NULL),
    (103, 'Emily', 'Davis', 'Sales Associate', 'emily@store.com', 201, 'Sales', 'Aisle 2');

-- Insert into Feedback table
INSERT INTO Feedback (Feedback_ID, Customer_ID, Feedback_Date, Feedback_Text, Rating)
VALUES
    (601, 1, '2024-05-12', 'Great service!', 5),
    (602, 2, '2024-05-11', 'Product quality is good', 4),
    (603, 3, '2024-05-10', 'Could improve staff knowledge', 3);

-- Insert into ProductReview table
INSERT INTO ProductReview (Review_ID, Product_ID, Customer_ID, Review_Date, Review_Text, Rating)
VALUES
    (701, 101, 1, '2024-05-12', 'Nice fabric', 4),
    (702, 102, 2, '2024-05-11', 'Comfortable fit', 5),
    (703, 103, 3, '2024-05-10', 'Good support', 4);

-- Insert into Message table
INSERT INTO Message (Message_ID, Sender_ID, Receiver_ID, Text, Timestamp)
VALUES
    (801, 101, 1, 'Hi Ahmed, this is Mark, how can I help you?', '2024-05-12 10:00:00'), 
    (802, 1, 101, 'Hi Mark, I want to return my order', '2024-05-12 10:05:00'),
    (803, 3, 103, 'Hello Emily, can you help me?', '2024-05-12 10:10:00');

-- Insert into Supplier table
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Supplier_email, Product_ID)
VALUES
    (501, 'carrefour', 'carrefour@supplystore.com', 101),
    (502, 'hyper one', 'hyper@supplystore.com', 102),
    (503, 'seoudi', 'seoudi@supplystore.com', 103);

--Insert into Discount table
INSERT INTO Discount (Coupon_Code, Product_ID, Discount_Percent) 
VALUES 
('CODE123', 1, 10.5),
('SALE50', 2, 15),
('DISCOUNT20', 3, 20.75);