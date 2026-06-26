
    
    

select
    SALES_PERSON_KEY as unique_field,
    count(*) as n_records

from SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons
where SALES_PERSON_KEY is not null
group by SALES_PERSON_KEY
having count(*) > 1


