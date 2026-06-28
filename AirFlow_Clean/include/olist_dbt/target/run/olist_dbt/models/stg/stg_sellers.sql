
  create view "olist_db"."stg"."stg_sellers__dbt_tmp"
    
    
  as (
    with source as (

    select *
    from "olist_db"."public"."ods_sellers"

)

select
    seller_id,
    seller_zip_code_prefix,

    trim(lower(seller_city)) as seller_city,
    trim(lower(seller_state)) as seller_state

from source
  );