--procedure that verifies if an order from a user can be completed

CREATE PROCEDURE CheckAndVerifyOrder
    @UserID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM [user] WHERE id = @UserID)
    BEGIN
        PRINT 'Customer does not exist.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM product WHERE id = @ProductID)
    BEGIN
        PRINT 'Product does not exist.';
        RETURN;
    END

	DECLARE @InventoryID INT;
    DECLARE @CurrentInventory INT;

    SELECT @InventoryID = inventory_id
    FROM product
    WHERE id = @ProductID;
    
    SELECT @CurrentInventory = quantity
    FROM product_inventory
    WHERE id = @InventoryID;

    IF @CurrentInventory < @Quantity
    BEGIN
        PRINT 'Insufficient stock.';
        RETURN;
    END

    PRINT 'Order can be placed.';

END;
