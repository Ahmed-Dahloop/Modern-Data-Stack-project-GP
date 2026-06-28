with source as (

    select *
    from "olist_db"."public"."ods_order_payments"

)

select
    order_id,
    payment_sequential,

    trim(lower(payment_type)) as payment_type,

    cast(payment_installments as integer) as payment_installments,
    cast(payment_value as numeric(10,2)) as payment_value

from source