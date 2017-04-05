USE [pv42]
GO
/****** Object:  StoredProcedure [dbo].[getatmstatus]    Script Date: 4/4/2017 11:37:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[getatmstatus] @hier varchar(5)

AS
declare @devicetotal int;
declare @normal table (deviceid char(16));
declare @sleep table (deviceid char(16));

declare @blg table(deviceid char(16));
declare @comm table (deviceid char(16));
declare @switchedoff table(deviceid char(16));
declare @forcemajeure table (deviceid char(16));

declare @zerobalance table (deviceid char(16));

declare @maintenance table (deviceid char(16));

declare @infrastructure table (deviceid char(16));
declare @electricity table (deviceid char(16));

declare @outofcash1 table (deviceid char (16));
declare @supplyout table (deviceid char (16));
declare @outofcash2 table (deviceid char (16));

declare @hardware1 table (deviceid char (16));
declare @hardware2 table (deviceid char (16));

declare @restock table (deviceid char (16));
declare @flm table (deviceid char(16));
declare @cadangan table (deviceid char(16));

-- note inservice wug 0 and priority 0
--BLG wug 1


insert into @blg 
SELECT deviceid from componentstate c join atmmon a on (c.deviceid=a.IR_ATMID) where
componentid = 32 and compstate = 1 and (IR_LINESTAT = 'DOWN' or IR_ATMSTAT = 'CLOSE')

--COMMUNICATION wug 8
insert into @comm
SELECT deviceid from componentstate where componentid = 21 and compstate = 1 and deviceid not in (select deviceid from @blg)

--Relokasi / reposisi INACTIVE SWITCHED OFF wug 10
insert into @switchedoff
SELECT deviceid from componentstate c join atmmon a on (c.deviceid=a.IR_ATMID) where
componentid = 31 and compstate = 1 and (IR_LINESTAT = 'DOWN') and deviceid not in (select deviceid from @comm UNION select deviceid from @blg)

--Force Majeure wug 11 and 12
insert into @forcemajeure
SELECT deviceid from componentstate c join atmmon a on (c.deviceid=a.IR_ATMID) where
componentid = 37 and compstate = 1 and (IR_LINESTAT = 'DOWN') and deviceid not in (select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg
)

insert into @zerobalance
SELECT deviceid from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join atmmon a on (a.IR_ATMID = b.id) 
where c.componentid = 30 and compstate = 1 and (IR_LINESTAT = 'DOWN' or IR_ATMSTAT = 'CLOSE') and IR_CASHOUT = 0 and IR_ENDCASH = 0
and profilmesin = 'ATM' and deviceid not in (select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)
UNION
SELECT deviceid from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join atmmon a on (a.IR_ATMID = b.id) 
where c.componentid = 30 and compstate = 1 and (IR_LINESTAT = 'UP' and IR_ATMSTAT = 'OPEN') and IR_CASHOUT = 0 and IR_ENDCASH = 0
and profilmesin = 'ATM' and deviceid not in (select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)


--Undermaintenance wug 22 ATM 1
insert into @maintenance
SELECT b.id from bniviewbasedata b join dayfail d on (b.id = d.deviceid) join atmmon a on 
(b.id = a.IR_ATMID) join componentstate c on (b.id = c.deviceid) where c.componentid = 16 and c.compstate=1 and DATEDIFF(second,started,GETDATE()) > 15 
and profilmesin = 'ATM' and  IR_CASHOUT >0 and c.deviceid not in (select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)
UNION
SELECT b.id from bniviewbasedata b join dayfail d on (b.id = d.deviceid) join atmmon a on 
(b.id = a.IR_ATMID) join componentstate c on (b.id = c.deviceid) where 
c.componentid = 16 and c.compstate = 1 and DATEDIFF(second,started,GETDATE()) <= 15 and profilmesin = 'CDM' and IR_CASHOUT = 0 and IR_ENDCASH = 0 and 
c.deviceid not in (select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)
UNION
select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join 
dayfail d on (b.id = d.deviceid) join atmmon a on (b.id = a.IR_ATMID) where b.profilmesin = 'CDM' and c.componentid = 16 and c.compstate = 1
and DATEDIFF(second,started,GETDATE()) > 15 and IR_CASHOUT=0 and IR_ENDCASH = 0 and c.deviceid not in (select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)
UNION
select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) where 
profilmesin <> 'ATM' and
c.componentid = 16 and c.compstate = 1 and deviceid not in (select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--infrastructure wug 13
insert into @infrastructure
select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join atmmon a on (b.id = a.IR_ATMID)
where c.compstate = 29 and c.compstate = 1 and IR_LINESTAT = 'DOWN' and deviceid not in (select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--Electricity wug 14
insert into @electricity
select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join atmmon a on (b.id = a.IR_ATMID)
where c.compstate = 34 and c.compstate = 1 and IR_LINESTAT = 'DOWN' and deviceid not in (select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--Out of cash 1 wug 3
insert into @outofcash1
select b.id from bniviewbasedata b join atmmon a on (b.id = a.IR_ATMID)
where (IR_FAULT01 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT02 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT03 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT04 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT05 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT06 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT07 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT08 = 'TYPE 1 CURRENCY CASSETTE OUT' ) and IR_CASHOUT > 0 and IR_ENDCASH >0 and b.id not in (select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)


--Supply out wug 5
insert into @supplyout
select deviceid from componentstate where componentid = 26 and compstate = 1 and deviceid not in (select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--Out of cash 2 wug 3
insert into @outofcash2
select b.id from bniviewbasedata b join atmmon a on (b.id = a.IR_ATMID)
where (IR_FAULT01 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT02 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT03 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT04 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT05 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT06 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT07 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT08 = 'CASSETTE TYPE 1 FATAL ERROR' ) and (cast(IR_ENDCASH as int)/(cast(IR_ENDCASH as INT)+cast(IR_CASHOUT as INT)))<0.25 and IR_CASHOUT > 0 and IR_ENDCASH >0 and b.id not in (select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)


--Hardware 1 wug 4
insert into @hardware1
select b.id from bniviewbasedata b join atmmon a on (b.id = a.IR_ATMID)
where (IR_FAULT01 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT02 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT03 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT04 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT05 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT06 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT07 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT08 = 'CASSETTE TYPE 1 FATAL ERROR' ) and (cast(IR_ENDCASH as int)/(cast(IR_ENDCASH as INT)+cast(IR_CASHOUT as INT)))>=0.25  and id not in (select deviceid from @outofcash2 UNION select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--hardware 2 wug 4
insert into @hardware2
select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid)
where c.componentid in (1,3,4,6) and compstate = 1 and deviceid not in (select deviceid from @hardware1 UNION select deviceid from @outofcash2 UNION select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--restock 1 and 2 wug 6
insert into @restock
select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join
atmmon a on (b.id = a.IR_ATMID) where c.componentid = 16 and c.compstate = 1 and (IR_LINESTAT = 'UP' and IR_ATMSTAT = 'CLOSE') and 
IR_CASHOUT = 0 and IR_ENDCASH >0 and profilmesin = 'ATM' and deviceid not in (select deviceid from @hardware2 UNION select deviceid from @hardware1 UNION select deviceid from @outofcash2 UNION select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--FLM
insert into @flm
select deviceid from componentstate where componentid = 15 and compstate = 1 and deviceid not in (select deviceid from @restock UNION select deviceid from @hardware2 UNION select deviceid from @hardware1 UNION select deviceid from @outofcash2 UNION select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--Cadangan
insert into @cadangan
select deviceid from componentstate where componentid = 33 and compstate = 1 and deviceid not in (select deviceid from @flm UNION select deviceid from @restock UNION select deviceid from @hardware2 UNION select deviceid from @hardware1 UNION select deviceid from @outofcash2 UNION select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
UNION select deviceid from 
@comm UNION select deviceid from @blg)

--normal
insert into @normal 
select deviceid
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (15 ) and compstate=
0 and c.deviceid not in (
select DISTINCT deviceid from state where devicestate in(33280,512)
UNION
SELECT DISTINCT deviceid from componentstate where componentid in(21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1
UNION
SELECT b.id from bniviewbasedata b join dayfail d on (b.id = d.deviceid) join componentstate c 
on (b.id = c.deviceid) where c.componentid = 16 and c.compstate = 1 and DATEDIFF(second,started,GETDATE()) <= 15 and profilmesin = 'ATM' 
and c.deviceid not in (select deviceid from @forcemajeure)
UNION
select deviceid from @outofcash1
UNION 
select deviceid from @outofcash2
UNION 
select deviceid from @hardware1
)

--sleep
insert into @sleep
select deviceid
from state c join bniviewbasedata b on (c.deviceid = b.id) 
where devicestate in(33280,512) and deviceid not in
(SELECT DISTINCT deviceid from componentstate where componentid in(21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1
UNION
select deviceid from @outofcash1
UNION 
select deviceid from @outofcash2
UNION 
select deviceid from @hardware1
)
order by deviceid 


Declare @blgtotal int
Declare @commtotal int
Declare @switchedofftotal int
Declare @forcemajeuretotal int
Declare @zerobalancetotal int 
Declare @maintenancetotal int
Declare @infrastructuretotal int 
Declare @electricitytotal int 
Declare @outofcash1total int
Declare @supplyouttotal int 
Declare @outofcash2total int
Declare @hardware1total int
Declare @hardware2total int
Declare @restocktotal int
Declare @flmtotal int
Declare @cadangantotal int 
Declare @normaltotal int
Declare @sleeptotal int 
IF(@hier = 'ALL')
BEGIN
SET @devicetotal = (select COUNT(deviceid) from device)-1;
SET @blgtotal = (select count(deviceid) from @blg)
SET @commtotal = (select count(deviceid) from @comm)
SET @switchedofftotal = (select count(deviceid) from @switchedoff )
SET @forcemajeuretotal = (select count(deviceid) from @forcemajeure)
SET @zerobalancetotal = (select count(deviceid) from @zerobalance)
SET @maintenancetotal = (select count(deviceid) from @maintenance)
SET @infrastructuretotal = (select count(deviceid) from @infrastructure)
SET @electricitytotal = (select count(deviceid) from @electricity)
SET @outofcash1total = (select count(deviceid) from @outofcash1)
SET @supplyouttotal = (select count(deviceid) from @supplyout)
SET @outofcash2total = (select count(deviceid) from @outofcash2)
SET @hardware1total = (select count(deviceid) from @hardware1)
SET @hardware2total = (select count(deviceid) from @hardware2)
SET @restocktotal = (select count (deviceid) from @restock)
SET @flmtotal = (select count (deviceid) from @flm)
SET @cadangantotal = (select count(deviceid) from @cadangan)
SET @normaltotal = (select count(deviceid) from @normal)
SET @sleeptotal = (select count (deviceid) from @sleep)
END
ELSE
BEGIN
SET @devicetotal = (select count (a.deviceid) from device a join devicehierarchy b on (a.deviceid = b.deviceid) where hierlongname = @hier);
SET @blgtotal = (select count(a.deviceid) from @blg a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @commtotal = (select count(a.deviceid) from @comm a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @switchedofftotal = (select count(a.deviceid) from @switchedoff a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @forcemajeuretotal = (select count(a.deviceid) from @forcemajeure a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @zerobalancetotal = (select count(a.deviceid) from @zerobalance a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @maintenancetotal = (select count(a.deviceid) from @maintenance a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @infrastructuretotal = (select count(a.deviceid) from @infrastructure a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @electricitytotal = (select count(a.deviceid) from @electricity a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @outofcash1total = (select count(a.deviceid) from @outofcash1 a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @supplyouttotal = (select count(a.deviceid) from @supplyout a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @outofcash2total = (select count(a.deviceid) from @outofcash2 a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @hardware1total = (select count(a.deviceid) from @hardware1 a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @hardware2total = (select count(a.deviceid) from @hardware2 a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @restocktotal = (select count (a.deviceid) from @restock a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @flmtotal = (select count (a.deviceid) from @flm a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @cadangantotal = (select count(a.deviceid) from @cadangan a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @normaltotal = (select count(a.deviceid) from @normal a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
SET @sleeptotal = (select count (a.deviceid) from @sleep a join devicehierarchy d on (a.deviceid=d.deviceid) where hierlongname = @hier)
END
Declare @inservice int 
SET @inservice = (@normaltotal + @sleeptotal)
Declare @inprogress int 
SET @inprogress = (@maintenancetotal + @restocktotal)
Declare @outofservice int 
SET @outofservice = (@commtotal + @zerobalancetotal  
+ @inprogress + @outofcash1total + @outofcash2total + @hardware1total + @hardware2total
+ @flmtotal + @infrastructuretotal + @electricitytotal)
Declare @inactive int 
SET @inactive = (@switchedofftotal + @blgtotal + @forcemajeuretotal + @cadangantotal)


select @devicetotal as devicetotal, @inservice as inservice, @sleeptotal as sleep, @normaltotal as normal, @outofservice as outofservice, @inprogress as inprogress,
@maintenancetotal as maintenance, @restocktotal as restock, @outofcash1total+@outofcash2total as outofcash, @hardware1total+@hardware2total as hardware, @flmtotal as flm, @commtotal as comm, @infrastructuretotal as infrastructure,
@electricitytotal as electricity, @zerobalancetotal as zerobalance, @inactive as inactive, @switchedofftotal as switchedoff, @blgtotal as blg, @cadangantotal as cadangan, @forcemajeuretotal as forcemajeure
