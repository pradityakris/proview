USE [pv42]
GO
/****** Object:  UserDefinedFunction [dbo].[TerminalDetail2]    Script Date: 3/29/2017 10:22:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[TerminalDetail2]
(	
	@param_comp VARCHAR(20)
)
RETURNS @results TABLE(
deviceid varchar(20), 
lokasi varchar(20), 
wilayah varchar(20), 
cabang varchar(20), 
vendor varchar(20),
flm varchar(20)
)
AS
BEGIN
declare @componentid TABLE (Value int)
declare @compstate TABLE (Value int)

IF (@param_comp='inservice') 
BEGIN
INSERT INTO @componentid values (15)
INSERT INTO @compstate values(0)
END
IF(@param_comp='inservice')
BEGIN
INSERT INTO @results
select DISTINCT deviceid, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) where componentid in (select value from @componentid) 
and deviceid not in(SELECT deviceid from componentstate where componentid in (21,30,16,29,34,15,20,17,1,3,4,6,27,31,32,33,37) and compstate = 1) and compstate in (select value from @compstate)
order by deviceid
END
ELSE IF(@param_comp='inactive')
BEGIN
INSERT INTO @results
select DISTINCT deviceid, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) where deviceid in(
(select deviceid from componentstate where componentid = 31 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 31)))
UNION
(select deviceid from componentstate where componentid = 32 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 32)))
UNION
(select deviceid from componentstate where componentid = 33 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 33)))
UNION
(select deviceid from componentstate where componentid = 37 and compstate=1 and 
deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 37)))
)
order by deviceid
END
ELSE IF(@param_comp='outofservice')
BEGIN
INSERT INTO @results
select DISTINCT deviceid, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) where deviceid in(
(select deviceid from componentstate where componentid = 16 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 16))
)
UNION
(select deviceid from componentstate where componentid = 27 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 27)))
UNION
(select deviceid from componentstate where componentid = 20 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 20)))
UNION
(select DISTINCT deviceid from componentstate where componentid in (1,3,4,6) and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and compstate = 1 and cp.priority<(select DISTINCT priority from componentpriority where componentid in (1,3,4,6))))
UNION
(select (deviceid) from componentstate where componentid = 17 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 17)))
UNION
(select (deviceid) from componentstate where componentid = 15 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 15)))
UNION
(select (deviceid) from componentstate where componentid = 21 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 21)))
UNION
(select (deviceid) from componentstate where componentid = 29 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 29)))
UNION
(select (deviceid) from componentstate where componentid = 34 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 34)))
UNION
(select (deviceid) from componentstate where componentid = 30 and compstate=1 
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 30)))
)
order by deviceid
END
ELSE IF(@param_comp='inprogress')
BEGIN
INSERT INTO @results
select DISTINCT deviceid, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) where deviceid in(
(select deviceid from componentstate where componentid = 16 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 16))
)
UNION
(select deviceid from componentstate where componentid = 27 and compstate=1
and deviceid not in(select deviceid from componentstate cs join componentpriority cp on (cs.componentid=cp.componentid) 
where compstate = 1 and cp.priority<(select priority from componentpriority where componentid = 27)))
)
order by deviceid
END
ELSE
BEGIN
INSERT INTO @results
select DISTINCT deviceid, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) where componentid in (select value from @componentid) 
and compstate in (select value from @compstate)
order by deviceid
END
RETURN;

END