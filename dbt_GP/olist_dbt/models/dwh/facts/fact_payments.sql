with payments as (
    select * from {{ ref('stg_order_payments') }}
)

select
    row_number() over () as payment_sk,

    order_id,

    payment_type,
    payment_installments,
    payment_value,
    payment_sequential

from payments