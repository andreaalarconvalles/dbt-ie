with products as (
    select * from {{ ref('stg_products') }}
),
categories as (
    select * from {{ ref('stg_categories') }}
),
suppliers as (
    select * from {{ ref('stg_suppliers') }}
)

select
    products.product_id,
    products.product_name,
    products.price,
    products.cost,
    products.status as product_status,
    categories.category_name,
    suppliers.supplier_name,
    suppliers.country as supplier_country
from products
left join categories on products.category_id = categories.category_id
left join suppliers on products.supplier_id = suppliers.supplier_id
