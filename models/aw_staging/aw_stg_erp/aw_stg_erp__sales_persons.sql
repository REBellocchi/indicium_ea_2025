with 

source_salespersons as (

    select * from {{ source('aw_erp', 'sales_salesperson') }}

),

renamed as (

    select
       *

    from source_salespersons

)

select * from renamed