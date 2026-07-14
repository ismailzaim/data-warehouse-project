create or alter procedure bronze.load_bronze as 
BEGIN
	declare @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT 'loading Bronze Layer'
		set @start_time = getdate();
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		from 'C:\Users\ismail\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.CSV'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		;

		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		from 'C:\Users\ismail\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.CSV'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		;

		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		from 'C:\Users\ismail\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.CSV'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		;

		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		from 'C:\Users\ismail\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.CSV'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		;

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		from 'C:\Users\ismail\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.CSV'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		;

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		from 'C:\Users\ismail\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.CSV'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		;
	END TRY
	BEGIN CATCH
	PRINT'ERROR MESSAGE '+ ERROR_MESSAGE();
	END CATCH
END


