with 
    -- import models
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )
    , suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )
    , categories as (
        select *
        from {{ ref('stg_erp__categories') }}
    )
    , joined as (
        select 
            pr.product_pk
            , pr.supplier_fk
            , pr.category_fk
            , pr.product_name
            , pr.quantity_per_unit
            , pr.unit_price
            , pr.units_in_stock
            , pr.units_on_order
            , pr.reorder_level
            , pr.is_discontinued
            , su.supplier_name 
            , su.supplier_city
            , su.supplier_country
            , ca.category_name
        from products pr 
        left join suppliers su on pr.supplier_fk = su.supplier_pk 
        left join categories ca on pr.category_fk = ca.category_pk
    )
select * 
from joined