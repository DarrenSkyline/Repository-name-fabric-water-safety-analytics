# Community Water Safety Analytics with Microsoft Fabric

## Project Overview

This portfolio project demonstrates the development of an end-to-end analytics solution using Microsoft Fabric.

The project uses synthetic community water safety outreach data to analyse programme delivery, participant attendance, regional coverage, language accessibility, and participant satisfaction.

The solution will use a Microsoft Fabric Lakehouse to store and manage data. Fabric notebooks with PySpark will be used to clean, transform, and aggregate the source data into analysis-ready Delta tables. These tables will support a semantic model and an interactive Power BI report.

The planned solution includes:

- Microsoft Fabric Workspace and Lakehouse
- OneLake file storage
- Bronze, Silver, and Gold data layers
- Delta tables
- Fabric notebooks
- Python and PySpark data transformations
- SQL validation queries
- A Direct Lake semantic model
- DAX measures and measure metadata
- A Power BI thin report
- Data quality checks
- Row-level security

> **Data disclaimer:** All data used in this project is synthetic and was created for learning and portfolio purposes. It does not contain confidential, personal, or organisational information.

## Business Questions

This project aims to answer the following business questions:

1. How many community water safety events have been delivered?
2. How many participants have been reached?
3. How has event delivery and participation changed over time?
4. Which regions and suburbs have the highest and lowest levels of participation?
5. What is the attendance rate for each event type?
6. Which programme types reach the greatest number of participants?
7. Which languages are used to deliver the sessions?
8. How does participation differ by language?
9. Which venue types are most frequently used?
10. What is the average participant satisfaction score?
11. Which educators have delivered the most events?
12. Which locations or communities may require additional outreach?

## Project Status

🚧 **In Progress — Phase 1: Lakehouse Foundation**

The current phase focuses on:

- Defining the business requirements
- Preparing synthetic source data
- Creating a Microsoft Fabric workspace
- Creating a Lakehouse
- Loading CSV files into OneLake
- Creating Bronze Delta tables
- Validating the source data with SQL