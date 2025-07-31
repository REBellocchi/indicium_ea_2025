with 

source_persons as (

    select * from {{ source('aw_erp', 'person_person') }}

),

renamed as (

    select
       *

    from source_persons

)

select * from renamed