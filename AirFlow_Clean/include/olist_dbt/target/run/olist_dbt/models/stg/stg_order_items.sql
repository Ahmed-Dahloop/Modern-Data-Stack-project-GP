
  create view "olist_db"."stg"."stg_order_items__dbt_tmp"
    
    
  as (
    with source as (

    select *
    from "olist_db"."public"."ods_order_items"

)

select

    -- IDs
    order_id,
    order_item_id,
    product_id,
    seller_id,

    -- TIMESTAMP (cast only)
    cast(shipping_limit_date as timestamp) as shipping_limit_date,

    -- NUMERIC FIELDS (cast only)
    cast(price as numeric(10,2)) as price,
    cast(freight_value as numeric(10,2)) as freight_value

from source
  );