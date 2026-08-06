# Community Water Safety Analytics with Microsoft Fabric

## Project Overview

This portfolio project demonstrates the development of an end-to-end analytics solution using Microsoft Fabric.

The project uses synthetic community water safety outreach data to analyse programme delivery, participant attendance, regional coverage, language accessibility, and participant satisfaction.

The solution uses a Microsoft Fabric Lakehouse to store and manage data. Fabric notebooks with PySpark are used to ingest, clean, standardise, and validate the source data using a Medallion Architecture approach.

Raw CSV files are stored in OneLake and ingested into Bronze Delta tables. The Silver layer applies data type conversion, text standardisation, deduplication, and data quality validation to create analysis-ready datasets.

The next stage of the project will create Gold analytical tables to support a Direct Lake semantic model and an interactive Power BI report.

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

## Solution Architecture

``mermaid
flowchart LR
    A[CSV Source Data] --> B[OneLake Files / raw]
    B --> C[Bronze Delta Tables]
    C --> D[Silver Delta Tables]
    D --> E[Gold Analytical Tables]
    E --> F[Semantic Model]
    F --> G[Power BI Dashboard]

```markdown
## Fabric Notebooks

### 01 - Bronze Data Ingestion

`01_load_bronze_data.ipynb`

- Defines explicit PySpark schemas
- Reads raw CSV files from OneLake
- Adds ingestion metadata
- Performs structural and relationship validation
- Writes Bronze Delta tables

### 02 - Silver Data Cleaning and Transformation

`02_clean_silver_data.ipynb`

- Cleans and standardises text fields
- Converts strings into appropriate date, integer, double, and boolean types
- Standardises categorical values
- Removes duplicate records
- Performs data quality and referential integrity checks
- Writes analysis-ready Silver Delta tables

## Business Questions

This project aims to answer the following business questions:

1. How many community water safety events have been delivered?
2. How many participants have been reached?
3. How has event delivery and participation changed over time?
4. Which regions and suburbs have the highest and lowest levels of participation?
5. How does actual attendance compare with registered attendance across different event types?
6. Which programme types reach the greatest number of participants?
7. Which languages are used to deliver the sessions?
8. How does participation differ by language?
9. Which venue types are most frequently used?
10. What is the average participant satisfaction score?
11. Which educators have delivered the most events?
12. Which locations or communities may require additional outreach?

## Project Status

🚧 **In Progress — Phase 3: Gold Analytics Layer**

### Completed

- ✅ Defined business requirements and analytical questions
- ✅ Created synthetic and anonymised source datasets
- ✅ Created Microsoft Fabric workspace and Lakehouse
- ✅ Loaded CSV source files into OneLake
- ✅ Built Bronze Delta tables using PySpark
- ✅ Implemented Bronze data validation
- ✅ Built Silver Delta tables using PySpark
- ✅ Implemented data type conversion and standardisation
- ✅ Implemented Silver data quality and referential integrity checks

### Next Steps

- ⏳ Design Gold analytical tables
- ⏳ Build Gold layer using PySpark and SQL
- ⏳ Create Direct Lake semantic model
- ⏳ Create DAX measures
- ⏳ Build Power BI dashboard
- ⏳ Implement row-level security