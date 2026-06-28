
  
    

  create  table "olist_db"."stg_DWH"."dim_sellers__dbt_tmp"
  
  
    as
  
  (
    with source as (
    select * from "olist_db"."stg"."stg_sellers"
)

select
    row_number() over () as seller_sk,
    seller_id,
    seller_city,
    seller_state,
    seller_zip_code_prefix
from source
  );
  