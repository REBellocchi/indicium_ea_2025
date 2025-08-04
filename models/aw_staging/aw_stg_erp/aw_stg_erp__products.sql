with 

source_products as (

    select * from {{ source('aw_erp', 'production_product') }}

),

renamed as (

    select
       *

    from source_products

)

select * from renamed