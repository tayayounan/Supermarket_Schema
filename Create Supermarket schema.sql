-- Create Customer table
CREATE TABLE Customer (
    Customer_ID INT NOT NULL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Membership_ID INT,
    Loyalty_Points INT,
    Customer_Rating DECIMAL(3,1)
);
-- Create Product table
CREATE TABLE Product (
    Product_ID INT NOT NULL PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category_ID VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    Supplier_ID INT NOT NULL,
    Expiry_Date DATE,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
  	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

-- Create Product Category table
CREATE TABLE Category (
 	Category_ID INT NOT NULL PRIMARY KEY,
  	Category_name VARCHAR(50)
);
  
-- Create Store table
CREATE TABLE Store (
    Store_ID INT NOT NULL PRIMARY KEY,
    Store_Name VARCHAR(100) NOT NULL,
    Store_Manager VARCHAR(100),
    Opening_Hours VARCHAR(100)
);

-- Create Store location table
CREATE TABLE StoreLoc (
    Postal_Code VARCHAR(20) PRIMARY KEY,
    Store_ID INT NOT NULL,
    Street_Name VARCHAR(100),
    City VARCHAR(50),
    FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID)
);

-- Create Products in Store table
CREATE TABLE Product_Store (
      Store_ID INT NOT NULL,
      Product_ID INT NOT NULL,
      Product_availability INT, 
      FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
      FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);


-- Create Transaction table
CREATE TABLE Transactions (
    Transaction_ID INT NOT NULL PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Store_ID INT NOT NULL,
    Purchase_Date DATE NOT NULL,
    Product_ID INT,
    Payment_Date DATE NOT NULL,
    Payment_Amount DECIMAL(10,2) NOT NULL,
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);


-- Create CustomerServiceRequest table
CREATE TABLE CustomerServiceRequest (
    Request_ID INT NOT NULL PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Purchase_ID INT NOT NULL,
    Request_Date DATE,
    Request_Type VARCHAR(50) NOT NULL,
    Description TEXT,
    Status VARCHAR(15) NOT NULL,
    Assigned_Staff INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Purchase_ID) REFERENCES Purchase(Purchase_ID),
    FOREIGN KEY (Assigned_Staff) REFERENCES Staff(Staff_ID)
);

-- Create Staff table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Contact_Information VARCHAR(100),
    Store_ID INT NOT NULL,
    Department VARCHAR(50),
    Aisle VARCHAR(50),
    FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID)
);

-- Create Feedback table
CREATE TABLE Feedback (
    Feedback_ID INT NOT NULL PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Feedback_Date DATE NOT NULL,
    Feedback_Text TEXT,
    Rating INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create ProductReview table
CREATE TABLE ProductReview (
    Review_ID INT PRIMARY KEY,
    Product_ID INT,
    Customer_ID INT,
    Review_Date DATE NOT NULL,
    Review_Text TEXT,
    Rating INT,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create Message table
CREATE TABLE Message (
    Message_ID INT NOT NULL PRIMARY KEY,
    Sender_ID INT NOT NULL,
    Receiver_ID INT NOT NULL,
    Text TEXT,
    Timestamp DATETIME,
    FOREIGN KEY (Sender_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Receiver_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Sender_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Receiver_ID) REFERENCES Staff(Staff_ID)
);

-- Create Supplier table
CREATE TABLE Supplier (
    Supplier_ID INT NOT NULL PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Supplier_email VARCHAR(100),
    Product_ID INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

--Create Discount table
CREATE TABLE Discount (
  Coupon_Code INT NOT NULL PRIMARY KEY,
  Product_ID INT NOT NULL,
  Discount_Percent DECIMAL(5,2), 
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);