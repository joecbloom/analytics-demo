select
    md5(row_number() over (order by 1)) as fact_sales_key
    , d_customer.customer_key
    , d_account.account_key
    , d_employee.employee_key
    , stg_sales.sale_amount
    , stg_sales.sale_date
from {{ ref('stg_sales') }}
    left join {{ ref('d_customer') }} on stg_sales.customer_name = d_customer.customer_name
    left join {{ ref('d_account') }} on stg_sales.account_name = d_account.account_name
    left join {{ ref('d_employee') }} on stg_sales.account_executive = d_employee.employee_name
order by stg_sales.sale_date desc