with order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('dim_products') }}
)

select
    products.product_id,
    products.product_name,
    products.category_name,
    count(distinct order_items.order_id) as total_orders,
    sum(order_items.quantity) as total_quantity_sold,
    sum(order_items.total_price) as total_revenue
from order_items
left join products on order_items.product_id = products.product_id
group by 1, 2, 3
