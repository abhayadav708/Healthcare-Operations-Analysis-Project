import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Abhay70844@",
    database="hospital_db"
)

# 1. Department-wise admissions
query1 = """
SELECT 
    d.department_name,
    COUNT(a.admission_id) AS total_admissions
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name;
"""

df_admissions = pd.read_sql(query1, conn)
print("\nDepartment-wise Admissions")
print(df_admissions)

plt.figure(figsize=(8, 5))
plt.bar(df_admissions["department_name"], df_admissions["total_admissions"])
plt.xlabel("Department")
plt.ylabel("Total Admissions")
plt.title("Department-wise Patient Admissions")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# 2. Average waiting time
query2 = """
SELECT 
    d.department_name,
    AVG(a.wait_time_minutes) AS avg_wait_time
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name;
"""

df_wait = pd.read_sql(query2, conn)
print("\nAverage Waiting Time")
print(df_wait)

plt.figure(figsize=(8, 5))
plt.bar(df_wait["department_name"], df_wait["avg_wait_time"])
plt.xlabel("Department")
plt.ylabel("Average Wait Time")
plt.title("Average Waiting Time by Department")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# 3. Average length of stay
query3 = """
SELECT 
    d.department_name,
    AVG(DATEDIFF(a.discharge_date, a.admission_date)) AS avg_length_of_stay
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name;
"""

df_stay = pd.read_sql(query3, conn)
print("\nAverage Length of Stay")
print(df_stay)

plt.figure(figsize=(8, 5))
plt.bar(df_stay["department_name"], df_stay["avg_length_of_stay"])
plt.xlabel("Department")
plt.ylabel("Average Days")
plt.title("Average Length of Stay by Department")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# 4. Bed occupancy rate
query4 = """
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
"""

df_beds = pd.read_sql(query4, conn)
print("\nBed Occupancy Rate")
print(df_beds)

plt.figure(figsize=(8, 5))
plt.bar(df_beds["department_name"], df_beds["occupancy_rate"])
plt.xlabel("Department")
plt.ylabel("Occupancy Rate (%)")
plt.title("Bed Occupancy Rate by Department")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()


# 5. Readmission rate
query5 = """
SELECT 
    ROUND(
        SUM(CASE WHEN readmitted = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS readmission_rate
FROM admissions;
"""

df_readmission = pd.read_sql(query5, conn)
print("\nReadmission Rate")
print(df_readmission)


# 6. Monthly admission trend
query6 = """
SELECT 
    MONTH(admission_date) AS month_number,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY MONTH(admission_date)
ORDER BY month_number;
"""

df_month = pd.read_sql(query6, conn)
print("\nMonthly Admission Trend")
print(df_month)

plt.figure(figsize=(8, 5))
plt.plot(df_month["month_number"], df_month["total_admissions"], marker="o")
plt.xlabel("Month")
plt.ylabel("Total Admissions")
plt.title("Monthly Admission Trend")
plt.tight_layout()
plt.show()


# 7. Export reports to Excel
with pd.ExcelWriter("healthcare_operations_report.xlsx") as writer:
    df_admissions.to_excel(writer, sheet_name="Admissions", index=False)
    df_wait.to_excel(writer, sheet_name="Wait Time", index=False)
    df_stay.to_excel(writer, sheet_name="Length of Stay", index=False)
    df_beds.to_excel(writer, sheet_name="Bed Occupancy", index=False)
    df_readmission.to_excel(writer, sheet_name="Readmission Rate", index=False)
    df_month.to_excel(writer, sheet_name="Monthly Trend", index=False)

print("\nExcel report generated successfully.")

conn.close()