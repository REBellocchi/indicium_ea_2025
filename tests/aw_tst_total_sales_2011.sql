/*  
    This test ensures that the gross sales for 2011 match
    the audited accounting value:
    $12.646.112,16
*/
with
    aw_sales_2011 as (
        --select sum(gross_total) as total
        select 
            --sum(gross_total), 
            --sum(net_total), 
            sum(subtotal) over (partition by salesorderid),
            sum(totaldue) over (partition by salesorderid)
        from {{ ref('aw_int_sales__metrics') }}
        where orderdate between '2011-01-01' and '2011-12-31'
        group by salesorderid
    )

select *--total
from aw_sales_2011
--where total not between 12646112.14 and 12646112.18