
  create view "olist_db"."stg"."dim_customer__dbt_tmp"
    
    
  as (
    select
    customer_id,   -- 🔑 PRIMARY KEY

    coalesce(customer_city, 'Unknown') as customer_city,
    coalesce(customer_state, 'Unknown') as customer_state,
    customer_zip_code_prefix

from "olist_db"."stg"."stg_customers"
  );