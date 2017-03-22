package com.dn.protitan.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dn.protitan.dao.DashboardBox;
import com.dn.protitan.servicelayer.DashboardBoxService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class DashboardBoxController {
	
	private DashboardBoxService dashboardBoxService;
	
	@Autowired
	public void setDashboardBoxService(DashboardBoxService dashboardBoxService) {
		this.dashboardBoxService = dashboardBoxService;
	}
	
	@RequestMapping("/AtmStatus")
	public String showDashboardBox(Model model){
		//List<DashboardBox> dashboardBoxV = dashboardBoxService.getCurrent();
		return "dashboardbox";
	}
	
	@RequestMapping(value = "/updateDataBox", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String updateDataBox(){
		List<DashboardBox> dashboardBoxV = dashboardBoxService.getCurrent();
		
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();
		
		return gson1.toJson(dashboardBoxV);
	}
	
	@RequestMapping(value = "/serverTime", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String serverTime(){
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();
		
		return gson1.toJson(dateFormat.format(date));
	}
	
}
