select
    date_trunc(month, fact_sales.sale_date) as month
    , d_employee.employee_id
    , d_employee.employee_name
    , d_employee.employee_email
    , round(sum(sale_amount*0.1),2) as commission
from {{ ref('fact_sales') }}
    inner join {{ ref('d_employee') }}
group by 1, 2, 3, 4
order by 1 desc, 3