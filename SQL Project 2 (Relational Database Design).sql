
-- SQL Project 2 (Relational Database Design)

-- Create a new database
CREATE DATABASE SQLProject2;
GO

-- USE the new database
USE SQLProject2;
GO

-- Creating Tables
CREATE TABLE role (
    id INT PRIMARY KEY,
    role_name VARCHAR(100)
);

CREATE TABLE user_account (
    id INT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(254),
    password VARCHAR(200),
    password_salt VARCHAR(50) NULL,
    password_hash_algorithm VARCHAR(50)
);

CREATE TABLE status (
    id INT PRIMARY KEY,
    status_name VARCHAR(100),
    is_user_working BIT
);

CREATE TABLE user_has_role (
    id INT PRIMARY KEY,
    role_start_time DATETIME2,
    role_end_time DATETIME2 NULL,
    user_account_id INT,
    role_id INT,
    FOREIGN KEY (user_account_id) REFERENCES user_account(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE user_has_status (
    id INT PRIMARY KEY,
    status_start_time DATETIME2,
    status_end_time DATETIME2 NULL,
    user_account_id INT,
    status_id INT,
    FOREIGN KEY (user_account_id) REFERENCES user_account(id),
    FOREIGN KEY (status_id) REFERENCES status(id)
);

-- 1. Insert data into each of the above tables. With at least two rows in each of the table, make sure, that you have created respective foreign keys.
INSERT INTO role (id, role_name)
VALUES (1, 'Admin'), (2, 'User')

INSERT INTO user_account (id, user_name, email, password, password_salt, password_hash_algorithm)
VALUES (1, 'John', 'john@example.com', 'password123', 'salt1', 'SHA512'),
       (2, 'Jane', 'jane@example.com', 'password456', 'salt2', 'SHA512')

INSERT INTO status (id, status_name, is_user_working)
VALUES (1, 'Active', 1), (2, 'Inactive', 0)

INSERT INTO user_has_role (id, role_start_time, user_account_id, role_id)
VALUES (1, CURRENT_TIMESTAMP, 1, 1), (2, CURRENT_TIMESTAMP, 2, 2)

INSERT INTO user_has_status (id, status_start_time, user_account_id, status_id)
VALUES (1, CURRENT_TIMESTAMP, 1, 1), (2, CURRENT_TIMESTAMP, 2, 2)

-- 2. Delete all the data from each of the tables.
DELETE FROM user_has_status
DELETE FROM user_has_role
DELETE FROM status
DELETE FROM user_account
DELETE FROM role