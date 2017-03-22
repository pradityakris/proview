USE [pv42]
GO
/****** Object:  UserDefinedFunction [dbo].[TerminalDetail]    Script Date: 3/14/2017 10:53:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TerminalDetail2]
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
ELSE IF (@param_comp='inprogress') 
BEGIN
INSERT INTO @componentid values (16)
INSERT INTO @componentid values (27)
INSERT INTO @compstate values(1)
END
ELSE IF (@param_comp='outofservice') 
BEGIN
INSERT INTO @componentid values (16)
INSERT INTO @componentid values (27)
INSERT INTO @componentid values (15)
INSERT INTO @componentid values (3)
INSERT INTO @componentid values (6)
INSERT INTO @componentid values (21)
INSERT INTO @componentid values (20)
INSERT INTO @componentid values (29)
INSERT INTO @componentid values (34)
INSERT INTO @componentid values (30)
INSERT INTO @compstate values(1)
END
ELSE IF (@param_comp='inactive') 
BEGIN
INSERT INTO @componentid values (31)
INSERT INTO @componentid values (32)
INSERT INTO @componentid values (33)
INSERT INTO @componentid values (30)
INSERT INTO @compstate values(1)
END

INSERT INTO @results


select DISTINCT deviceid, lokasi, wilayah, cabang, vendor, flm
from componentstate c join bniviewbasedata b on (c.deviceid = b.id) where componentid in (select value from @componentid) 
and compstate in (select value from @compstate)
order by deviceid

RETURN;

END