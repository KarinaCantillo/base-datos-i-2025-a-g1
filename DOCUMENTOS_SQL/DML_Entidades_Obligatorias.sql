
INSERT INTO person (full_name, document_number, email, phone) VALUES
('Ana Torres', '12345678', 'ana@example.com', '123-456-7890'),
('Luis Méndez', '23456789', 'luis@example.com', '321-654-0987'),
('Sofía Ramírez', '34567890', 'sofia@example.com', '456-789-1230'),
('Carlos Pérez', '45678901', 'carlos@example.com', '987-654-3210'),
('Valeria Gómez', '56789012', 'valeria@example.com', '789-123-4567'),
('Jorge Díaz', '67890123', 'jorge@example.com', '111-222-3333'),
('Lucía Herrera', '78901234', 'lucia@example.com', '222-333-4444'),
('Fernando Rivas', '89012345', 'fernando@example.com', '333-444-5555'),
('María León', '90123456', 'maria@example.com', '444-555-6666'),
('David Soto', '01234567', 'david@example.com', '555-666-7777');

INSERT INTO user (username, password, person_id) VALUES
('anaT', 'pass123', 1),
('luisM', 'pass123', 2),
('sofiaR', 'pass123', 3),
('carlosP', 'pass123', 4),
('valeriaG', 'pass123', 5),
('jorgeD', 'pass123', 6),
('luciaH', 'pass123', 7),
('fernandoR', 'pass123', 8),
('mariaL', 'pass123', 9),
('davidS', 'pass123', 10);

INSERT INTO role (name, description) VALUES
('Admin', 'Usuario administrador del sistema'),
('User', 'Usuario estándar que gestiona sus finanzas personales'),
('Auditor', 'Usuario con acceso de solo lectura para fines de auditoría'),
('Support', 'Supervisor técnico con acceso limitado para resolver incidencias'),
('Manager', 'Supervisor con capacidad de revisar múltiples cuentas'),
('Analyst', 'Usuario que genera reportes financieros'),
('BudgetPlanner', 'Usuario especializado en planificación y control de presupuestos'),
('NotificationManager', 'Encargado de configurar alertas y notificaciones'),
('SecurityOfficer', 'Responsable de monitorear sesiones y registros de seguridad'),
('Developer', 'Usuario con acceso a funcionalidades técnicas y pruebas');

INSERT INTO role_user (user_id, role_id) VALUES
(1, 1),  -- Admin
(2, 2),  -- User
(3, 2),  -- User
(4, 3),  -- Auditor
(5, 2),  -- User
(6, 2),  -- User
(7, 2),  -- User
(8, 3),  -- Auditor
(9, 1),  -- Admin
(10, 2); -- User

INSERT INTO module (name, description) VALUES
('Gestión de Usuarios', 'Módulo para gestionar usuarios y roles del sistema'),
('Control de Finanzas', 'Módulo para registrar, editar y eliminar gastos'),
('Gestión de Categorías', 'Módulo para crear y administrar categorías de gastos'),
('Presupuestos', 'Módulo para configurar límites de gasto mensuales'),
('Metas Financieras', 'Módulo para definir y hacer seguimiento de metas de ahorro'),
('Reportes y Auditoría', 'Módulo para generar reportes y auditar acciones de usuario'),
('Notificaciones', 'Módulo para gestionar alertas y notificaciones del sistema'),
('Seguridad y Accesos', 'Módulo para controlar sesiones, logs y dispositivos'),
('Configuración del Sistema', 'Módulo para gestionar parámetros generales del sistema'),
('Gestión de Formularios', 'Módulo para vincular formularios a módulos y permisos');

INSERT INTO module_role (module_id, role_id) VALUES
(1, 1),  -- Admin puede gestionar usuarios
(2, 2),  -- User puede acceder a control de finanzas
(3, 3),  -- Auditor accede a gestión de categorías
(2, 1),  -- Admin también puede acceder a control de finanzas
(3, 1),  -- Admin también puede acceder a categorías
(4, 2),  -- User puede usar presupuestos
(5, 2),  -- User puede gestionar metas financieras
(6, 3),  -- Auditor accede a reportes
(7, 1),  -- Admin gestiona notificaciones
(8, 1);  -- Admin controla seguridad y accesos

INSERT INTO form (name, url) VALUES
('Usuarios', '/usuarios'),
('Roles', '/roles'),
('Gastos', '/gastos'),
('Reportes', '/reportes'),
('Auditoría', '/auditoria'),
('Presupuestos', '/presupuestos'),
('Metas Financieras', '/metas'),
('Categorías', '/categorias'),
('Notificaciones', '/notificaciones'),
('Sesiones Activas', '/sesiones');

-- Asignación de formularios a módulos
INSERT INTO form_module (form_id, module_id) VALUES
(1, 1),  -- Usuarios → Gestión de Usuarios
(2, 1),  -- Roles → Gestión de Usuarios
(3, 2),  -- Gastos → Control de Finanzas
(4, 6),  -- Reportes → Reportes y Auditoría
(5, 6),  -- Auditoría → Reportes y Auditoría
(6, 4),  -- Presupuestos → Presupuestos
(7, 5),  -- Metas Financieras → Metas Financieras
(8, 3),  -- Categorías → Gestión de Categorías
(9, 7),  -- Notificaciones → Notificaciones
(10, 8); -- Sesiones Activas → Seguridad y Accesos
