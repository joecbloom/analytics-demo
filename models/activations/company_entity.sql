with
    company as (select * from {{ ref('d_company') }})
    , stocks as (select * from {{ ref('fact_stock_price_daily') }})
    
    , new_high as (
        select
            d_company_key
          , case
                when
                   max(case when date_day >= current_date-60 then high_price end)
                 > max(case when date_day < current_date-60 then high_price end)
                then true 
                else false
            end as new_high_60_days
        from {{ ref('fact_stock_price_daily') }}
        group by 1
    )

select
    company.company_id
    , company.company_name
    , min(stocks.low_price) as all_time_low
    , max(stocks.high_price) as all_time_high
    , coalesce(new_high.new_high_60_days,false) as new_high_last_60_days
from company
inner join stocks using (d_company_key)
left join new_high using (d_company_key)
group by 1, 2, 5