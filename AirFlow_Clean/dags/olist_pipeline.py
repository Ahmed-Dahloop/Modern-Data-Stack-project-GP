from datetime import datetime, timedelta
from minio import Minio
from airflow.exceptions import AirflowException
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator
from airflow.providers.standard.operators.bash import BashOperator
import psycopg2
import snowflake.connector
from airflow.exceptions import AirflowException


def check_minio():
    try:
        client = Minio(
            "host.docker.internal:9000",
            access_key="minioadmin",
            secret_key="minioadmin",
            secure=False
        )

        bucket_name = "my-bucket"

        if not client.bucket_exists(bucket_name):
            raise AirflowException(f"Bucket '{bucket_name}' does not exist")

        print("MinIO is reachable and bucket exists")

    except Exception as e:
        raise AirflowException(f"MinIO check failed: {str(e)}")

def validate_ods():
    try:
        conn = psycopg2.connect(
            host="host.docker.internal",
            database="olist_db",
            user="postgres",
            password="rootroot",
            port="5432"
        )

        cursor = conn.cursor()

        cursor.execute("""
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema='public';
        """)

        tables = cursor.fetchall()

        if len(tables) == 0:
            raise AirflowException("No tables found in ODS database")

        print(" ODS Tables:")

        for table in tables:
            print(table[0])

        cursor.close()
        conn.close()

    except Exception as e:
        raise AirflowException(f"ODS Validation failed: {e}")

def validate_stg():
    try:
        conn = psycopg2.connect(
            host="host.docker.internal",
            database="olist_db",
            user="postgres",
            password="rootroot",
            port="5432"
        )

        cursor = conn.cursor()

        cursor.execute("""
            SELECT table_name
            FROM information_schema.views
            WHERE table_schema = 'stg'
            ORDER BY table_name;
        """)

        views = cursor.fetchall()

        if len(views) == 0:
            raise AirflowException("No STG views found")

        print(" STG Views:")

        for view in views:
            print(view[0])

        cursor.close()
        conn.close()

    except Exception as e:
        raise AirflowException(f"STG Validation failed: {e}")

def validate_dwh():
    try:
        conn = snowflake.connector.connect(
            user="AHMEDDAHLOOP",
            password="asdfghJKL2003@",
            account="XKEUUOK-AZ02119",
            warehouse="OLIST_WH",
            database="OLIST_DWH",
            schema="DWH",
            role="ACCOUNTADMIN"
        )

        cursor = conn.cursor()

        cursor.execute("""
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'DWH'
            ORDER BY table_name;
        """)

        tables = cursor.fetchall()

        if len(tables) == 0:
            raise AirflowException("No DWH tables found in Snowflake")

        print("DWH Tables:")

        for table in tables:
            print(table[0])

        cursor.close()
        conn.close()

    except Exception as e:
        raise AirflowException(f"DWH Validation failed: {e}")
    
with DAG(
    dag_id='olist_pipeline',
    description='End-to-End Olist Data Pipeline',
    start_date=datetime(2025, 6, 1),
    schedule=None,
    catchup=False
) as dag:

    start = EmptyOperator(task_id="start")
    end = EmptyOperator(task_id="end")
    check_minio_task = PythonOperator(
    task_id="MinIO_RAW",
    python_callable=check_minio ,
    trigger_rule='all_success'
)
    validate_ods_task = PythonOperator(
    task_id="ODS_DATA",
    python_callable=validate_ods ,
    trigger_rule='all_success'
)
    run_dbt_stg_task = BashOperator(
    task_id="DBT_STG",
    bash_command="""
    cd /usr/local/airflow/include/olist_dbt && \
    dbt run --profiles-dir . --select path:models/stg
    """ ,
    trigger_rule='all_success'
)
    validate_stg_task = PythonOperator(
    task_id="STG_Tables",
    python_callable=validate_stg ,
    trigger_rule='all_success'
)
    validate_dwh_task = PythonOperator(
    task_id="DWH_IN_Snowflake",
    python_callable=validate_dwh ,
    trigger_rule='all_success'
)

    start >> check_minio_task >> validate_ods_task >> run_dbt_stg_task >> validate_stg_task >> validate_dwh_task >> end