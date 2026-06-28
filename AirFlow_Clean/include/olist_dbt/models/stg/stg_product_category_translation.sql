with source as (

    select *
    from {{ source('olist_db','ods_product_category_translation') }}

)

select
    trim(lower(product_category_name)) as product_category_name,
    trim(lower(product_category_name_english)) as product_category_name_english

from source