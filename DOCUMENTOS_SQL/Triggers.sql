-- Registrar acción cuando se agrega un gasto
DELIMITER //
CREATE TRIGGER after_insert_expense
AFTER INSERT ON expense
FOR EACH ROW
BEGIN
  INSERT INTO audit_log (user_id, action, timestamp)
  VALUES (NEW.user_id, 'Nuevo gasto registrado', NOW());
END;
//
DELIMITER ;
-- Cada vez que alguien agregue un gasto, se guarda un registro en audit_log con la acción y la hora.

--Prevenir gastos negativos

DELIMITER //
CREATE TRIGGER validation_expense
BEFORE INSERT ON expense
FOR EACH ROW
BEGIN
  IF NEW.amount <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El monto del gasto debe ser mayor a cero';
  END IF;
END;
//
DELIMITER ;
--Este trigger evita que se inserten gastos con valores negativos o cero.
