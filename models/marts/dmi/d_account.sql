with
    stg_sales as (select * from {{ ref('stg_sales') }})

    , account as (
        select distinct
            md5(account_name) as account_key
            , account_name
        from stg_sales
        order by 2
    )

select * from account