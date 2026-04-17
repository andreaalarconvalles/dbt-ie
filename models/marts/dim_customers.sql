with int_customers as (
    select * from {{ ref('int_customers') }}
)

select
    customer_id,
    first_name,
    last_name,
    -- Business Logic: Full Name
    first_name || ' ' || last_name as full_name,
    
    email,
    -- Business Logic: Email Domain extraction
    split_part(email, '@', 2) as email_domain,
    
    age,
    -- Business Logic: Age Grouping
    case 
        when age < 18 then 'Under 18'
        when age between 18 and 30 then '18-30'
        when age between 31 and 50 then '31-50'
        else '50+'
    end as age_group,
    
    country,
    customer_segment,
    -- Business Logic: Priority Flag
    customer_segment in ('Gold', 'Platinum') as is_priority_customer,
    
    street_address,
    postal_code,
    address_city,
    address_state,
    address_country

from int_customers
