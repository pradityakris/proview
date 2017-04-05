package com.dn.protitan.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dn.protitan.dao.TidDetail;
import com.dn.protitan.servicelayer.TidDetailService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class TidDetailController {
	
	private TidDetailService tidDetailService;
	
	@Autowired
	public void setTidDetailService(TidDetailService tidDetailService){
		this.tidDetailService = tidDetailService;
	}
	
	@RequestMapping("/TidDetail")
	public String getTidDetail(
			@RequestParam(value = "terminalStatus", required = false, defaultValue= "")
			String terminalStatus, 
			@RequestParam(value = "hier", required = false, defaultValue= "")
			String hier,Model model){
		List<TidDetail> tidDetail = tidDetailService.getCurrent(terminalStatus,hier);
		model.addAttribute("tidDetail", tidDetail);
		model.addAttribute("hier",hier);
		model.addAttribute("terminalStatus", terminalStatus);
		
		return "tiddetail";
	}
	
//	@RequestMapping(value="/updateTidDetail", method = RequestMethod.GET, produces = "application/json")
//	@ResponseBody
//	public String updateTidDetail(
//		@RequestParam(value = "tidStatus", required = false, defaultValue = "") 
//		String tidStatus, Model model){
//		
//		List<TidDetail> tidDetail = tidDetailService.getCurrent(tidStatus);
//		
//		model.addAttribute("tidStatus", tidStatus);
//		
//		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();
//		
//		return gson1.toJson(tidDetail);
//	}
	
	
}
