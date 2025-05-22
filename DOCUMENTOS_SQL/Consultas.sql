-- 1. Gastos con categoría y usuario
SELECT e.id, u.username, c.name AS categoria, e.amount, e.description, e.date
FROM expense e
INNER JOIN category c ON e.category_id = c.id
INNER JOIN user u ON e.user_id = u.id;

-- 2. Metas junto al nombre del usuario
SELECT g.id, u.username, g.title, g.target_amount, g.deadline
FROM goal g
INNER JOIN user u ON g.user_id = u.id;

-- 3. Reportes con el nombre del usuario
SELECT r.id, u.username, r.title, r.period_start, r.period_end
FROM report r
INNER JOIN user u ON r.user_id = u.id;

-- 4. Notificaciones con nombre de usuario
SELECT n.id, u.username, n.message, n.date_sent, n.is_read
FROM notification n
INNER JOIN user u ON n.user_id = u.id;

-- 5. Auditorías con nombre de usuario
SELECT a.id, u.username, a.action, a.timestamp
FROM audit_log a
INNER JOIN user u ON a.user_id = u.id;

-- 6. Sesiones de dispositivos con usuario
SELECT d.id, u.username, d.device_info, d.login_time, d.logout_time
FROM device_session d
INNER JOIN user u ON d.user_id = u.id;

-- 7. Usuarios con su persona
SELECT u.username, p.full_name, p.email
FROM user u
INNER JOIN person p ON u.person_id = p.id;

-- 8. Usuarios y sus roles
SELECT u.username, r.name AS rol
FROM user u
INNER JOIN role r ON u.role_id = r.id;

-- 9. Metas alcanzadas (progreso >= meta)
SELECT g.title, g.target_amount, g.progress, u.username
FROM goal g
INNER JOIN user u ON g.user_id = u.id
WHERE g.progress >= g.target_amount;

-- 10. Gastos por categoría y usuario, ordenados por cantidad total
SELECT u.username, c.name AS categoria, SUM(e.amount) AS total
FROM expense e
INNER JOIN user u ON e.user_id = u.id
INNER JOIN category c ON e.category_id = c.id
GROUP BY u.username, c.name
ORDER BY total DESC;

