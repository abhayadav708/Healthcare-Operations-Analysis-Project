CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE beds (
    bed_id INT PRIMARY KEY,
    department_id INT,
    bed_status VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    department_id INT,
    admission_date DATE,
    discharge_date DATE,
    bed_id INT,
    wait_time_minutes INT,
    readmitted VARCHAR(5),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (bed_id) REFERENCES beds(bed_id)
);

INSERT INTO departments VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Emergency'),
(5, 'ICU');

INSERT INTO patients VALUES
(101, 'Rahul Sharma', 45, 'Male', 'Kolkata'),
(102, 'Priya Singh', 32, 'Female', 'Delhi'),
(103, 'Amit Kumar', 55, 'Male', 'Mumbai'),
(104, 'Sneha Das', 28, 'Female', 'Kolkata'),
(105, 'Ravi Verma', 60, 'Male', 'Patna'),
(106, 'Anjali Roy', 40, 'Female', 'Durgapur'),
(107, 'Suman Gupta', 35, 'Male', 'Jaipur'),
(108, 'Neha Yadav', 50, 'Female', 'Lucknow');

INSERT INTO beds VALUES
(1, 1, 'Occupied'),
(2, 1, 'Available'),
(3, 2, 'Occupied'),
(4, 2, 'Available'),
(5, 3, 'Occupied'),
(6, 3, 'Occupied'),
(7, 4, 'Occupied'),
(8, 4, 'Available'),
(9, 5, 'Occupied'),
(10, 5, 'Occupied');

INSERT INTO admissions VALUES
(1, 101, 1, '2026-01-02', '2026-01-07', 1, 35, 'No'),
(2, 102, 4, '2026-01-05', '2026-01-06', 7, 60, 'Yes'),
(3, 103, 5, '2026-01-08', '2026-01-15', 9, 25, 'No'),
(4, 104, 3, '2026-02-01', '2026-02-05', 5, 45, 'No'),
(5, 105, 1, '2026-02-10', '2026-02-18', 1, 30, 'Yes'),
(6, 106, 2, '2026-02-15', '2026-02-20', 3, 50, 'No'),
(7, 107, 4, '2026-03-01', '2026-03-02', 7, 70, 'Yes'),
(8, 108, 5, '2026-03-05', '2026-03-12', 10, 20, 'No');