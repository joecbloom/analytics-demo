with
    src_employees as (select * from {{ source('hr', 'dmi_employees') }})

    ,renamed as (
        select
            id::int as employee_id
            , name as employee_name
            , email as employee_email
        from src_employees
    )

select * from renamed