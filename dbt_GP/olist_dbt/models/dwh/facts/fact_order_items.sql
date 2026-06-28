with items as (
    select * from {{ ref('stg_order_items') }}
),

sellers as (
    select * from {{ ref('dim_sellers') }}
),

dates as (
    select * from {{ ref('dim_date') }}
)

select
    row_number() over () as order_item_sk,

    i.order_item_id,
    i.order_id,

    i.product_id,
    s.seller_sk,
    d.date_sk as shipping_date_sk,

    i.price,
    i.freight_value,
    i.shipping_limit_date

from items i
left join sellers s on i.seller_id = s.seller_id
left join dates d on cast(i.shipping_limit_date as date) = d.full_date