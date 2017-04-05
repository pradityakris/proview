USE [pv42]
GO
/****** Object:  StoredProcedure [dbo].[GetDataForDashboardBox]    Script Date: 4/3/2017 11:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetDataForDashboardBox] @hier varchar(5)
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
declare @flmsupply int
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

IF(@hier = 'ALL')
BEGIN
set @switchedoff = (select COUNT(deviceid) from componentstate where componentid = 31 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 31)));

set @blg = (select COUNT(deviceid) from componentstate where componentid = 32 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 32)));

set @cadangan = (select COUNT(deviceid) from componentstate where componentid = 33 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 33)));

set @forcemajeure = (select COUNT(deviceid) from componentstate where componentid = 37 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 37)));

set @inactive = @switchedoff+@blg+@cadangan+@forcemajeure;

set @maintenance = (select COUNT(deviceid) from componentstate where componentid = 16 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 16))
);
set @restock = (select COUNT(deviceid) from componentstate where componentid = 27 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 27)));

set @inprogress = @maintenance + @restock;

set @outofcash = (select COUNT(deviceid) from componentstate where componentid = 20 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 20)));

set @hardware = (select COUNT(DISTINCT deviceid) from componentstate where componentid in (1,3,4,6) and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and compstate = 1 and cp.priority<(select DISTINCT priority from componentpriority where componentid in (1,3,4,6))));

set @flmsupply = (select COUNT(deviceid) from componentstate where componentid = 17 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 17)));

set @flm = (select COUNT(deviceid) from componentstate where componentid = 15 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 15)))+@flmsupply;

set @comm = (select COUNT(deviceid) from componentstate where componentid = 21 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 21)));

set @infrastructure = (select COUNT(deviceid) from componentstate where componentid = 29 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 29)));

set @electricity = (select COUNT(deviceid) from componentstate where componentid = 34 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 34)));

set @zerobalance = (select COUNT(deviceid) from componentstate where componentid = 30 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 16)));

set @outofservice = @inprogress + @outofcash + @hardware + @restock + @flm + @comm + @infrastructure + @electricity + @zerobalance;

set @devicetotal = (select COUNT(deviceid) from device)-1;
set @sleep = (select COUNT(deviceid) from state where devicestate in(33280,512) and deviceid not in (SELECT DISTINCT deviceid from componentstate where componentid in(21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1));
set @normal = @devicetotal-@sleep-@inactive-@outofservice;
set @inservice = @sleep + @normal;
END
ELSE 
BEGIN
set @switchedoff = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 31 and compstate=1 and 
c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 31)));

set @blg = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 32 and compstate=1 and 
c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 32)));

set @cadangan = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 33 and compstate=1 and 
c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 33)));

set @forcemajeure = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 37 and compstate=1 and 
c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 37)));

set @inactive = @switchedoff+@blg+@cadangan+@forcemajeure;

set @maintenance = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 16 and compstate=1
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 16))
);
set @restock = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 27 and compstate=1
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 27)));

set @inprogress = @maintenance + @restock;

set @outofcash = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 20 and compstate=1
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 20)));

set @hardware = (select COUNT(DISTINCT c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid in (1,3,4,6) and compstate=1 
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and compstate = 1 and cp.priority<(select DISTINCT priority from componentpriority where componentid in (1,3,4,6))));

set @flmsupply = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 17 and compstate=1
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 17)));

set @flm = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 15 and compstate=1
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 15)))+@flmsupply;

set @comm = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 21 and compstate=1 
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 21)));

set @infrastructure = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 29 and compstate=1 
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 29)));

set @electricity = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 34 and compstate=1 
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 34)));

set @zerobalance = (select COUNT(c.deviceid) from componentstate c join devicehierarchy d on (c.deviceid = d.deviceid) where hierlongname = @hier and componentid = 30 and compstate=1 
and c.deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 16)));

set @outofservice = @inprogress + @outofcash + @hardware + @restock + @flm + @comm + @infrastructure + @electricity + @zerobalance;

set @devicetotal = (select COUNT(deviceid) from device)-1;
set @sleep = (select COUNT(deviceid) from state where devicestate in(33280,512) and deviceid not in (SELECT DISTINCT deviceid from componentstate where componentid in(21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1));
set @normal = @devicetotal-@sleep-@inactive-@outofservice;
set @inservice = @sleep + @normal;
END

select @devicetotal as devicetotal, @inservice as inservice, @sleep as sleep, @normal as normal, @outofservice as outofservice, @inprogress as inprogress,
@maintenance as maintenance, @restock as restock, @outofcash as outofcash, @hardware as hardware, @flm as flm, @comm as comm, @infrastructure as infrastructure,
@electricity as electricity, @zerobalance as zerobalance, @inactive as inactive, @switchedoff as switchedoff, @blg as blg, @cadangan as cadangan, @forcemajeure as forcemajeure

--exec GetDataForDashboardBox