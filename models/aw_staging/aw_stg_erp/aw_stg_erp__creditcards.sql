with 

source_creditcards as (

    select * from {{ source('aw_erp', 'sales_creditcard') }}

),

renamed as (

    select
       *

    from source_creditcards

)

select * from renamed