with 
    -- import models
    reasons as (
        select *
        from {{ref('aw_stg_erp__sales_reasons')}}
    )
    , reasonorderheader as (
        select *
        from {{ref('aw_stg_erp__sales_reasonorderheader')}} 
    )

    , joined as (
        select 
            reasonorderheader.salesorderid
            , reasonorderheader.salesreasonid 
            , reasons.name
            , reasons.reasontype
        from reasonorderheader
        inner join reasons on reasonorderheader.salesreasonid = reasons.salesreasonid 
    )

select *
from joined