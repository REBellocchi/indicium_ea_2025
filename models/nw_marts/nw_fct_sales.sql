with 
    int_sales as (
        select *
        from {{ ref('nw_int_sales__metrics') }}
    )
select * 
from int_sales