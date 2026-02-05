CREATE DATABASE doctor_booking;
USE doctor_booking;

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE slots (
    slot_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    slot_date DATE,
    start_time TIME,
    end_time TIME,
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    user_name VARCHAR(100),
    slot_date DATE,
    start_time TIME,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);