
    
    

select
    CUSTOMER_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_customers
where CUSTOMER_KEY is not null
group by CUSTOMER_KEY
having count(*) > 1


