select    
    keycompany as company_id
    , keytime as time_id
    , cast(openvaluestock as numeric(18,2)) as opening_price
    , cast(closevaluestock as numeric(18,2)) as closing_price
    , cast(highvaluestock as numeric(18,2)) as high_price
    , cast(lowvaluestock as numeric(18,2)) as low_price
from {{ ref('stocks') }}