with 

source_customers as (

    select * from {{ source('aw_erp', 'sales_customer') }}

),

renamed as (

    select
       *

    from source_customers

)

select * from renamed