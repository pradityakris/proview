package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("DashboardBoxDAO")
public class DashboardBoxDao {
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List <DashboardBox> getData(String hierarchy){
//		return jdbc.query("EXEC GetDataForDashboardBox @hier='"+hierarchy+"'", new RowMapper<DashboardBox>(){
			return jdbc.query("EXEC getatmstatus @hier='"+hierarchy+"'", new RowMapper<DashboardBox>(){
			@Override
			public DashboardBox mapRow(ResultSet rs, int rowNum) throws SQLException{
				DashboardBox dashboardBox = new DashboardBox();
				
				dashboardBox.setDevicetotal(rs.getInt("devicetotal"));
				dashboardBox.setInservice(rs.getInt("inservice"));
				dashboardBox.setNormal(rs.getInt("normal"));
				dashboardBox.setSleep(rs.getInt("sleep"));

//				out of service count
				dashboardBox.setOutofservice(rs.getInt("outofservice"));
				dashboardBox.setInprogress(rs.getInt("inprogress"));
				dashboardBox.setMaintenance(rs.getInt("maintenance"));
				dashboardBox.setRestock(rs.getInt("restock"));
				dashboardBox.setOutofcash(rs.getInt("outofcash"));
				dashboardBox.setHardware(rs.getInt("hardware"));
				dashboardBox.setFlm(rs.getInt("flm"));
				dashboardBox.setComm(rs.getInt("comm"));
				dashboardBox.setInfrastructure(rs.getInt("infrastructure"));
				dashboardBox.setElectricity(rs.getInt("electricity"));
				dashboardBox.setZerobalance(rs.getInt("zerobalance"));
				
//				inactive
				dashboardBox.setInactive(rs.getInt("inactive"));
				dashboardBox.setSwitchedoff(rs.getInt("switchedoff"));
				dashboardBox.setBlg(rs.getInt("blg"));
				dashboardBox.setCadangan(rs.getInt("cadangan"));
				dashboardBox.setForcemajeure(rs.getInt("forcemajeure"));
				
				return dashboardBox;
			}
			
			
		});
	}
}
