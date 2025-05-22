DELIMITER $$

CREATE FUNCTION calcular_total_gastos(id_usuario INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(amount)
    INTO total
    FROM expense
    WHERE user_id = id_usuario;

    RETURN IFNULL(total, 0);
END$$

DELIMITER ;

-- SELECT calcular_total_gastos(1);
--SELECT username, calcular_total_gastos(id_user) AS total_gastos FROM user;
