package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("ComponentDetailDao")
public class ComponentDetailDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setJdbc(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List<ComponentDetail> getData(String ComponentName) {

		 String sqlStatement="SELECT * FROM ComponentDetail('"+ComponentName+"')";

		return jdbc.query(sqlStatement, new RowMapper<ComponentDetail>() {

			@Override
			public ComponentDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
				ComponentDetail ComponentDetail = new ComponentDetail();
				
				ComponentDetail.setDeviceid(rs.getString("deviceid"));
				ComponentDetail.setMessagetext(rs.getString("messagetext"));
				ComponentDetail.setLocation(rs.getString("location"));
				ComponentDetail.setVendor(rs.getString("vendor"));
				ComponentDetail.setTotaltime(rs.getString("totaltime"));
				
				return ComponentDetail;
			}

		});
	}

}
