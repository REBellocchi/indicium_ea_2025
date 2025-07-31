with 

source_salesheader as (

    select * from {{ source('aw_erp', 'sales_salesorderheader') }}

),

renamed as (

    select
       *

    from source_salesheader

)

select * from renamed