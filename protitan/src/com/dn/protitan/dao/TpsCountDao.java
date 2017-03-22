package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("TpsCountDao")
public class TpsCountDao {
	
	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List<TpsCount> getData() {

		return jdbc.query("SELECT * FROM tpscount", new RowMapper<TpsCount>() {

			@Override
			public TpsCount mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				TpsCount tpscount = new TpsCount();
				tpscount.setTpsCount(rs.getInt("tpscount"));
				tpscount.setTime(rs.getString("time"));
				
				return tpscount;
			}

		});
	}

}