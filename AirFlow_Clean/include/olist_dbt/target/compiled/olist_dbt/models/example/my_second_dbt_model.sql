-- Use the `ref` function to select from other models

select *
from "olist_db"."stg"."my_first_dbt_model"
where id = 1