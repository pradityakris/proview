USE [pv42]
GO
/****** Object:  UserDefinedFunction [dbo].[TerminalDetail]    Script Date: 3/29/2017 10:04:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[TerminalDetail]
(	
	@param_comp VARCHAR(20)
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

declare @componentid TABLE (Value int)
declare @compstate INT

set @compstate = 1;
IF (@param_comp='normal') 
BEGIN
INSERT INTO @componentid values (15)
set @compstate = 0;
END
ELSE IF (@param_comp='maintenance') 
BEGIN
INSERT INTO @componentid values (16)
END
ELSE IF (@param_comp='restock') 
BEGIN
INSERT INTO @componentid values (27)
END
ELSE IF (@param_comp='outofcash') 
BEGIN
INSERT INTO @componentid values (20)
END
ELSE IF (@param_comp='flm') 
BEGIN
INSERT INTO @componentid values (15)
INSERT INTO @componentid values (17)
END
ELSE IF (@param_comp='comm') 
BEGIN
INSERT INTO @componentid values (21)
END
ELSE IF (@param_comp='infrastructure') 
BEGIN
INSERT INTO @componentid values (29)
END
ELSE IF (@param_comp='electricity') 
BEGIN
INSERT INTO @componentid values (34)
END
ELSE IF (@param_comp='zerobalance') 
BEGIN
INSERT INTO @componentid values (30)
END
ELSE IF (@param_comp='switchedoff') 
BEGIN
INSERT INTO @componentid values (31)
END
ELSE IF (@param_comp='blg') 
BEGIN
INSERT INTO @componentid values (32)
END
ELSE IF (@param_comp='cadangan') 
BEGIN
INSERT INTO @componentid values (33)
END
ELSE IF (@param_comp='forcemajeure') 
BEGIN
INSERT INTO @componentid values (1)
END

IF (@param_comp='sleep') 
BEGIN 
INSERT INTO @results
select deviceid,null, lokasi, wilayah, cabang, vendor, flm
from state c join bniviewbasedata b on (c.deviceid = b.id) 
where devicestate in(33280,512) and deviceid not in
(SELECT DISTINCT deviceid from componentstate where componentid in(21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1)
order by deviceid
END
ELSE IF (@param_comp='normal') 
BEGIN
INSERT INTO @results
select deviceid,null, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (select value from @componentid ) and compstate=
@compstate and deviceid not in (
select DISTINCT deviceid from state where devicestate in(33280,512)
UNION
SELECT DISTINCT deviceid from componentstate where componentid in(21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1
) 
order by deviceid
END
ELSE IF (@param_comp='hardware')
BEGIN
INSERT INTO @results
select c.deviceid,messagetext, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
join component co on (c.componentid = co.componentid) join message0001 m 
on (co.textno = m.textno)
where c.componentid in (1,3,4,6) and compstate=
1 and m.texttype = 7 and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select DISTINCT priority from componentpriority where componentid in (1,3,4,6)))
order by deviceid
END
ELSE IF(@param_comp = 'flm')
BEGIN
INSERT INTO @results
select DISTINCT deviceid,null, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (15) and compstate=
1 and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid in(15)))
UNION
select DISTINCT deviceid,null, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (17) and compstate=
1 and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid in(17)))
END
ELSE
BEGIN
INSERT INTO @results
select DISTINCT deviceid,null, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (select value from @componentid ) and compstate=
@compstate and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid in( select value from @componentid )))
order by deviceid
END 
RETURN;

END