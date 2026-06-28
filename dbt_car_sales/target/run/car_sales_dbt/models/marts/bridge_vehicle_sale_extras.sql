-- back compat for old kwarg name
  
  begin;
    
        
            
                
                
            
                
                
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.bridge_vehicle_sale_extras__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                    DBT_INTERNAL_SOURCE.sale_key = DBT_INTERNAL_DEST.sale_key
                ) and (
                    DBT_INTERNAL_SOURCE.extra_key = DBT_INTERNAL_DEST.extra_key
                )

    
    when matched then update set
        "SALE_KEY" = DBT_INTERNAL_SOURCE."SALE_KEY","EXTRA_KEY" = DBT_INTERNAL_SOURCE."EXTRA_KEY","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("SALE_KEY", "EXTRA_KEY", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("SALE_KEY", "EXTRA_KEY", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")

;
    commit;