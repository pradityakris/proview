package com.dn.protitan.dao;

import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("TransactionFreqDao")
public class TxnFreqSumDao {
	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<TxnFreqSummary> getData(String startDate, String endDate) {
		
			String sqlStatement="SELECT * FROM TxnFreqSummary('"+startDate+"',"+"'"+endDate+"')";
		return jdbc.query(sqlStatement, new RowMapper<TxnFreqSummary>() {

			@Override
			public TxnFreqSummary mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				TxnFreqSummary TransactionFreqSum = new TxnFreqSummary();
				
				DecimalFormat df = new DecimalFormat("#");
				df.setRoundingMode(RoundingMode.CEILING);
				
				Double PaymentFreq = rs.getDouble("PaymentFreq");
				Double TransferFreq = rs.getDouble("TransferFreq");
				double INQUIRYtFreq = rs.getDouble("InquiryFreq");
				double WithdrawalFreq = rs.getDouble("WithdrawalFreq");
				double TapcashFreq = rs.getDouble("TapCashFreq");
				double DPSTFrequency = rs.getDouble("DepositFreq");					
				
				TransactionFreqSum.setPaymentFreq(df.format(PaymentFreq));
				TransactionFreqSum.setTransferFreq(df.format(TransferFreq));
				TransactionFreqSum.setWithdrawalFreq(df.format(WithdrawalFreq));
				TransactionFreqSum.setINQUIRYtFreq(df.format(INQUIRYtFreq));
				TransactionFreqSum.setTapcashFreq(df.format(TapcashFreq));
				TransactionFreqSum.setDPSTFrequency(df.format(DPSTFrequency));
				TransactionFreqSum.setStartDate(rs.getString("StartDate"));
				TransactionFreqSum.setEndDate(rs.getString("EndDate"));
				
				return TransactionFreqSum;
			}

		});
	}

}
