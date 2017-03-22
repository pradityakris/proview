package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.PreventiveMaintenance;
import com.dn.protitan.dao.PreventiveMaintenanceDao;

@Service("PmService")
public class PmService {
	
	private PreventiveMaintenanceDao pmDao;
	
	@Autowired
	public void setPmDao(PreventiveMaintenanceDao pmDao) {
		this.pmDao = pmDao;
	}

	public void insertToPm(PreventiveMaintenance pm){
		pmDao.insertpmSchedule(pm);
	}
	
	public List<PreventiveMaintenance> getPmScheduleOpen(){
		return pmDao.getData();
	}

}
