with 

source_salesreason as (

    select * from {{ source('aw_erp', 'sales_salesreason') }}

),

renamed as (

    select
       *

    from source_salesreason

)

select * from renamed