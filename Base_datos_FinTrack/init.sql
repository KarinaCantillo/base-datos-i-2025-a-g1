DROP DATABASE IF EXISTS FinTrack;

CREATE DATABASE FinTrack;

USE FinTrack;


CREATE TABLE person (
    id_person INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    document_number VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);


CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    person_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES person(id_person)
);


CREATE TABLE role (
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);


CREATE TABLE role_user (
    id_role_user INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id_user),
    FOREIGN KEY (role_id) REFERENCES role(id_role)
);


CREATE TABLE module (
    id_module INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);


CREATE TABLE module_role (
    id_module_role INT PRIMARY KEY AUTO_INCREMENT,
    module_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (module_id) REFERENCES module(id_module),
    FOREIGN KEY (role_id) REFERENCES role(id_role)
);


CREATE TABLE form (
    id_form INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL
);


CREATE TABLE form_module (
    id_form_module INT PRIMARY KEY AUTO_INCREMENT,
    form_id INT NOT NULL,
    module_id INT NOT NULL,
    FOREIGN KEY (form_id) REFERENCES form(id_form),
    FOREIGN KEY (module_id) REFERENCES module(id_module)
);


-- Tabla: category
CREATE TABLE category (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Tabla: expense
CREATE TABLE expense (
    id_expense INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id_user),
    FOREIGN KEY (category_id) REFERENCES category(id_category)
);

-- Tabla: report
CREATE TABLE report (
    id_report INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100),
    period_start DATE,
    period_end DATE,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id_user)
);

-- Tabla: goal
CREATE TABLE goal (
    id_goal INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    target_amount DECIMAL(10,2) NOT NULL,
    deadline DATE,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id_user)
);

-- Tabla: budget
CREATE TABLE budget (
    id_budget INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    month_year VARCHAR(7) NOT NULL, -- Ejemplo: '2025-05'
    amount_limit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id_user),
    FOREIGN KEY (category_id) REFERENCES category(id_category)
);

-- Tabla: notification
CREATE TABLE notification (
    id_notification INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    date_sent DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id_user)
);

-- Tabla: audit_log
CREATE TABLE audit_log (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action TEXT NOT NULL,
    timestamp DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id_user)
);

-- Tabla: device_session
CREATE TABLE device_session (
    id_session INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    device_info TEXT,
    login_time DATETIME NOT NULL,
    logout_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(id_user)
);