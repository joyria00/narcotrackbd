# narcotrackbd-update1



NarcotrackBD – Database Design & Implementation



Project Overview

NarcotrackBD is a relational database system designed to manage and monitor narcotics-related cases in Bangladesh. The system supports multiple law enforcement and regulatory forces, ensures role-based access control, and maintains complete traceability of cases, evidence, and chain of custody.





Database Design
	•	Entity Relationship Diagram (ERD) designed using dbdiagram
	•	Fully normalized schema
	•	Strong enforcement of Primary Keys and Foreign Keys
	•	Supports complex relationships between users, cases, evidence, lab reports, and audits

📁 ERD file: /erd/narcotrackbd.png






Database Schema
	•	Implemented using MySQL
	•	Contains all CREATE TABLE statements
	•	Includes all PK and FK constraints
	•	Matches the ERD exactly (no deviations)

📁 SQL file: /database/narcotrackbd_schema.sql






Key Functional Coverage
	•	Role-based access control (RBAC)
	•	Multi-force user management (Police, RAB, DNC, BGB, etc.)
	•	Case creation and location tracking
	•	Evidence and digital evidence management
	•	Chain of custody tracking
	•	Lab reporting and analysis
	•	Audit logging and legal report generation






Technologies Used
	•	Database: MySQL
	•	Backend: PHP
	•	Frontend: HTML, CSS
	•	ERD Tool: dbdiagram.io





Purpose of Submission

This repository demonstrates:
	•	Database design quality
	•	Referential integrity and constraints
	•	Readiness for complex SQL querying
	•	Proper linkage between ERD, schema, and application layer


