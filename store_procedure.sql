
USE `classicmodels`;

/*
 * IN
 * Store Procedure
 */
CREATE PROCEDURE getByID(
    IN ID INT(11)
)
BEGIN
SELECT * FROM customers WHERE customerNumber = ID;
END;



CALL getByID(175);


/*
 * OUT
 * Store Procedure
 */
CREATE PROCEDURE GetCustomersCountByCity(
    IN  in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END;


CALL GetCustomersCountByCity('Paris',@total);
SELECT @total;



/*
 * INOUT
 * Store Procedure
 */
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END;

SET @counter = 0;
CALL SetCounter(@counter,10);
CALL SetCounter(@counter,7);
CALL SetCounter(@counter,2);
SELECT @counter;

