with
    src_sales as (select * from {{ source('sales', 'dmi_sales') }})

    ,staged as (
        select
            sale_date
            , sale_amount::numeric(18,2) as sale_amount
            , customer_contact as customer_name
            , customer_email
            , customer as account_name
            , owner as account_executive
        from src_sales
    )

select * from staged
