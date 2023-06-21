select
    d_customer.customer_name
    , d_account.account_name
    , sum(fact_sales.sale_amount) as ytd_sales
from {{ ref('fact_sales') }}
    inner join {{ ref('d_customer') }} using (customer_key)
    inner join {{ ref('d_account') }} using (account_key)
where year(fact_sales.sale_date) = year(current_date())
group by 1, 2
order by 3 desc
limit 10