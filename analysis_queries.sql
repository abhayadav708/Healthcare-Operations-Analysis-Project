USE hospital_db;

-- 1. Total patients admitted department-wise
SELECT 
    d.department_name,
    COUNT(a.admission_id) AS total_admissions
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name;

-- 2. Average waiting time department-wise
SELECT 
    d.department_name,
    AVG(a.wait_time_minutes) AS avg_wait_time
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name;

-- 3. Average length of stay
SELECT 
    d.department_name,
    AVG(DATEDIFF(a.discharge_date, a.admission_date)) AS avg_length_of_stay
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name;

-- 4. Bed occupancy rate department-wise
SELECT 
    d.department_name,
    COUNT(b.bed_id) AS total_beds,
    SUM(CASE WHEN b.bed_status = 'Occupied' THEN 1 ELSE 0 END) AS occupied_beds,
    ROUND(
        SUM(CASE WHEN b.bed_status = 'Occupied' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(b.bed_id), 2
    ) AS occupancy_rate
FROM beds b
JOIN departments d
ON b.department_id = d.department_id
GROUP BY d.department_name;

-- 5. Readmission rate
SELECT 
    ROUND(
        SUM(CASE WHEN readmitted = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS readmission_rate
FROM admissions;

-- 6. Monthly admission trend
SELECT 
    MONTH(admission_date) AS month_number,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY MONTH(admission_date)
ORDER BY month_number;

-- 7. Patients with highest waiting time
SELECT 
    p.patient_name,
    d.department_name,
    a.wait_time_minutes
FROM admissions a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN departments d
ON a.department_id = d.department_id
ORDER BY a.wait_time_minutes DESC;

-- 8. City-wise patient count
SELECT 
    city,
    COUNT(*) AS total_patients
FROM patients
GROUP BY city;