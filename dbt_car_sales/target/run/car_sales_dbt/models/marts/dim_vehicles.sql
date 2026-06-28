-- back compat for old kwarg name
  
  begin;
    
        
            
            
            
            
        
    

    

    merge into SNOWPARK_SAMPLE_DATA.MART.dim_vehicles as DBT_INTERNAL_DEST
        using SNOWPARK_SAMPLE_DATA.MART.dim_vehicles__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.vehicle_key = DBT_INTERNAL_DEST.vehicle_key))

    
    when matched then update set
        "VEHICLE_KEY" = DBT_INTERNAL_SOURCE."VEHICLE_KEY","MAKE" = DBT_INTERNAL_SOURCE."MAKE","MODEL" = DBT_INTERNAL_SOURCE."MODEL","YEAR" = DBT_INTERNAL_SOURCE."YEAR","SOURCE_SALE_KEY" = DBT_INTERNAL_SOURCE."SOURCE_SALE_KEY","SOURCE_FILE" = DBT_INTERNAL_SOURCE."SOURCE_FILE","LOAD_BATCH_ID" = DBT_INTERNAL_SOURCE."LOAD_BATCH_ID","LOAD_TS" = DBT_INTERNAL_SOURCE."LOAD_TS"
    

    when not matched then insert
        ("VEHICLE_KEY", "MAKE", "MODEL", "YEAR", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")
    values
        ("VEHICLE_KEY", "MAKE", "MODEL", "YEAR", "SOURCE_SALE_KEY", "SOURCE_FILE", "LOAD_BATCH_ID", "LOAD_TS")

;
    commit;