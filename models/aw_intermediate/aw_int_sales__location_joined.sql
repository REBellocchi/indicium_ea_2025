with 
    -- import models
    sales as (
        select *
        from {{ ref('aw_stg_erp__sales_orderheaders') }}
    )
    , addresses as (
        select *
        from {{ ref('aw_stg_erp__addresses') }}
    )
    , statesprovinces as (
        select *
        from {{ ref('aw_stg_erp__statesprovinces') }} 
    )
    , countries as (
        select *
        from {{ ref('aw_stg_erp__countries') }} 
    )

    , joined as (
        select 
            sales.salesorderid
            , addresses.addressid
            , addresses.city 
            , addresses.stateprovinceid 
            , statesprovinces.stateprovincecode 
            , statesprovinces.countryregioncode 
            , statesprovinces.name as stateprovincename
            , statesprovinces.territoryid
            , countries.name as countryname
        from sales
        inner join addresses on sales.billtoaddressid = addresses.addressid
        inner join statesprovinces on addresses.stateprovinceid = statesprovinces.stateprovinceid
        inner join countries on statesprovinces.countryregioncode = countries.countryregioncode
    )

select *
from joined