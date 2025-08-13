with
    -- import models
    orders as (select * from {{ ref("aw_stg_erp__sales_orderheaders") }}),
    order_items as (select * from {{ ref("aw_stg_erp__sales_orderdetails") }}),
    creditcards as (select * from {{ ref("aw_stg_erp__creditcards") }}),
    locations as (select * from {{ ref("aw_int_sales__location_joined") }}),
    reasons as (select * from {{ ref('aw_int_sales__reason_joined') }}),
    products as (select * from {{ ref('aw_stg_erp__products') }}),
    persons as (select * from {{ ref('aw_stg_erp__persons') }}),
    -- transformation
    joined as (
        select
            orders.salesorderid,
            orders.orderdate,
            orders.salespersonid,
            orders.territoryid,
            orders.status,
            orders.subtotal,
            orders.taxamt,
            orders.freight,
            orders.totaldue,
            orders.creditcardid,
            orders.customerid,
            persons.name as customername,
            creditcards.cardtype,
            order_items.salesorderdetailid,
            order_items.productid,
            order_items.orderqty,
            order_items.unitprice,
            order_items.unitpricediscount,
            products.name as product_name,
            locations.addressid,
            locations.city,
            locations.stateprovincename as stateprovince,
            locations.countryname as country,
            reasons.reasontype
        from order_items
        left join orders on orders.salesorderid = order_items.salesorderid
        left join creditcards on orders.creditcardid = creditcards.creditcardid
        left join locations on orders.salesorderid = locations.salesorderid
        left join reasons on orders.salesorderid = reasons.salesorderid
        left join products on order_items.productid = products.productid
        left join persons on orders.customerid = persons.businessentityid
        group by all
    ),
    metrics as (
        select
            salesorderdetailid,
            salesorderid,
            orderdate,
            customerid,
            customername,
            salespersonid,
            territoryid,
            creditcardid,
            cardtype,
            reasontype,
            productid,
            product_name,
            orderqty,
            unitprice,
            unitpricediscount,
            unitprice * orderqty as gross_total,
            unitprice * (1 - unitpricediscount) * orderqty as net_total,
            addressid,
            city,
            stateprovince,
            country,
            status,
            subtotal,
            taxamt,
            freight,
            totaldue
        from joined
    )
select *
from metrics