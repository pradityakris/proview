package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("TxnAmountSumDao")
public class TxnAmountSumDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<TxnAmountSummary> getData(String startDate, String endDate) {

		String sqlStatement = "SELECT * FROM txnamountmonthly WHERE month>='" + startDate + "' AND month<='" + endDate + "'";
		return jdbc.query(sqlStatement, new RowMapper<TxnAmountSummary>() {

			@Override
			public TxnAmountSummary mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				TxnAmountSummary txnAmountSummary = new TxnAmountSummary();
				
				txnAmountSummary.setMonth(rs.getString("month"));
				txnAmountSummary.setDPSTAmount(rs.getString("DPSTAmount"));
				txnAmountSummary.setPaymentAmount(rs.getString("PaymentAmount"));
				txnAmountSummary.setTapcashAmount(rs.getString("TapcashAmount"));
				txnAmountSummary.setTransferAmount(rs.getString("TransferAmount"));
				txnAmountSummary.setWithdrawalAmount(rs.getString("WithdrawalAmount"));
				
				
				return txnAmountSummary;
			}

		});
	}

}
