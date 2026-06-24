# Healthcare Operations Analysis

## Project Overview

Healthcare Operations Analysis is a data analytics project developed using Python and MySQL to analyze hospital operational data and generate actionable insights. The project focuses on patient admissions, department performance, waiting times, bed occupancy, readmission rates, and hospital resource utilization.

The objective is to help hospital management make data-driven decisions by identifying operational trends and key performance indicators (KPIs).

---

## Technologies Used

* Python
* MySQL
* Pandas
* Matplotlib
* OpenPyXL

---

## Database Design

The project uses four relational tables:

### Patients

Stores patient demographic information.

### Departments

Stores hospital department details.

### Beds

Tracks bed availability and occupancy status.

### Admissions

Stores admission records, discharge information, waiting times, and readmission data.

---

## Key Analysis Performed

* Department-wise patient admissions
* Average waiting time analysis
* Average length of stay calculation
* Bed occupancy rate monitoring
* Readmission rate calculation
* Monthly admission trend analysis
* City-wise patient distribution analysis

---

## SQL Concepts Applied

* INNER JOIN
* GROUP BY
* Aggregate Functions
* CASE Statements
* ORDER BY
* Date Functions
* Business KPI Calculations

---

## Python Features

* Data extraction from MySQL
* Data analysis using Pandas
* Data visualization using Matplotlib
* Automated report generation
* Excel report export

---

## Business Insights Generated

* Identified departments with the highest patient load
* Measured average patient waiting times
* Evaluated hospital bed utilization rates
* Calculated patient readmission percentages
* Analyzed monthly admission growth trends
* Generated operational reports for decision-making

---

## Project Structure

```text
Healthcare-Operations-Analysis-Project/
│
├── database.sql
├── analysis_queries.sql
├── python_analysis.py
├── requirements.txt
├── README.md
└── .gitignore
```

---

## Installation

```bash
pip install -r requirements.txt
```

---

## Database Setup

```sql
source database.sql
```

---

## Run the Project

```bash
python python_analysis.py
```

---

## Skills Demonstrated

* SQL Query Optimization
* Relational Database Design
* Data Analysis
* Data Visualization
* KPI Reporting
* Business Analytics
* Healthcare Domain Analysis

---
