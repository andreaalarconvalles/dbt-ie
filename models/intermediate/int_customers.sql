with customers as (
    select * from {{ ref('stg_customers') }}
),

segments as (
    select * from {{ ref('segments') }}
),

addresses as (
    select * from {{ ref('stg_customer_addresses') }}
),

primary_addresses as (
    select 
        *,
        row_number() over (partition by customer_id order by is_default desc, address_id desc) as rn
    from addresses
)

select
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    customers.email,
    customers.age,
    customers.country,
    customers.customer_segment,
    segments.segment_id,
    primary_addresses.street_address,
    primary_addresses.postal_code,
    primary_addresses.city as address_city,
    primary_addresses.state as address_state,
    primary_addresses.country as address_country
from customers
left join segments on customers.customer_segment = segments.customer_segment
left join primary_addresses on customers.customer_id = primary_addresses.customer_id and primary_addresses.rn = 1
