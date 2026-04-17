with orders as (
    select * from {{ ref('stg_orders') }}
),

shipping as (
    select * from {{ ref('stg_shipping') }}
)

select
    orders.order_id,
    orders.order_date,
    shipping.ship_date,
    shipping.estimated_delivery,
    shipping.actual_delivery,
    shipping.carrier,
    shipping.shipping_method,
    shipping.shipping_status,
    
    -- Date calculations
    date_diff('day', cast(orders.order_date as date), cast(shipping.ship_date as date)) as days_to_ship,
    date_diff('day', cast(shipping.ship_date as date), cast(shipping.estimated_delivery as date)) as estimated_days_in_transit,
    date_diff('day', cast(shipping.ship_date as date), cast(shipping.actual_delivery as date)) as actual_days_in_transit,
    
    -- Late delivery flag
    cast(shipping.actual_delivery as date) > cast(shipping.estimated_delivery as date) as is_late_delivery

from orders
join shipping on orders.order_id = shipping.order_id
