with orders as (
    select * from {{ ref('stg_orders') }}
),

items_summary as (
    select * from {{ ref('int_order_items_summary') }}
),

shipping_summary as (
    select * from {{ ref('int_order_shipping') }}
)

select
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.status as order_status,
    orders.total_amount,
    orders.payment_method,
    
    -- Items metrics
    coalesce(items_summary.total_unique_items, 0) as total_unique_items,
    coalesce(items_summary.total_quantity, 0) as total_item_quantity,
    
    -- Shipping metrics
    shipping_summary.carrier,
    shipping_summary.shipping_method,
    shipping_summary.days_to_ship,
    shipping_summary.estimated_days_in_transit,
    shipping_summary.actual_days_in_transit,
    shipping_summary.is_late_delivery

from orders
left join items_summary on orders.order_id = items_summary.order_id
left join shipping_summary on orders.order_id = shipping_summary.order_id
