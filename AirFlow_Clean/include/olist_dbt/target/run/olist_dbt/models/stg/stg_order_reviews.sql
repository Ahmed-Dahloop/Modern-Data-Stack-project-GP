
  create view "olist_db"."stg"."stg_order_reviews__dbt_tmp"
    
    
  as (
    with source as (

    select *
    from "olist_db"."public"."ods_order_reviews"

)

select

    -- =====================
    -- IDs
    -- =====================
    coalesce(review_id, 'unknown') as review_id,
    coalesce(order_id, 'unknown') as order_id,

    -- =====================
    -- Review Score
    -- =====================
    coalesce(cast(review_score as integer), 0) as review_score,

    -- =====================
    -- Flags (Data Quality only)
    -- =====================
    case
        when review_comment_title is null then 0
        else 1
    end as has_review_title,

    case
        when review_comment_message is null then 0
        else 1
    end as has_review_message,

    -- =====================
    -- Text Fields (Cleaned)
    -- =====================
    coalesce(
        trim(lower(review_comment_title)),
        'unknown'
    ) as review_comment_title,

    coalesce(
        trim(lower(review_comment_message)),
        'unknown'
    ) as review_comment_message,

    -- =====================
    -- Dates
    -- =====================
    cast(review_creation_date as timestamp) as review_creation_date,
    cast(review_answer_timestamp as timestamp) as review_answer_timestamp

from source
  );