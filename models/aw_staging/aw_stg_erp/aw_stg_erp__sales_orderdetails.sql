with 

source_salesorderdetails as (

    select * from {{ source('aw_erp', 'sales_salesorderdetail') }}

),

renamed as (

    select
       *

    from source_salesorderdetails

)

select * from renamed