CREATE TRIGGER update_inventory
    AFTER INSERT ON sales FOR EACH ROW
    BEGIN
        UPDATE inventory
        SET inventory.quantity = (inventory.quantity-NEW.quantity),
        inventory.last_inventory_date = NEW.sale_date
        WHERE NEW.product_id = inventory.product_id;
    END;
    SELECT * FROM sales;

INSERT INTO sales (sale_date, customer_id, product_id, employee_id, quantity, total_price)
VALUES
    (DATE('2023-05-01'), 1, 1, 1, 2, 56000.00),
    (DATE('2023-05-02'), 2, 2, 1, 1, 22000.00),
    (DATE('2023-05-02'), 1, 3, 2, 1, 41250.00),
    (DATE('2023-05-03'), 2, 4, 2, 2, 60000.00),
    (DATE('2023-05-03'), 1, 1, 2, 3, 84000.00);

SELECT * FROM inventory;
