select
    date_trunc(month, fact_sales.sale_date) as sales_month
    , d_employee.employee_name
    , sum(sale_amount) as total_sales
from {{ ref('fact_sales') }}
    inner join {{ ref('d_employee') }}
group by 1, 2
order by 1 desc, 2