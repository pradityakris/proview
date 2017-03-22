package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.ComponentDetail;
import com.dn.protitan.dao.ComponentDetailDao;

@Service("ComponentDetailService")
public class ComponentDetailService {

	private ComponentDetailDao componentDetailDao;

	@Autowired
	public void setComponentDetailDao(ComponentDetailDao componentDetailDao) {
		this.componentDetailDao = componentDetailDao;
	}
	
	public List<ComponentDetail> getCurrent(String ComponentName) {
		return componentDetailDao.getData(ComponentName);
		
	}
	
	
}
