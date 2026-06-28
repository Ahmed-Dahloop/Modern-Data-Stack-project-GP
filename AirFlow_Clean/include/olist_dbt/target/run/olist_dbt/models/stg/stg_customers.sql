
  create view "olist_db"."stg"."stg_customers__dbt_tmp"
    
    
  as (
    with source as (

    select *
    from "olist_db"."public"."ods_customers"

)

select
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,

    trim(lower(customer_city)) as customer_city,
    trim(lower(customer_state)) as customer_state

from source
  );