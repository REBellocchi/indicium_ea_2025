with 

source_salesreasonorderheader as (

    select * from {{ source('aw_erp', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
       *

    from source_salesreasonorderheader

)

select * 
from renamed
