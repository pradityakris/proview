USE [pv42]
GO
/****** Object:  StoredProcedure [dbo].[updatedevicestatus]    Script Date: 3/29/2017 9:45:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatedevicestatus]
AS

declare blg table(deviceid char(16));
declare comm table (deviceid char(16));
declare switchedoff table(deviceid char(16));
declare forcemajeure table (deviceid char(16));

declare zerobalance1 table (deviceid char(16));
declare zerobalance2 table (deviceid char(16));

declare maintenance1 table (deciceid char(16));
declare maintenance2 table (deviceid char(16));
declare maintenance3 table (deviceid char(16));
declare maintenance4 table (deviceid char(16));

declare infrasturucture table (deciceid char(16));
declare electricity table (deviceid char(16));

declare outofcash1 table (deviceid char (16));
declare supplyout table (deviceid char (16));
declare outofcash2 table (deviceid char (16));

declare hardware1 table (deviceid char (16));
declare hardware2 table (deviceid char (16));

declare restock table (deviceid char (16));
declare flm table (deviceid char(16));
declare cadangan table (deciceid char(16));

-- note inservice wug 0 and priority 0
--BLG wug 1
update devicestatus SET status = 1 where deviceid in (SELECT deviceid from componentstate c join atmmon a on (c.deviceid=a.IR_ATMID) where
componentid = 32 and compstate = 1 and (IR_LINESTAT = 'DOWN' or IR_ATMSTAT = 'CLOSE')
)

--COMMUNICATION wug 8
update devicestatus SET status = 8 where deviceid in (SELECT deviceid from componentstate where 
componentid = 21 and compstate = 1)

--Relokasi / reposisi INACTIVE SWITCHED OFF wug 10
update devicestatus SET status = 10 where deviceid in (SELECT deviceid from componentstate c join atmmon a on (c.deviceid=a.IR_ATMID) where
componentid = 31 and compstate = 1 and (IR_LINESTAT = 'DOWN')
)

--Force Majeure wug 11 and 12
update devicestatus SET status = 11 where deviceid in (SELECT deviceid from componentstate c join atmmon a on (c.deviceid=a.IR_ATMID) where
componentid = 37 and compstate = 1 and (IR_LINESTAT = 'DOWN')
)

--Undermaintenance wug 0 (inservice) ATM
updatedevicestatus SET status = 0 where deviceid in (SELECT b.id from bniviewbasedata b join dayfail d on (b.id = d.deviceid) join componentstate c 
on (b.id = c.deviceid) where c.componentid = 16 and c.compstate = 1 and DATEDIFF(second,started,GETDATE()) <= 15 and profilmesin = 'ATM')

--Undermaintenance wug 22 ATM 1
updatedevicestatus SET status = 22 where deviceid in (SELECT b.id from bniviewbasedata b join dayfail d on (b.id = d.deviceid) join atmmon a on 
(b.id = a.IR_ATMID) join componentstate c on (b.id = c.deviceid)
where c.componentid = 16 and c.compstate=1 and DATEDIFF(second,started,GETDATE()) > 15 and profilmesin = 'ATM' and IR_CASHOUT >0)

--Undermaintenance wug 22 CDM 2
updatedevicestatus SET status = 22 where deviceid in (SELECT b.id from bniviewbasedata b join dayfail d on (b.id = d.deviceid) join atmmon a on 
(b.id = a.IR_ATMID) join componentstate on (b.id = c.deviceid) where 
c.componentid = 16 and c.compstate = 1 and DATEDIFF(second,started,GETDATE()) <= 15 and profilmesin = 'CDM' and IR_CASHOUT = 0 and IR_ENDCASH = 0)

--Undermaintenance wug 22 CDM 3
updatedevicestatus SET status = 22 where deviceid in (select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join 
dayfail d on (b.id = d.deviceid) join atmmon a on (b.id = a.IR_ATMID) where b.profilmesin = 'CDM' and c.componentid = 16 and c.compstate = 1
and DATEDIFF(second,started,GETDATE()) > 15 and IR_CASHOUT=0 and IR_ENDCASH = 0)

--Undermaintenance wug 22 selain ATM
updatedevicestatus SET status = 22 where deviceid in (select b.id from bniviewbasedata b join componentstate c (b.id = c.deviceid) where 
profilmesin <> 'ATM' and
c.componentid = 16 and c.compstate = 1)

--infrasturucture wug 13
updatedevicestatus SET status = 13 where deviceid in (select b.id from bniviewbasedata b join componentstate c (b.id = c.deviceid) join atmmon a on (b.id = a.IR_ATMID)
where c.componentstate = 29 and c.compstate = 1 and IR_LINESTAT = 'DOWN')

--Electricity wug 14
updatedevicestatus SET status = 14 where deviceid in (select b.id from bniviewbasedata b join componentstate c (b.id = c.deviceid) join atmmon a on (b.id = a.IR_ATMID)
where c.componentstate = 34 and c.compstate = 1 and IR_LINESTAT = 'DOWN')

--Out of cash 1 wug 3
updatedevicestatus SET status = 3 where deviceid in (select b.id from bniviewbasedata b join atmmon a on (b.id = a.IR_ATMID)
where (IR_FAULT01 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT02 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT03 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT04 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT05 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT06 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT07 = 'TYPE 1 CURRENCY CASSETTE OUT' or
IR_FAULT08 = 'TYPE 1 CURRENCY CASSETTE OUT' ) and IR_CASHOUT > 0 and IR_ENDCASH >0
)

--Supply out wug 5
updatedevicestatus SET status = 5 where deviceid in (select deviceid from componentstate where componentid = 26 and compstate = 1)

--Out of cash 2 wug 3
updatedevicestatus SET status = 3 where deviceid in (select b.id from bniviewbasedata b join atmmon a on (b.id = a.IR_ATMID)
where (IR_FAULT01 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT02 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT03 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT04 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT05 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT06 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT07 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT08 = 'CASSETTE TYPE 1 FATAL ERROR' ) and IR_HOP1CASH <= 25% and IR_CASHOUT > 0 and IR_ENDCASH >0
)

--Hardware 1 wug 4
updatedevicestatus SET status = 4 where deviceid in (select b.id from bniviewbasedata b join atmmon a on (b.id = a.IR_ATMID)
where (IR_FAULT01 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT02 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT03 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT04 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT05 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT06 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT07 = 'CASSETTE TYPE 1 FATAL ERROR' or
IR_FAULT08 = 'CASSETTE TYPE 1 FATAL ERROR' ) and IR_HOP1CASH > 25% )

--hardware 2 wug 4
updatedevicestatus SET status = 4 where deviceid in (select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid)
where c.componentid in (1,3,4,6) and compstate = 1)

--restock 1 and 2 wug 6
updatedevicestatus SET status = 6 where deviceid in (select b.id from bniviewbasedata b join componentstate c on (b.id = c.deviceid) join
atmmon a on (b.id = a.IR_ATMID) where c.componentid = 16 and c.compstate = 1 and (IR_LINESTAT = 'UP' and IR_ATMSTAT = 'CLOSE') and 
IR_CASHOUT = 0 and IR_ENDCASH >0 and profilmesin = 'ATM'
)

--FLM
updatedevicestatus SET status = 29 where deviceid in (select deviceid from componentstate where componentid = 15 and compstate = 1)

--Cadangan
updatedevicestatus SET status = 45 where deviceid in (select deviceid from componentstate where componentid = 33 and compstate = 1)