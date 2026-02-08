# SQL-Stored-Procedures-Task

## Overview
This repository contains SQL Server stored procedures developed as part of a database task.  
Each stored procedure addresses a specific requirement related to employees, activities, contacts, workflows, and login history.

The procedures are written and tested using **SQL Server Management Studio (SSMS)**.

---

## Database Information
- **Database Name:** DCN-Miju  
- **Database Source:** Restored from `Task.bak`
- **Platform:** Microsoft SQL Server

---

## File Structure
Each question is implemented in a **separate SQL script** with its corresponding test execution.

```text
SQLQuery1_Q1.sql  → Employee Activity Log
SQLQuery2_Q2.sql  → Employee Summary
SQLQuery3_Q3.sql  → Activity Report
SQLQuery4_Q4.sql  → Search Contacts (Pagination)
SQLQuery5_Q5.sql  → Workflow Participants
SQLQuery6_Q6.sql  → Employee Login History
SQLQuery7_Q7.sql  → Activity Dashboard

## How to Run

1. Open **SQL Server Management Studio (SSMS)**.
2. Restore the provided database backup (`Task.bak`) and ensure the database name is **DCN-Miju**.
3. Open any SQL script file (e.g., `SQLQuery1_Q1.sql`) in SSMS.
4. Verify the database context at the top of the script:
   ```sql
   USE [DCN-Miju];
