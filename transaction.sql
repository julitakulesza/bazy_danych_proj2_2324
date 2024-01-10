--transaction in which update the inventory on the stored amount, given that we have a sufficient amount of the product

BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @ProductID INT = 2;  
    DECLARE @Quantity INT = 7;   

    DECLARE @InventoryID INT;
    DECLARE @CurrentInventory INT;

    SELECT @InventoryID = inventory_id
    FROM product
    WHERE id = @ProductID;
    
    SELECT @CurrentInventory = quantity
    FROM product_inventory
    WHERE id = @InventoryID;

    IF @CurrentInventory >= @Quantity
    BEGIN
        UPDATE product_inventory
        SET quantity = @CurrentInventory - @Quantity
        WHERE ID = @InventoryID;

        COMMIT;
    END  
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT ERROR_MESSAGE();
END CATCH;
