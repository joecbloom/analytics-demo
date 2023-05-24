select
    md5(company_name) as d_company_key
    , company_id
    , company_name
    , ticker
    , updated_at
from {{ ref('stg_company') }}