select
    keycompany as company_id
    , namecompany as company_name
    , stockcodecompany as ticker
    , current_timestamp as updated_at
from {{ ref('company') }}