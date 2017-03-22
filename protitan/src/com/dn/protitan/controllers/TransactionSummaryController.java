package com.dn.protitan.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dn.protitan.dao.TxnAmountSummary;
import com.dn.protitan.dao.TxnFreqSummary;
import com.dn.protitan.servicelayer.TxnAmountSumService;
import com.dn.protitan.servicelayer.TxnFreqSumService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class TransactionSummaryController {
	private TxnFreqSumService txnFreqSumService;
	private TxnAmountSumService txnAmountSumService;

	@Autowired
	public void setTxnFreqSumService(TxnFreqSumService txnFreqSumService) {
		this.txnFreqSumService = txnFreqSumService;
	}
	
	@Autowired
	public void setTxnAmountSumService(TxnAmountSumService txnAmountSumService) {
		this.txnAmountSumService = txnAmountSumService;
	}

	@RequestMapping("/TxnSummary")
	public String showDashboarDefault() {

		return "txnsummary";
	}

	@RequestMapping(value = "/TxnSummaryData", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String updateTopTenFail(
			@RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
			@RequestParam(value = "endDate", required = false, defaultValue = "") String endDate) {
		
		List<TxnFreqSummary> txnFreqSummary = txnFreqSumService.getCurrent(startDate, endDate);
		List<TxnAmountSummary> txnAmountSummary = txnAmountSumService.getCurrent(startDate, endDate);
		
		List listFinal = new ArrayList();
		listFinal.addAll(txnFreqSummary);
		listFinal.addAll(txnAmountSummary);
		//listFinal.ad
		
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();

		return gson1.toJson(listFinal);
	}

}
