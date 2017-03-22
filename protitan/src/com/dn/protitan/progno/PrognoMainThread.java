package com.dn.protitan.progno;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Locale;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;

import com.dn.protitan.dao.Progno;
import com.dn.protitan.servicelayer.PrognoService;

public class PrognoMainThread {

	private PrognoService prognoService;

	@Autowired
	public void setPrognoService(PrognoService prognoService) {
		this.prognoService = prognoService;
	}

	//@Scheduled(fixedRate = 180000)
	public void startProgno() {

		BufferedReader csvBuffer = null;

		Progno progno = new Progno();
		
		DateTimeFormatter dtf =
			    DateTimeFormat.forPattern("dd MMMM yyyy HH:mm:ss").withLocale(Locale.ENGLISH);
		
		int flag=0;

		try {
			String mLine;
			csvBuffer = new BufferedReader(new FileReader("C:\\mantap\\atmmon.csv"));

			prognoService.cleanTableFirst();

			while ((mLine = csvBuffer.readLine()) != null) {
				
				
				if (flag!=0) {
				
					mLine=mLine.replace("\"", "");
				
					String[] finalLine = mLine.split(",");
					
					DateTime d1 = dtf.parseDateTime(finalLine[0].trim());
					String[] dateFromProgno = d1.toDateTime().toString().split("T");
					
					String dateInsert = dateFromProgno[0] + " " +dateFromProgno[1].substring(0, 8);
			
					progno.setIR_TIMESTAMP_String(dateInsert);
					progno.setIR_TIMESTAMP_TimeStamp(finalLine[1].trim());
					progno.setIR_NODE(finalLine[2].trim());
					progno.setIR_INTERVAL(finalLine[3].trim());
					progno.setIR_ATMID(finalLine[4].trim());
					progno.setIR_LINESTAT(finalLine[5].trim());
					progno.setIR_ATMSTAT(finalLine[6].trim());
					progno.setIR_TERMLOC(finalLine[7].trim());
					progno.setIR_HOP1CASH(finalLine[8].trim());
					progno.setIR_HOP2CASH(finalLine[9].trim());
					progno.setIR_HOP3CASH(finalLine[10].trim());
					progno.setIR_HOP4CASH(finalLine[11].trim());
					progno.setIR_ENDCASH(finalLine[12].trim());
					progno.setIR_CASHOUT(finalLine[13].trim());
					progno.setIR_FAULT01(finalLine[14].trim());
					progno.setIR_FAULT02(finalLine[15].trim());
					progno.setIR_FAULT03(finalLine[16].trim());
					progno.setIR_FAULT04(finalLine[17].trim());
					progno.setIR_FAULT05(finalLine[18].trim());
					progno.setIR_FAULT06(finalLine[19].trim());
					progno.setIR_FAULT07(finalLine[20].trim());
					progno.setIR_FAULT08(finalLine[21].trim());
					progno.setIR_REGN(finalLine[22].trim());
					progno.setIR_HOP1BILL(finalLine[23].trim());
					
					prognoService.insertToProgno(progno);
				}
				
				flag=1;
					
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (csvBuffer != null)
					csvBuffer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
