
Table Structures

CREATE TABLE Products (
    Product_ID INT  PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(10,2) DEFAULT 0.00,
    Expiry_Date DATE
);


CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Order_Quantity NUMBER NOT NULL,
    Order_Date DATE DEFAULT SYSDATE,
    
    CONSTRAINT fk_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),
    
    CONSTRAINT fk_product
        FOREIGN KEY (Product_ID)
        REFERENCES Products(Product_ID)
);

CREATE TABLE Customers (
  Customer_Name VARCHAR2(100) NOT NULL,
  Email VARCHAR2(100), 
  Phone(10), 
  Address VARCHAR2(200)
);
