-- back compat for old kwarg name
  
  begin;
    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_extras as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_extras__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.extra_key = DBT_INTERNAL_DEST.extra_key))

    
    when matched then update set
        "EXTRA_KEY" = DBT_INTERNAL_SOURCE."EXTRA_KEY","EXTRA" = DBT_INTERNAL_SOURCE."EXTRA","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("EXTRA_KEY", "EXTRA", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("EXTRA_KEY", "EXTRA", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")

;
    commit;