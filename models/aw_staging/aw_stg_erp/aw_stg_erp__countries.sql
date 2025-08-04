with 

source_countries as (

    select * from {{ source('aw_erp', 'person_countryregion') }}

),

renamed as (

    select
       *

    from source_countries

)

select * from renamed