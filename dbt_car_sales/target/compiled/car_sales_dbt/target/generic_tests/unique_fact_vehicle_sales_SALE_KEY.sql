
    
    

select
    SALE_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.fact_vehicle_sales
where SALE_KEY is not null
group by SALE_KEY
having count(*) > 1


