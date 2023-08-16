USE [AdventureWorks2022]
GO
ALTER PROCEDURE dbo.GetOrderTrackingForCustomer
	@storeName varchar(50),
	@trackingNumber varchar(25) OUTPUT
AS
BEGIN
	-- Declare Variable
	DECLARE @salesOrderId int;

	
	SELECT TOP 1 @salesOrderId = SOH.SalesOrderID
	FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.Customer C ON SOH.CustomerID = C.CustomerID
	INNER JOIN Sales.Store S ON S.BusinessEntityID = C.StoreID
	WHERE 1=1
	AND S.Name = @storeName
	ORDER BY SOH.OrderDate DESC;

	IF @@ROWCOUNT > 1 BEGIN
		SELECT TOP 1 @trackingNumber = SOD.CarrierTrackingNumber
		FROM Sales.SalesOrderDetail SOD
		WHERE 1=1
		AND SOD.SalesOrderDetailID = @salesOrderId 
		AND SOD.CarrierTrackingNumber is not null;
	END
	ELSE BEGIN
		SET @trackingNumber = 'Store Not Found'
	END

	PRINT @storeName + ' Tracking Number '+ @trackingNumber

END


