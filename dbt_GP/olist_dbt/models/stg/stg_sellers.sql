with source as (

    select *
    from {{ source('olist_db','ods_sellers') }}

)

select
    seller_id,
    seller_zip_code_prefix,

    trim(lower(seller_city)) as seller_city,
    trim(lower(seller_state)) as seller_state

from source