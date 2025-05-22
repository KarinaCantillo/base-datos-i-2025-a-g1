-- 1. Insertar una nueva categoría
DELIMITER $$
CREATE PROCEDURE insertar_categoria(IN nombre VARCHAR(50), IN descripcion TEXT)
BEGIN
    INSERT INTO category (name, description)
    VALUES (nombre, descripcion);
END $$
DELIMITER ;

-- 2. Insertar un nuevo usuario
DELIMITER $$
CREATE PROCEDURE insertar_usuario(IN username VARCHAR(50), IN password VARCHAR(255), IN id_persona INT)
BEGIN
    INSERT INTO user (username, password, person_id)
    VALUES (username, password, id_persona);
END $$
DELIMITER ;

-- 3. Ver todos los gastos
DELIMITER $$
CREATE PROCEDURE ver_gastos()
BEGIN
    SELECT * FROM expense;
END $$
DELIMITER ;

-- 4. Actualizar descripción de una categoría
DELIMITER $$
CREATE PROCEDURE actualizar_categoria(IN id INT, IN nueva_desc TEXT)
BEGIN
    UPDATE category
    SET description = nueva_desc
    WHERE id_category = id;
END $$
DELIMITER ;

-- 5. Eliminar un gasto
DELIMITER $$
CREATE PROCEDURE eliminar_gasto(IN id INT)
BEGIN
    DELETE FROM expense
    WHERE id_expense = id;
END $$
DELIMITER ;

-- 6. Ver reportes de un usuario
DELIMITER $$
CREATE PROCEDURE ver_reportes_usuario(IN id_usuario INT)
BEGIN
    SELECT * FROM report
    WHERE user_id = id_usuario;
END $$
DELIMITER ;

-- 7. Insertar meta financiera
DELIMITER $$
CREATE PROCEDURE insertar_meta(IN id_usuario INT, IN nombre VARCHAR(100), IN monto DECIMAL(10,2), IN fecha DATE, IN descp TEXT)
BEGIN
    INSERT INTO goal (user_id, name, target_amount, deadline, description)
    VALUES (id_usuario, nombre, monto, fecha, descp);
END $$
DELIMITER ;

-- 8. Actualizar meta (solo nombre y monto)
DELIMITER $$
CREATE PROCEDURE actualizar_meta(IN id_meta INT, IN nuevo_nombre VARCHAR(100), IN nuevo_monto DECIMAL(10,2))
BEGIN
    UPDATE goal
    SET name = nuevo_nombre, target_amount = nuevo_monto
    WHERE id_goal = id_meta;
END $$
DELIMITER ;

-- 9. Eliminar una notificación
DELIMITER $$
CREATE PROCEDURE eliminar_notificacion(IN id_notif INT)
BEGIN
    DELETE FROM notification
    WHERE id_notification = id_notif;
END $$
DELIMITER ;

-- 10. Ver todas las metas con su usuario
DELIMITER $$
CREATE PROCEDURE ver_metas_con_usuario()
BEGIN
    SELECT g.name, g.target_amount, g.deadline, u.username
    FROM goal g
    INNER JOIN user u ON g.user_id = u.id_user;
END $$
DELIMITER ;
