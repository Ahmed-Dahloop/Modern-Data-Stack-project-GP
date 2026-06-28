select
    geolocation_zip_code_prefix,   -- 🔑 PRIMARY KEY (logical)

    coalesce(geolocation_lat, 0) as lat,
    coalesce(geolocation_lng, 0) as lng,

    coalesce(geolocation_city, 'Unknown') as city,
    coalesce(geolocation_state, 'Unknown') as state

from "olist_db"."stg"."stg_geolocation"