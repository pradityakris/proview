package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.TopTenFail;
import com.dn.protitan.dao.TopTenFailDao;

@Service("TopTenFailService")
public class TopTenFailService {
	private TopTenFailDao topTenFailDao;

	@Autowired
	public void setTopTenFailDao(TopTenFailDao topTenFailDao) {
		this.topTenFailDao = topTenFailDao;
	}
	
	public List<TopTenFail> getCurrent(String topN) {	
		return topTenFailDao.getData(topN);
	}
}
