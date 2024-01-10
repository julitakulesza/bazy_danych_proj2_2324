--creating indexes on foreign keys

CREATE INDEX IX_FK_Order_ID
ON order_items (order_id);

CREATE INDEX IX_FK_Product_ID
ON order_items (product_id);

CREATE INDEX IX_FK_Inventory_ID
ON product (inventory_id);

CREATE INDEX IX_FK_Order_User
ON order_details ([user_id]);

CREATE INDEX IX_FK_User_Address
ON user_address ([user_id]);

--non-clustered indexes on a commonly search pair of columns 

CREATE NONCLUSTERED INDEX IX_ProductCategory
ON product (name, category_id);