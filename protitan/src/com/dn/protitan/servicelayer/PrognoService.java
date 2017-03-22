package com.dn.protitan.servicelayer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.Progno;
import com.dn.protitan.dao.PrognoDao;

@Service("PrognoService")
public class PrognoService {

	private PrognoDao prognoDao;
	
	@Autowired
	public void setPrognoDao(PrognoDao prognoDao) {
		this.prognoDao = prognoDao;
	}
	
	public void insertToProgno(Progno progno){
		prognoDao.insertProgno(progno);
		
	}
	
	public void cleanTableFirst(){
		prognoDao.cleanTable();
	}
	
}
