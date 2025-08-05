with 
    source_suppliers as (
        select *
        from {{ source('erp', 'suppliers') }}
    )
    , renamed as (
        select 
            cast(id as int) as supplier_pk
            , cast(companyname as varchar) as supplier_name
            -- , cast(contactname as varchar) as supplier_
            -- , cast(contacttitle as varchar) as supplier_
            -- , cast(address as varchar) as  supplier_
            , cast(city as varchar) as supplier_city
            , cast(region as varchar) as supplier_region
            -- , cast(postalcode as varchar) as  supplier_
            , cast(country as varchar) as supplier_country
            -- , cast(phone as varchar) as supplier_
            -- , cast(fax as varchar) as  supplier_
            -- , cast(homepage as varchar) as supplier_
        from source_suppliers
    )

select *
from renamed