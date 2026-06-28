with source as (

    select *
    from {{ source('olist_db','ods_geolocation') }}

)

select
    geolocation_zip_code_prefix,

    cast(geolocation_lat as numeric(10,6)) as geolocation_lat,
    cast(geolocation_lng as numeric(10,6)) as geolocation_lng,

    trim(lower(geolocation_city)) as geolocation_city,
    trim(lower(geolocation_state)) as geolocation_state

from source