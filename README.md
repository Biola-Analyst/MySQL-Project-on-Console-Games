# Gaming Console Sales & Release Analysis (MySQL Project)

This repository contains a MySQL data analysis project focused on gaming consoles, platform releases, game records, and sales-related analysis.

The project demonstrates SQL skills including database creation, data cleaning, table relationships, date conversion, joins, aggregations, and business insight generation.

---

# Project Overview

The goal of this project is to analyze gaming console and game-related datasets using MySQL to uncover meaningful insights about:
- Console platforms
- Release dates
- Game availability
- Platform relationships
- Data consistency
- Sales and gaming trends

---

# Tools & Technologies Used

- MySQL
- SQL Queries
- Relational Database Management
- Data Cleaning
- Data Transformation

---

# SQL Concepts Demonstrated

This project demonstrates the use of:

- Database Creation
- Table Alteration
- Primary Keys
- Foreign Keys
- Data Cleaning
- Date Formatting
- Data Type Conversion
- Aggregate Functions
- Joins
- Filtering
- Constraints
- Data Validation

---

# Database Structure

The project contains tables related to:
- Console platforms
- Console release dates
- Gaming records
- Platform relationships

---

# Key SQL Operations Performed

## Database Creation

```sql
CREATE DATABASE Console;
USE Console;
```

---

## Data Cleaning

Converted text-based dates into proper SQL DATE format using:

```sql
STR_TO_DATE()
```

---

## Table Modification

Added new columns for cleaned date values:

```sql
ALTER TABLE
ADD COLUMN
```

---

## Primary Key Implementation

Established unique platform identifiers:

```sql
ALTER TABLE
ADD PRIMARY KEY(Platform);
```

---

## Foreign Key Relationships

Connected related tables using:

```sql
FOREIGN KEY
REFERENCES
```

---

# Project Objectives

- Clean and transform console release data
- Improve database structure
- Establish table relationships
- Enhance data consistency
- Prepare data for business analysis

---

# Skills Demonstrated

- SQL Query Writing
- Relational Database Design
- Data Cleaning
- Database Management
- Problem Solving
- Analytical Thinking

---

# Files Included

```text
MySQL-Console-Project/
│
├── Console Project.sql
├── Dataset Files
└── README.md
```

---

# Sample Queries Used

## Convert Text to Date

```sql
UPDATE `p9-consoledates`
SET `New Discontiund Date` =
STR_TO_DATE(Discontinued, '%Y-%m-%d');
```

---

## Count Distinct Platforms

```sql
SELECT COUNT(DISTINCT Platform)
FROM `p9-consoledates`;
```

---

## Add Foreign Key Constraint

```sql
ALTER TABLE `p9-consolegames`
ADD CONSTRAINT FK_Consoleplatform
FOREIGN KEY (Platform)
REFERENCES `p9-consoledates`(Platform);
```

---

# Key Learning Outcomes

Through this project, I improved my understanding of:
- Database normalization
- Table relationships
- Data transformation
- SQL query optimization
- Data integrity management

---

# About Me

I am a Banking & Finance graduate transitioning into Data Analytics with interests in:
- SQL
- Power BI
- Excel Analytics
- Business Intelligence
- Financial Data Analysis

This project reflects my ability to work with structured databases and solve analytical problems using SQL.

---

# Future Improvements

- Add advanced JOIN analysis
- Create sales performance dashboards
- Integrate Power BI visualizations
- Perform trend analysis on gaming platforms

---

# Contact

## LinkedIn
http://www.linkedin.com/in/biola-ogunseye-63155a293

## GitHub
https://github.com/Biola-Analyst

## Email
biolaogunseye2018@gmail.com

---

# Thank You

Thank you for viewing this MySQL project.
Feedback and suggestions are welcome.
