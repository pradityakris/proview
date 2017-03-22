package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("TopTenFailDao")
public class TopTenFailDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<TopTenFail> getData(String topN) {
		
		String sqlStatement="SELECT * FROM topNfail('"+topN+"')";

		return jdbc.query(sqlStatement, new RowMapper<TopTenFail>() {

			@Override
			public TopTenFail mapRow(ResultSet rs, int rowNum) throws SQLException {
				TopTenFail topTenFail = new TopTenFail();
				
				
				topTenFail.setDeviceid(rs.getString("deviceid"));
				topTenFail.setMessagetext(rs.getString("messagetext"));
				topTenFail.setLocation(rs.getString("location"));
				topTenFail.setVendor(rs.getString("vendor"));
				topTenFail.setTotaltime(rs.getString("totaltime"));
				
				/*
				List<String> fillIn = new ArrayList<String>();
				
				fillIn.add(rs.getString("deviceid"));
				fillIn.add(rs.getString("messagetext"));
				fillIn.add(rs.getString("location"));
				fillIn.add(rs.getString("vendor"));
				fillIn.add(rs.getString("totaltime"));
				
				topTenFail.setData(fillIn);*/
				
				return topTenFail;
			}

		});
	}

}
