package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.TxnFreqSumDao;
import com.dn.protitan.dao.TxnFreqSummary;

@Service("TxnFreqSumService")
public class TxnFreqSumService {
	private TxnFreqSumDao txnFreqSumDao;
	
	@Autowired
	public void setTxnFreqSumDao(TxnFreqSumDao txnFreqSumDao) {
		this.txnFreqSumDao = txnFreqSumDao;
	}
	
	public List<TxnFreqSummary> getCurrent(String startDate, String endDate){
		return txnFreqSumDao.getData(startDate, endDate);
	}
	

}
