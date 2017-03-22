package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.DashboardDefault;
import com.dn.protitan.dao.DashboardDefaultDao;

@Service("DashboardDefaultService")
public class DashboardDefaultService {

	private DashboardDefaultDao dashboardDefaultDao;

	@Autowired
	public void setDashboardDefaultDao(DashboardDefaultDao dashboardDefaultDao) {
		this.dashboardDefaultDao = dashboardDefaultDao;
	}
	
	public List<DashboardDefault> getCurrent() {
		return dashboardDefaultDao.getData();
		
	}
	
}
