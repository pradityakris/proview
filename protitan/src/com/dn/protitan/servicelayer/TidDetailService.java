package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.TidDetail;
import com.dn.protitan.dao.TidDetailDao;

@Service("TidDetailService")
public class TidDetailService {
	
	private TidDetailDao tidDetailDao;
	
	@Autowired
	public void setTidDetailDao(TidDetailDao tidDetailDao){
		this.tidDetailDao = tidDetailDao;
	}
	
	public List<TidDetail> getCurrent(String TerminalStatus, String hierarchy){
		return tidDetailDao.getData(TerminalStatus,hierarchy);
	}
}
