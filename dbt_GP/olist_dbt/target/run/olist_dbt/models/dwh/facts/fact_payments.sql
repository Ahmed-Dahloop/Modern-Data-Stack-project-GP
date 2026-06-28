
  
    

  create  table "olist_db"."stg_DWH"."fact_payments__dbt_tmp"
  
  
    as
  
  (
    with payments as (
    select * from "olist_db"."stg"."stg_order_payments"
)

select
    row_number() over () as payment_sk,

    order_id,

    payment_type,
    payment_installments,
    payment_value,
    payment_sequential

from payments
  );
  