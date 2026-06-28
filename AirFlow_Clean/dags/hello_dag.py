from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator

# 1. function بسيطة
def hello():
    print("Hello Airflow 🚀 DAG is working!")

# 2. DAG definition
with DAG(
    dag_id="hello_airflow_dag",
    start_date=datetime(2024, 1, 1),
    schedule=None,  # manual run فقط
    catchup=False
) as dag:

    task1 = PythonOperator(
        task_id="say_hello",
        python_callable=hello
    )