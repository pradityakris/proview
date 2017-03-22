package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("DashboardDefaultDAO")
public class DashboardDefaultDao {
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List<DashboardDefault> getData() {

		return jdbc.query("EXEC GetDataForHomePage", new RowMapper<DashboardDefault>() {

			@Override
			public DashboardDefault mapRow(ResultSet rs, int rowNum) throws SQLException {
				DashboardDefault dashboardDefault = new DashboardDefault();				
				
				dashboardDefault.setDevicetotal(rs.getInt("devicetotal"));
				dashboardDefault.setCardreader(rs.getInt("cardreader"));
				dashboardDefault.setReceiptprinter(rs.getInt("receiptprinter"));
				dashboardDefault.setCashdispenser(rs.getInt("cashdispenser"));
				dashboardDefault.setEpp(rs.getInt("epp"));
				dashboardDefault.setComm(rs.getInt("comm"));
				dashboardDefault.setCashstatus(rs.getInt("cashstatus"));
				dashboardDefault.setSopstatus(rs.getInt("sopstatus"));
				dashboardDefault.setOutofservice(rs.getInt("outofservice"));
				dashboardDefault.setInservice(rs.getInt("inservice"));

				return dashboardDefault;
			}

		});
	}

}
