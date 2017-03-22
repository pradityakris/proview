package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.TpsCount;
import com.dn.protitan.dao.TpsCountDao;

@Service("TpsCountService")
public class TpsCountService {
	private TpsCountDao tpscountdao;
	
	@Autowired
	public void setTpscountdao(TpsCountDao tpscountdao) {
		this.tpscountdao = tpscountdao;
	}
	
	public List<TpsCount> getCurrent(){
		return tpscountdao.getData();
	}
	
	
}
