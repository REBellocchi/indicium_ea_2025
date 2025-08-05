with 
    -- import models
    orders as ( 
        select *
        from {{ref('aw_stg_erp__sales_orderheaders')}}
    )
    , order_items as (
        select *
        from {{ref('aw_stg_erp__sales_orderdetails')}}
    )
    , creditcards as (
        select *
        from {{ref('aw_stg_erp__creditcards')}}
    )
    , locations as (
        select *
        from {{ ref('aw_int_sales__location_joined') }}
    )

    -- transformation
    , joined as (
        select 
            orders.salesorderid
            , orders.orderdate
            , orders.customerid
            , orders.salespersonid
            , orders.territoryid
            , orders.creditcardid
            , creditcards.cardtype
            , order_items.salesorderdetailid
            , order_items.productid 
            , order_items.orderqty
            , order_items.unitprice
            , order_items.unitpricediscount
            , locations.addressid
            , locations.city 
            , locations.stateprovincename as stateprovince
            , locations.countryname as country
        from orders
        inner join creditcards on orders.creditcardid = creditcards.creditcardid
        inner join order_items on orders.salesorderid = order_items.salesorderid
        inner join locations on orders.salesorderid = locations.salesorderid
    )

    , metrics as (
        select 
            salesorderdetailid
            , salesorderid
            , orderdate
            , customerid
            , salespersonid
            , territoryid
            , creditcardid
            , productid 
            , orderqty
            , unitprice
            , unitpricediscount
            , unitprice * orderqty as gross_total
            , unitprice * (1 - unitpricediscount) * orderqty as net_total
            , addressid 
            , city 
            , stateprovince 
            , country
        from joined
    )
select * 
from metrics