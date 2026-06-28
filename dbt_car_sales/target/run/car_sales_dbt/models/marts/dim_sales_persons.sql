-- back compat for old kwarg name
  
  begin;
    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_sales_persons__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.sales_person_key = DBT_INTERNAL_DEST.sales_person_key))

    
    when matched then update set
        "SALES_PERSON_KEY" = DBT_INTERNAL_SOURCE."SALES_PERSON_KEY","SALES_PERSON_ID" = DBT_INTERNAL_SOURCE."SALES_PERSON_ID","SALES_PERSON_NAME" = DBT_INTERNAL_SOURCE."SALES_PERSON_NAME","DEALERSHIP" = DBT_INTERNAL_SOURCE."DEALERSHIP","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("SALES_PERSON_KEY", "SALES_PERSON_ID", "SALES_PERSON_NAME", "DEALERSHIP", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("SALES_PERSON_KEY", "SALES_PERSON_ID", "SALES_PERSON_NAME", "DEALERSHIP", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")

;
    commit;