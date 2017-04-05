package com.dn.protitan.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("TidDetailDao")
public class TidDetailDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setJdbc(DataSource jdbc){
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public List<TidDetail> getData(String TerminalStatus, String hierarchy){
		
		String sqlStatement = null;
		if(TerminalStatus.equals("inservice")||TerminalStatus.equals("outofservice")
		||TerminalStatus.equals("inactive")||TerminalStatus.equals("inprogress")){
//			for get group data example = inservice, outofservice, inactive and inprogress
			sqlStatement = "SELECT * FROM problemdetail2 ('"+TerminalStatus+"','"+hierarchy+"')";
		}else {
//			for get per status
			sqlStatement = "SELECT * FROM problemdetail ('"+TerminalStatus+"','"+hierarchy+"')";
		}
		return jdbc.query(sqlStatement, new RowMapper<TidDetail>(){
			
			@Override
			public TidDetail mapRow(ResultSet rs, int rowNum) throws SQLException{
				TidDetail TidDetail = new TidDetail();
				if(TerminalStatus.equals("hardware")){
					TidDetail.setHardware(rs.getString("hardware"));
				}
				TidDetail.setDeviceid(rs.getString("deviceid"));
				TidDetail.setCabang(rs.getString("cabang"));
				TidDetail.setFlm(rs.getString("flm"));
				TidDetail.setLokasi(rs.getString("lokasi"));
				TidDetail.setVendor(rs.getString("vendor"));
				TidDetail.setWilayah(rs.getString("wilayah"));
				
				return TidDetail;
			}
		});
	}
	
	
}
