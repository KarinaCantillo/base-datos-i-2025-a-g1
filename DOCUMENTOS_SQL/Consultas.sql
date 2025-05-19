-- Obtener gastos con nombre de categoría y nombre de usuario
SELECT e.id, u.username, c.name AS categoria, e.amount, e.description, e.date
FROM expense e
JOIN category c ON e.category_id = c.id
JOIN user u ON e.user_id = u.id;

--Ver metas junto al nombre del usuario que las creó
SELECT g.id, u.username, g.title, g.target_amount, g.deadline
FROM goal g
JOIN user u ON g.user_id = u.id;

--Mostrar reportes junto al nombre del usuario que los generó
SELECT r.id, u.username, r.title, r.period_start, r.period_end
FROM report r
JOIN user u ON r.user_id = u.id;

--Mostrar notificaciones con el nombre del usuario
SELECT n.id, u.username, n.message, n.date_sent, n.is_read
FROM notification n
JOIN user u ON n.user_id = u.id;

-- Mostrar auditorías con nombre de usuario
SELECT a.id, u.username, a.action, a.timestamp
FROM audit_log a
JOIN user u ON a.user_id = u.id;

--Sesiones de dispositivos con usuario
SELECT d.id, u.username, d.device_info, d.login_time, d.logout_time
FROM device_session d
JOIN user u ON d.user_id = u.id;

-- Obtener usuarios junto con su nombre de persona
SELECT u.username, p.full_name, p.email
FROM user u
JOIN person p ON u.person_id = p.id;

--Usuarios y sus roles
SELECT u.username, r.name AS rol
FROM user u
JOIN role r ON u.role_id = r.id;

--Consultar metas alcanzadas (donde el progreso >= meta)
SELECT g.title, g.target_amount, g.progress, u.username
FROM goal g
JOIN user u ON g.user_id = u.id
WHERE g.progress >= g.target_amount;

-- Gastos por categoría y usuario, ordenados por cantidad
SELECT u.username, c.name AS categoria, SUM(e.amount) AS total
FROM expense e
JOIN user u ON e.user_id = u.id
JOIN category c ON e.category_id = c.id
GROUP BY u.username, c.name
ORDER BY total DESC;
