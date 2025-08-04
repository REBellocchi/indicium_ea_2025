with 

source_addresses as (

    select * from {{ source('aw_erp', 'person_address') }}

),

renamed as (

    select
       *

    from source_addresses

)

select * from renamed