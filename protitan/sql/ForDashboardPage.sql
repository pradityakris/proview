USE [pv42]
GO
/****** Object:  StoredProcedure [dbo].[GetDataForDashboardBox]    Script Date: 3/10/2017 5:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetDataForDashboardBox]
AS
 
--In service 
declare @devicetotal int
declare @inservice int
declare @normal int
declare @sleep int

--Out of Service
declare @outofservice int
declare @outofserviceignore int
declare @inprogress int
declare @maintenance int
declare @restock int
declare @outofcash int
declare @hardware int
declare @flm int
declare @comm int
declare @infrastructure int
declare @electricity int
declare @zerobalance int

--Inactive
declare @inactive int
declare @switchedoff int
declare @blg int
declare @cadangan int
declare @forcemajeure int

set @switchedoff = (select COUNT(deviceid) from componentstate where componentid = 31 and compstate=1);
set @blg = (select COUNT(deviceid) from componentstate where componentid = 32 and compstate=1);
set @cadangan = (select COUNT(deviceid) from componentstate where componentid = 33 and compstate=1);
set @forcemajeure = (select COUNT(deviceid) from componentstate where componentid = 37 and compstate=1);
set @inactive = (SELECT COUNT(DISTINCT deviceid) from componentstate where componentid in(31,32,33,37) and compstate = 1);

set @devicetotal = (select COUNT(deviceid) from device)-1;
set @sleep = (select COUNT(deviceid) from state where devicestate = 33280 and deviceid not in (SELECT DISTINCT deviceid from componentstate where componentid in(31,32,33,37) and compstate = 1));
set @normal = ((select COUNT(deviceid) from componentstate where componentid = 15 and compstate=0)-@sleep)-@inactive;
set @inservice = @sleep + @normal;

set @maintenance = (select COUNT(deviceid) from componentstate where componentid = 16 and compstate=1);
set @restock = (select COUNT(deviceid) from componentstate where componentid = 27 and compstate=1);
set @inprogress = @maintenance + @restock;
set @outofcash = (select COUNT(deviceid) from componentstate where componentid = 20 and compstate=1);
set @hardware = (select COUNT(DISTINCT deviceid) from componentstate where componentid in (1,3,4,6) and compstate=1);
set @flm = (select COUNT(deviceid) from componentstate where componentid = 15 and compstate=1);
set @comm = (select COUNT(deviceid) from componentstate where componentid = 21 and compstate=1);
set @infrastructure = (select COUNT(deviceid) from componentstate where componentid = 29 and compstate=1);
set @electricity = (select COUNT(deviceid) from componentstate where componentid = 34 and compstate=1);
set @zerobalance = (select COUNT(deviceid) from componentstate where componentid = 30 and compstate=1);

set @outofservice = (SELECT COUNT(DISTINCT deviceid) from componentstate where componentid in(16,27,20,1,3,4,6,15,21,29,34,30) and compstate = 1);


select @devicetotal as devicetotal, @inservice as inservice, @sleep as sleep, @normal as normal, @outofservice as outofservice, @inprogress as inprogress,
@maintenance as maintenance, @restock as restock, @outofcash as outofcash, @hardware as hardware, @flm as flm, @comm as comm, @infrastructure as infrastructure,
@electricity as electricity, @zerobalance as zerobalance, @inactive as inactive, @switchedoff as switchedoff, @blg as blg, @cadangan as cadangan, @forcemajeure as forcemajeure

--exec GetDataForDashboardBox