package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.DashboardBox;
import com.dn.protitan.dao.DashboardBoxDao;

@Service("DashbordBoxDervice")
public class DashboardBoxService {

	private DashboardBoxDao dashboardBoxDao;
	
	@Autowired
	public void setDashboardBoxDao(DashboardBoxDao dashboardBoxDao){
		this.dashboardBoxDao = dashboardBoxDao;
	}
	
	public List<DashboardBox> getCurrent(String hierarchy){
		return dashboardBoxDao.getData(hierarchy);
	
	}

}
