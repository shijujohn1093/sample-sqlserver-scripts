-----------------------------------
--      Testing                 ---
-----------------------------------
-- >> Test 1
DECLARE @name varchar(25)
DECLARE @trackInfo varchar(50)

SET @name = 'Good Toys';
SET @trackInfo = null;

exec dbo.GetOrderTrackingForCustomer @name, @trackInfo OUTPUT
select 'Test 1', @trackInfo


-- >> Test 2
SET @name = 'Broken Toys';
SET @trackInfo = null;

exec dbo.GetOrderTrackingForCustomer @name, @trackInfo OUTPUT
select 'Test 2', @trackInfo
 
