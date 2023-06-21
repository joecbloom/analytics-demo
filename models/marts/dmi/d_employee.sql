with
    stg_employee as (select * from {{ ref('stg_employees') }})

    , employee as (
        select distinct
            md5(employee_id) as employee_key
            , employee_id
            , employee_name
            , employee_email
        from stg_employee
        order by 2
    )

select * from employee