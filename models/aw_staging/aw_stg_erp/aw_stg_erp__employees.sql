with 

source_employees as (

    select * from {{ source('aw_erp', 'human_resources_employee') }}

),

renamed as (

    select
       *

    from source_employees

)

select * from renamed