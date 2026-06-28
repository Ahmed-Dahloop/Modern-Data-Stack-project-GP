with all_dates as (

    select order_purchase_timestamp::date as dt
    from "olist_db"."stg"."stg_orders"

    union all

    select order_approved_at::date
    from "olist_db"."stg"."stg_orders"

    union all

    select order_delivered_carrier_date::date
    from "olist_db"."stg"."stg_orders"

    union all

    select order_delivered_customer_date::date
    from "olist_db"."stg"."stg_orders"

    union all

    select order_estimated_delivery_date::date
    from "olist_db"."stg"."stg_orders"

    union all

    select shipping_limit_date::date
    from "olist_db"."stg"."stg_order_items"

    union all

    select review_creation_date::date
    from "olist_db"."stg"."stg_order_reviews"

    union all

    select review_answer_timestamp::date
    from "olist_db"."stg"."stg_order_reviews"

),

boundaries as (

    select
        min(dt) as min_date,
        max(dt) as max_date
    from all_dates
    where dt is not null

),

date_series as (

    select
        generate_series(
            (select min_date from boundaries),
            (select max_date from boundaries),
            interval '1 day'
        )::date as full_date

)

select
    row_number() over (order by full_date) as date_sk,
    full_date,
    extract(day from full_date) as day,
    extract(month from full_date) as month,
    extract(quarter from full_date) as quarter,
    extract(year from full_date) as year,
    extract(dow from full_date) as weekday
from date_series
order by full_date