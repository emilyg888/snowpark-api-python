
    
    

select
    SOURCE_SALE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.STAGING.stg_car_sales_base
where SOURCE_SALE_KEY is not null
group by SOURCE_SALE_KEY
having count(*) > 1


