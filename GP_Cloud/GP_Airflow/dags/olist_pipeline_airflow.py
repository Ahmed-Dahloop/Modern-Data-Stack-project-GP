from airflow import DAG
from airflow.providers.databricks.operators.databricks import DatabricksRunNowOperator
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id="olist_pipeline_airflow",
    start_date=datetime(2026, 6, 1),
    schedule=None,
    catchup=False,
    tags=["olist", "databricks"],
) as dag:
    
    start = EmptyOperator(task_id="start")

    load_raw = DatabricksRunNowOperator(
        task_id="Load_DATA",
        databricks_conn_id="databricks_default",
        job_id=625298540406548
    )

    validate_ods = DatabricksRunNowOperator(
        task_id="ODS_DATA",
        databricks_conn_id="databricks_default",
        job_id=1097381478820284
    )

    ods_to_stg = DatabricksRunNowOperator(
        task_id="ODS_to_STG",
        databricks_conn_id="databricks_default",
        job_id=798836140131673
    )

    validate_stg = DatabricksRunNowOperator(
        task_id="STG_DATA",
        databricks_conn_id="databricks_default",
        job_id=591113226531309
    )

    stg_to_dwh = DatabricksRunNowOperator(
        task_id="STG_to_DWH",
        databricks_conn_id="databricks_default",
        job_id=490139393150818
    )
    end = EmptyOperator(task_id="end")


    start >> load_raw >> validate_ods >> ods_to_stg >> validate_stg >> stg_to_dwh>> end