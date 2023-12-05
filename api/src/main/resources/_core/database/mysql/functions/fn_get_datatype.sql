DROP FUNCTION IF EXISTS fn_get_datatype;

DELIMITER //

CREATE FUNCTION fn_get_datatype(conceptDatatype VARCHAR(20)) RETURNS VARCHAR(20)
    DETERMINISTIC
BEGIN
    DECLARE mysqlDatatype VARCHAR(20);

    IF (conceptDatatype = 'Text'
       OR conceptDatatype = 'Coded'
       OR conceptDatatype = 'N/A' THEN
        SET mysqlDatatype = 'VARCHAR(255)';

    ELSEIF conceptDatatype = 'Boolean' THEN
        SET mysqlDatatype = 'TINYINT(1)';

    ELSEIF conceptDatatype = 'Date' THEN
        SET mysqlDatatype = 'DATE';

    ELSEIF conceptDatatype = 'Datetime' THEN
        SET mysqlDatatype = 'DATETIME';

    ELSEIF conceptDatatype = 'Numeric' THEN
        SET mysqlDatatype = 'DOUBLE';

    END IF;

    RETURN (mysqlDatatype);
END //

DELIMITER ;