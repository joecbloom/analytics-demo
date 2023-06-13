with
    stg_sales as (select * from {{ ref('stg_sales') }})

    , customer as (
        select distinct 
            md5(customer_name) as customer_key
            , customer_name
            , customer_email
        from stg_sales
        order by 2
    )

select * from customer