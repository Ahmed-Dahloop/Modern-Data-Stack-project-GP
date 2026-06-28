with source as (
    select * from "olist_db"."stg"."stg_customers"
)

select
    row_number() over () as customer_sk,
    customer_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
from source