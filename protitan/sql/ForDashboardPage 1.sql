USE [pv42]
GO
/****** Object:  UserDefinedFunction [dbo].[TerminalDetail]    Script Date: 3/14/2017 10:53:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TerminalDetail]
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
where devicestate = 33280 and deviceid not in(SELECT DISTINCT deviceid from componentstate where componentid in(31,32,33,37) and compstate = 1)
order by deviceid
END
ELSE IF (@param_comp='normal') 
BEGIN
INSERT INTO @results
select deviceid,null, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (select value from @componentid ) and compstate=
@compstate and deviceid not in (
select DISTINCT deviceid from state where devicestate = 33280
UNION
SELECT DISTINCT deviceid from componentstate where componentid in(31,32,33,37) and compstate = 1
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
1 and m.texttype = 7
order by deviceid
END
ELSE
BEGIN
INSERT INTO @results
select DISTINCT deviceid,null, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) 
where componentid in (select value from @componentid ) and compstate=
@compstate
order by deviceid
END
RETURN;

END