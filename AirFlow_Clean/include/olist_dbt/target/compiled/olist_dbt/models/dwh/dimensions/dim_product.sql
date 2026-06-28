select
    product_id,   -- 🔑 PRIMARY KEY

    coalesce(product_category_name, 'Unknown') as product_category,
    coalesce(product_weight_g, 0) as product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm

from "olist_db"."stg"."stg_products"