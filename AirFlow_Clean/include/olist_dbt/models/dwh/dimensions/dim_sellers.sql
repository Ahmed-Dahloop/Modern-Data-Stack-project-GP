with source as (
    select * from {{ ref('stg_sellers') }}
)

select
    row_number() over () as seller_sk,
    seller_id,
    seller_city,
    seller_state,
    seller_zip_code_prefix
from source