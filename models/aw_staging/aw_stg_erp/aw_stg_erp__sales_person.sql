with 

source_salesperson as (

    select * from {{ source('aw_erp', 'sales_salesperson') }}

),

renamed as (

    select
       *

    from source_salesperson

)

select * from renamed