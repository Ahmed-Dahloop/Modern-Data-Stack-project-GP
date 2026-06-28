
  create view "olist_db"."stg"."stg_products__dbt_tmp"
    
    
  as (
    with source as (

    select *
    from "olist_db"."public"."ods_products"

)

select

    coalesce(product_id,'unknown') as product_id,

    coalesce(
        trim(lower(product_category_name)),
        'unknown'
    ) as product_category_name,

    coalesce(
        cast(product_name_lenght as integer),
        0
    ) as product_name_length,

    coalesce(
        cast(product_description_lenght as integer),
        0
    ) as product_description_length,

    coalesce(
        cast(product_photos_qty as integer),
        0
    ) as product_photos_qty,

    coalesce(
        cast(product_weight_g as numeric),
        0
    ) as product_weight_g,

    coalesce(
        cast(product_length_cm as numeric),
        0
    ) as product_length_cm,

    coalesce(
        cast(product_height_cm as numeric),
        0
    ) as product_height_cm,

    coalesce(
        cast(product_width_cm as numeric),
        0
    ) as product_width_cm

from source
  );