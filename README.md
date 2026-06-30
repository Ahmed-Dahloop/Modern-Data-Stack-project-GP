# Modern-Data-Stack-project-GP
# 🚀 Olist Data Engineering Pipeline

An end-to-end Data Engineering project built using the **Olist Brazilian E-Commerce Dataset**. This project demonstrates how to design, automate, and analyze data pipelines in both **Local** and **Cloud** environments.

---

## 📌 Project Overview

This project covers the complete data engineering lifecycle:

- Data Ingestion
- Data Processing
- Data Transformation
- Data Warehouse Modeling
- Workflow Orchestration
- Business Intelligence

The pipeline is implemented in two architectures:

- 🖥️ Local Architecture
- ☁️ Cloud Architecture

---

## 🏗️ Local Architecture

```
CSV Files
    │
    ▼
 MinIO
    │
    ▼
 PySpark
    │
    ▼
 PostgreSQL
    │
    ▼
 dbt
    │
    ▼
 Star Schema
    │
    ▼
 Power BI
```

Apache Airflow is used to automate the workflow.

---

## ☁️ Cloud Architecture

```
CSV Files
    │
    ▼
 Databricks
    │
    ▼
 Bronze
    │
    ▼
 Silver
    │
    ▼
 Gold
    │
    ▼
 Power BI
```

Apache Airflow is used for workflow orchestration in the cloud pipeline.

---

## 🛠️ Technologies Used

- Python
- PySpark
- PostgreSQL
- dbt
- Apache Airflow
- MinIO
- Databricks
- Power BI
- Git & GitHub

---

## ⭐ Key Features

- End-to-End Data Pipeline
- Local & Cloud Implementation
- Automated ETL Workflows
- Star Schema Data Warehouse
- Medallion Architecture (Bronze, Silver, Gold)
- Data Quality Validation
- Interactive Power BI Dashboards

---

## 📊 Data Warehouse

The project uses a Star Schema consisting of:

### Fact Tables
- Fact Orders
- Fact Order Items
- Fact payments

### Dimension Tables
- Dim Customers
- Dim Products
- Dim Sellers
- Dim Date

---

## 📈 Power BI Dashboards

The dashboards provide insights in powerBI Desktop

---

## 📂 Project Structure

```
project/
│
├── airflow/
├── pyspark/
├── dbt/
├── sql/
├── datasets/
├── dashboards/
├── docs/
└── README.md
```

---

## 🚀 Future Improvements

- Kafka Streaming
- Great Expectations
- CI/CD Pipeline
- Docker Deployment
- Kubernetes
- Machine Learning Integration

---

## 👨‍💻 Author

**Ahmed Dahloop**

Data Engineering Graduation Project
<img width="1059" height="602" alt="image" src="https://github.com/user-attachments/assets/4b5aea88-4c07-42a5-9d9a-e4da22fc433e" />
