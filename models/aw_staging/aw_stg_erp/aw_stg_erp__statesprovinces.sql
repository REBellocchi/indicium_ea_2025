with 

source_statesprovinces as (

    select * from {{ source('aw_erp', 'person_stateprovince') }}

),

renamed as (

    select
       *

    from source_statesprovinces

)

select * from renamed