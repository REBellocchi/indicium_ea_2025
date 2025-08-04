with 

source_salesorderheaders as (

    select * from {{ source('aw_erp', 'sales_salesorderheader') }}

),

renamed as (

    select
       *

    from source_salesorderheaders

)

select * from renamed