package com.dn.protitan.servicelayer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.protitan.dao.TxnAmountSumDao;
import com.dn.protitan.dao.TxnAmountSummary;

@Service("TxnAmountSumService")
public class TxnAmountSumService {
	private TxnAmountSumDao txnAmountSumDao;
	
	@Autowired
	public void setTxnAmountSumDao(TxnAmountSumDao txnAmountSumDao) {
		this.txnAmountSumDao = txnAmountSumDao;
	}
	
	public List<TxnAmountSummary> getCurrent(String startDate, String endDate){
		return txnAmountSumDao.getData(startDate, endDate);
	}
	
}
