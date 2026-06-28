with source as (

    select *
    from "olist_db"."public"."ods_product_category_translation"

)

select
    trim(lower(product_category_name)) as product_category_name,
    trim(lower(product_category_name_english)) as product_category_name_english

from source