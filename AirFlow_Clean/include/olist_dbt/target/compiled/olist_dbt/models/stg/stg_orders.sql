with source as (

    select *
    from "olist_db"."public"."ods_orders"

)

select

    order_id,
    customer_id,

    coalesce(lower(trim(order_status)), 'unknown') as order_status,
     case
        when order_approved_at is null then 0
        else 1
    end as is_approved,

    case
        when order_delivered_carrier_date is null then 0
        else 1
    end as is_shipped,

    case
        when order_delivered_customer_date is null then 0
        else 1
    end as is_delivered,


    cast(order_purchase_timestamp as timestamp) as order_purchase_timestamp,

    cast(order_approved_at as timestamp) as order_approved_at,

    cast(order_delivered_carrier_date as timestamp) as order_delivered_carrier_date,

    cast(order_delivered_customer_date as timestamp) as order_delivered_customer_date,

    cast(order_estimated_delivery_date as timestamp) as order_estimated_delivery_date

   
from source