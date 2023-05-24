with
    company as (select * from {{ ref('stg_company') }})
  , stock as (select * from {{ ref('stg_price_daily') }})

select
    md5(concat(stock.date_day,company.company_name)) as fact_stock_price_daily_key
    , md5(company.company_name) as d_company_key
    , stock.date_day
    , stock.opening_price
    , stock.closing_price
    , stock.low_price
    , stock.high_price
    , stock.updated_at
from stock
inner join company using (company_id)