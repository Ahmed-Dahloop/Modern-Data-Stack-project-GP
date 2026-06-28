with orders as (
    select * from {{ ref('stg_orders') }}
),

reviews as (
    select * from {{ ref('stg_order_reviews') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
),

dates as (
    select * from {{ ref('dim_date') }}
)

select
    row_number() over () as order_sk,

    o.order_id,
    c.customer_sk,
    d.date_sk as purchase_date_sk,

    o.order_status,
    o.is_approved,
    o.is_shipped,
    o.is_delivered,

    r.review_score,

    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_customer_date

from orders o
left join reviews r on o.order_id = r.order_id
left join customers c on o.customer_id = c.customer_id
left join dates d on cast(o.order_purchase_timestamp as date) = d.full_date