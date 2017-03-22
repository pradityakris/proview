package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("PreventiveMaintenanceDao")
public class PreventiveMaintenanceDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public boolean insertpmSchedule(PreventiveMaintenance pm){
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(pm);
		
		String sqlStatement="INSERT INTO pmschedulebni (deviceid, schedule, status) VALUES (:deviceid, :date, :status)";
		
		return jdbc.update(sqlStatement, params) == 1;
	}
	
	public List<PreventiveMaintenance> getData() {
	
		return jdbc.query("Select * from pmschedulebni", new RowMapper<PreventiveMaintenance>() {

			@Override
			public PreventiveMaintenance mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				PreventiveMaintenance pm = new PreventiveMaintenance();
				
				pm.setDeviceid(rs.getString("deviceid"));
				pm.setDate(rs.getString("schedule"));
				pm.setStatus(rs.getBoolean("status"));
				
				return pm;
			}

		});
	}
}
