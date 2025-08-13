with 

source_persons as (

    select * from {{ source('aw_erp', 'person_person') }}

),

renamed as (

    select
       *,
       lastname||' '||coalesce(middlename, '')||' '||firstname as name
    from source_persons

)

select * from renamed