CREATE DATABASE sklep_internetowy;

--create tables

CREATE TABLE discount (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  description text,
  discount_percentage DECIMAL(3,0) NOT NULL,
  active BIT NOT NULL
);

CREATE TABLE order_details (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  user_id bigint NOT NULL,
  total money NOT NULL,
  date datetimeoffset(7) NOT NULL
);

CREATE TABLE order_items (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  order_id bigint NOT NULL,
  product_id bigint NOT NULL,
  quantity int NOT NULL
);

CREATE TABLE product (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  name NVARCHAR(255),
  description NVARCHAR(MAX),
  category_id BIGINT NOT NULL,
  introduced_at datetimeoffset(7) NOT NULL,
  discontinued_at datetimeoffset(7),
  discount_id BIGINT NOT NULL,
  [price per unit] money NOT NULL,
  inventory_id BIGINT NOT NULL
);

CREATE TABLE product_category (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  description text
);

CREATE TABLE product_inventory (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  quantity int
);

CREATE TABLE [user] (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  created_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetimeoffset(7) 
);

CREATE TABLE user_address (
  id bigint IDENTITY(1,1) PRIMARY KEY NOT NULL,
  user_id bigint NOT NULL,
  address_street VARCHAR(50) NOT NULL,
  address_building VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  country VARCHAR(50) NOT NULL,
  telephone VARCHAR(20) NOT NULL,
);

-- add foreign keys

ALTER TABLE [user_address]
   ADD CONSTRAINT FK_User_Address FOREIGN KEY (user_id)
      REFERENCES [user] (id)
	    ON DELETE CASCADE
        ON UPDATE CASCADE
;

ALTER TABLE [order_details]
   ADD CONSTRAINT FK_User_Order FOREIGN KEY (user_id)
      REFERENCES [user] (id)
	    ON DELETE CASCADE
        ON UPDATE CASCADE
;

ALTER TABLE product
   ADD CONSTRAINT FK_Product_Inventory FOREIGN KEY (inventory_id)
      REFERENCES product_inventory (id)
	    ON DELETE CASCADE
        ON UPDATE CASCADE
;

ALTER TABLE [order_items]
   ADD CONSTRAINT FK_Items_Order FOREIGN KEY (order_id)
      REFERENCES [order_details] (id)
	    ON DELETE CASCADE
        ON UPDATE CASCADE
;

ALTER TABLE [order_items]
   ADD CONSTRAINT FK_Products_Order FOREIGN KEY (product_id)
      REFERENCES product (id)
	    ON DELETE CASCADE
        ON UPDATE CASCADE
;
