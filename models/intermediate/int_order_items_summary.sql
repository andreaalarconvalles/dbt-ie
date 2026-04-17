with order_items as (
    select * from {{ ref('stg_order_items') }}
)

select
    order_id,
    count(order_item_id) as total_unique_items,
    sum(quantity) as total_quantity,
    sum(total_price) as total_item_value
from order_items
group by order_id
