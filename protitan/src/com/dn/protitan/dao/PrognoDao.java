package com.dn.protitan.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

@Component("PrognoDao")
public class PrognoDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public boolean insertProgno(Progno progno) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(progno);
		
		String sqlstatement1="insert into atmmon (IR_TIMESTAMP_String,IR_TIMESTAMP_TimeStamp,IR_NODE,IR_INTERVAL,IR_ATMID,IR_LINESTAT,IR_ATMSTAT,IR_TERMLOC,IR_HOP1CASH,IR_HOP2CASH,IR_HOP3CASH,IR_HOP4CASH,IR_ENDCASH,IR_CASHOUT,IR_FAULT01,IR_FAULT02,IR_FAULT03,IR_FAULT04,IR_FAULT05,IR_FAULT06,IR_FAULT07,IR_FAULT08,IR_REGN,IR_HOP1BILL)";
		sqlstatement1=sqlstatement1+" values (:IR_TIMESTAMP_String,:IR_TIMESTAMP_TimeStamp,:IR_NODE,:IR_INTERVAL,:IR_ATMID,:IR_LINESTAT,:IR_ATMSTAT,:IR_TERMLOC,:IR_HOP1CASH,:IR_HOP2CASH,:IR_HOP3CASH,:IR_HOP4CASH,:IR_ENDCASH,:IR_CASHOUT,:IR_FAULT01,:IR_FAULT02,:IR_FAULT03,:IR_FAULT04,:IR_FAULT05,:IR_FAULT06,:IR_FAULT07,:IR_FAULT08,:IR_REGN,:IR_HOP1BILL)";

		return jdbc.update(sqlstatement1, params) == 1;
	}
	

	public boolean cleanTable() {
		
		SqlParameterSource paramSource = null;
		return jdbc.update("EXEC cleanTestCsv", paramSource)==1;
		
	}

}
