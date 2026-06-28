select
    seller_id,   -- 🔑 PRIMARY KEY

    coalesce(seller_city, 'Unknown') as seller_city,
    coalesce(seller_state, 'Unknown') as seller_state

from "olist_db"."stg"."stg_sellers"