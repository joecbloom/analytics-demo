with
    datetime as (select * from {{ ref('time') }})
    ,stocks as (select * from {{ ref('stocks') }})

select    
    stocks.keycompany as company_id
    , datetime.datetime+860 as date_day
    , cast(openvaluestock as numeric(18,2)) as opening_price
    , cast(closevaluestock as numeric(18,2)) as closing_price
    , cast(highvaluestock as numeric(18,2)) as high_price
    , cast(lowvaluestock as numeric(18,2)) as low_price
    , current_timestamp as updated_at
from stocks
left join datetime using (keytime)

union all

select    
    stocks.keycompany as company_id
    , datetime.datetime as date_day
    , cast(openvaluestock*uniform(0::float,2::float,random()) as numeric(18,2)) as opening_price
    , cast(closevaluestock*uniform(0::float,2::float,random()) as numeric(18,2)) as closing_price
    , cast(highvaluestock*uniform(0::float,2::float,random()) as numeric(18,2)) as high_price
    , cast(lowvaluestock*uniform(0::float,2::float,random()) as numeric(18,2)) as low_price
    , current_timestamp as updated_at
from stocks
left join datetime using (keytime)