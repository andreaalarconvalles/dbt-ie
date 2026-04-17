with orders as (
    select * from {{ ref('fact_orders') }}
),
customers as (
    select * from {{ ref('dim_customers') }}
)

select
    customers.customer_segment,
    count(distinct orders.order_id) as total_orders,
    sum(orders.total_amount) as total_revenue,
    avg(orders.total_amount) as average_order_value
from orders
join customers on orders.customer_id = customers.customer_id
group by 1
