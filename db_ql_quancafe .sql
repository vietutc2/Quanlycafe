-- Create the database
CREATE DATABASE db_ql_quancafe;
GO

USE db_ql_quancafe;
GO

-- Table structure for table `account`
CREATE TABLE account (
  ID int NOT NULL,
  username varchar(200) NOT NULL,
  password varchar(250) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);

-- Insert data into table `account`
INSERT INTO account (ID, username, password, name) VALUES
(1, 'admin', 'admin', 'Admin'),
(2, 'huy123', '123456', 'Huy'),
(3, 'son123', '123456', 'Son');

-- Table structure for table `drinks`
CREATE TABLE drinks (
  ID int NOT NULL,
  name varchar(200) NOT NULL,
  price int NOT NULL,
  start_date date DEFAULT NULL,
  end_date date DEFAULT NULL,
  PRIMARY KEY (ID)
);

-- Insert data into table `drinks`
INSERT INTO drinks (ID, name, price, start_date, end_date) VALUES
(4, 'Cà phê', 40000, '2023-01-01', '2023-12-12'),
(5, 'Bạc xỉu', 30000, '2023-01-01', '2023-12-12'),
(6, 'Cà phê đen', 20000, '2023-01-01', '2023-06-06'),
(7, 'Cà phê đá', 40000, '2023-12-12', '2023-01-31');

-- Table structure for table `invoice`
CREATE TABLE invoice (
  ID int NOT NULL,
  account_ID int NOT NULL,
  invoice_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tables_id int NOT NULL,
  status int NOT NULL,
  total_price int NOT NULL DEFAULT 0,
  PRIMARY KEY (ID),
  CONSTRAINT FK_invoice_account FOREIGN KEY (account_ID) REFERENCES account (ID),
  CONSTRAINT FK_invoice_tables FOREIGN KEY (tables_id) REFERENCES tables (ID)
);

-- Insert data into table `invoice`
INSERT INTO invoice (ID, account_ID, invoice_date, tables_id, status, total_price) VALUES
(8, 1, '2023-01-05 00:04:50', 1, 1, 260000),
(9, 1, '2023-01-05 00:04:47', 2, 1, 200000),
(10, 1, '2023-01-05 00:04:43', 5, 1, 170000),
(11, 1, '2023-01-05 00:07:15', 2, 1, 300000);

-- Table structure for table `orders`
CREATE TABLE orders (
  ID int NOT NULL,
  drinks_ID int NOT NULL,
  count int NOT NULL,
  invoice_ID int NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT FK_orders_drinks FOREIGN KEY (drinks_ID) REFERENCES drinks (ID),
  CONSTRAINT FK_orders_invoice FOREIGN KEY (invoice_ID) REFERENCES invoice (ID)
);

-- Insert data into table `orders`
INSERT INTO orders (ID, drinks_ID, count, invoice_ID) VALUES
(13, 4, 1, 8),
(14, 6, 1, 8),
(15, 5, 1, 9),
(16, 4, 2, 10);
