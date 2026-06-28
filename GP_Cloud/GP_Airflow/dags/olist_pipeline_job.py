from airflow import DAG
from airflow.providers.databricks.operators.databricks import DatabricksRunNowOperator
from datetime import datetime

with DAG(
    dag_id="olist_pipeline_job",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["Databricks", "Olist", "Pipeline"]
) as dag:

    run_olist_pipeline = DatabricksRunNowOperator(
        task_id="run_olist_pipeline",
        databricks_conn_id="databricks_default",
        job_id=794056808036191
    )