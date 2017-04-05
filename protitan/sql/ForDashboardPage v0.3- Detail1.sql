USE [pv42]
GO
/****** Object:  UserDefinedFunction [dbo].[problemdetail]    Script Date: 3/31/2017 10:41:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[problemdetail] 
(	
	@param_comp VARCHAR(20),
	@hier varchar(5)
)
RETURNS @results TABLE(
deviceid varchar(20), 
hardware varchar(20),
lokasi varchar(20), 
wilayah varchar(20), 
cabang varchar(20), 
vendor varchar(20),
flm varchar(20)
)
AS
BEGIN
--Declare table
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
and profilmesin = 'ATM' and IR_CASHOUT >0 and c.deviceid not in (select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
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
IR_FAULT08 = 'CASSETTE TYPE 1 FATAL ERROR' ) and IR_HOP1CASH <= 0 and IR_CASHOUT > 0 and IR_ENDCASH >0 and b.id not in (select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
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
IR_FAULT08 = 'CASSETTE TYPE 1 FATAL ERROR' ) and IR_HOP1CASH > 0  and id not in (select deviceid from @outofcash2 UNION select deviceid from @supplyout UNION select deviceid from @outofcash1 UNION select deviceid from @electricity UNION select deviceid from @infrastructure UNION select deviceid from @maintenance UNION select deviceid from @zerobalance UNION select deviceid from @forcemajeure UNION select deviceid from @switchedoff 
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

IF(@hier = 'ALL')
BEGIN
IF (@param_comp='normal') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @normal n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='sleep') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @sleep n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='maintenance') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @maintenance n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='restock') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @restock n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='outofcash') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @outofcash1 n join bniviewbasedata b on (n.deviceid = b.id)
UNION
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @outofcash2 n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='hardware') 
BEGIN
INSERT INTO @results
Select deviceid,'Cash Dispenser', lokasi, wilayah, cabang, vendor, flm 
from @hardware1 n join bniviewbasedata b on (n.deviceid = b.id)
UNION
Select n.deviceid,messagetext, lokasi, wilayah, cabang, vendor, flm 
from @hardware2 n join bniviewbasedata b on (n.deviceid = b.id) join 
componentstate c on (n.deviceid = c.deviceid) join component co on 
(co.componentid = c.componentid) join message0001 m on (co.textno = m.textno)
where m.texttype = 7 and compstate = 1
END
ELSE IF (@param_comp='flm') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @flm n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='comm') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @comm n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='infrastructure') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @infrastructure n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='electricity') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @electricity n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='zerobalance') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @zerobalance n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='switchedoff') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @switchedoff n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='blg') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @blg n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='cadangan') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @cadangan n join bniviewbasedata b on (n.deviceid = b.id)
END
ELSE IF (@param_comp='forcemajeure') 
BEGIN
INSERT INTO @results
Select deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @forcemajeure n join bniviewbasedata b on (n.deviceid = b.id)
END
END
ELSE
BEGIN
IF (@param_comp='normal') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @normal n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='sleep') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @sleep n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='maintenance') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @maintenance n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='restock') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @restock n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='outofcash') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @outofcash1 n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
UNION
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @outofcash2 n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='hardware') 
BEGIN
INSERT INTO @results
Select n.deviceid,'Cash Dispenser', lokasi, wilayah, cabang, vendor, flm 
from @hardware1 n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
UNION
Select n.deviceid,messagetext, lokasi, wilayah, cabang, vendor, flm 
from @hardware2 n join bniviewbasedata b on (n.deviceid = b.id) 
join devicehierarchy d on (n.deviceid=d.deviceid) join 
componentstate c on (n.deviceid = c.deviceid) join component co on 
(co.componentid = c.componentid) join message0001 m on (co.textno = m.textno)
where m.texttype = 7 and compstate = 1 and hierlongname = @hier
END
ELSE IF (@param_comp='flm') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @flm n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='comm') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @comm n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='infrastructure') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @infrastructure n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='electricity') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @electricity n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='zerobalance') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @zerobalance n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='switchedoff') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @switchedoff n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='blg') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @blg n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='cadangan') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @cadangan n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
ELSE IF (@param_comp='forcemajeure') 
BEGIN
INSERT INTO @results
Select n.deviceid,null, lokasi, wilayah, cabang, vendor, flm 
from @forcemajeure n join bniviewbasedata b on (n.deviceid = b.id)
join devicehierarchy d on (n.deviceid=d.deviceid) 
where hierlongname = @hier
END
END
RETURN;

END