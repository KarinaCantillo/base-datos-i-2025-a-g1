-- Insertar un nuevo gasto
DELIMITER $$
CREATE PROCEDURE insert_expense (
    IN p_user_id INT,
    IN p_category_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_description VARCHAR(255),
    IN p_expense_date DATE
)
BEGIN
    INSERT INTO expense (user_id, category_id, amount, description, expense_date)
    VALUES (p_user_id, p_category_id, p_amount, p_description, p_expense_date);
END$$
DELIMITER ;

--Actualizar un gasto existente
DELIMITER $$
CREATE PROCEDURE update_expense (
    IN p_expense_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_description VARCHAR(255)
)
BEGIN
    UPDATE expense
    SET amount = p_amount,
        description = p_description
    WHERE id = p_expense_id;
END$$
DELIMITER ;

--Eliminar un gasto
DELIMITER $$
CREATE PROCEDURE delete_expense (
    IN p_expense_id INT
)
BEGIN
    DELETE FROM expense WHERE id = p_expense_id;
END$$
DELIMITER ;
 
--Consultar gastos por usuario
DELIMITER $$
CREATE PROCEDURE get_expenses_by_user (
    IN p_user_id INT
)
BEGIN
    SELECT * FROM expense
    WHERE user_id = p_user_id
    ORDER BY expense_date DESC;
END$$
DELIMITER ;

-- Insertar una nueva meta financiera
DELIMITER $$
CREATE PROCEDURE insert_goal (
    IN p_user_id INT,
    IN p_title VARCHAR(100),
    IN p_target_amount DECIMAL(10,2),
    IN p_due_date DATE
)
BEGIN
    INSERT INTO goal (user_id, title, target_amount, due_date)
    VALUES (p_user_id, p_title, p_target_amount, p_due_date);
END$$
DELIMITER ;

-- Consultar metas activas
DELIMITER $$
CREATE PROCEDURE get_active_goals (
    IN p_user_id INT
)
BEGIN
    SELECT * FROM goal
    WHERE user_id = p_user_id AND due_date >= CURDATE();
END$$
DELIMITER ;
 
 -- Actualizar datos de usuario
 DELIMITER $$
CREATE PROCEDURE update_user_email (
    IN p_user_id INT,
    IN p_new_email VARCHAR(100)
)
BEGIN
    UPDATE user
    SET email = p_new_email
    WHERE id = p_user_id;
END$$
DELIMITER ;

--Insertar una notificación
DELIMITER $$
CREATE PROCEDURE insert_notification (
    IN p_user_id INT,
    IN p_message VARCHAR(255)
)
BEGIN
    INSERT INTO notification (user_id, message, is_read, date_sent)
    VALUES (p_user_id, p_message, FALSE, NOW());
END$$
DELIMITER ;

-- Marcar notificación como leída
DELIMITER $$
CREATE PROCEDURE mark_notification_as_read (
    IN p_notification_id INT
)
BEGIN
    UPDATE notification
    SET is_read = TRUE
    WHERE id = p_notification_id;
END$$
DELIMITER ;

-- Obtener reporte financiero por usuario
DELIMITER $$
CREATE PROCEDURE get_reports_by_user (
    IN p_user_id INT
)
BEGIN
    SELECT * FROM report
    WHERE user_id = p_user_id
    ORDER BY period_end DESC;
END$$
DELIMITER ;
