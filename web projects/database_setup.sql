-- Sri Drive - Vehicle System Database Setup
-- Run this script in MySQL Workbench to create the database and admin user

CREATE DATABASE IF NOT EXISTS vehicle_service;
USE vehicle_service;

-- User table (required for login)
CREATE TABLE IF NOT EXISTS user (
    userid INT AUTO_INCREMENT PRIMARY KEY,
    nic VARCHAR(20),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    mobile BIGINT,
    user_type VARCHAR(20) NOT NULL
);

-- Insert default admin user (run once)
-- Email: admin@sridrive.com  |  Password: admin123
INSERT IGNORE INTO user (nic, name, email, password, mobile, user_type) 
VALUES ('admin', 'Admin', 'admin@sridrive.com', 'admin123', 0, 'admin');
