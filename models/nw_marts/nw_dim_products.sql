with 
    int_products as (
        select *
        from {{ ref('nw_int_products__enriched') }}
    )
select * 
from int_products