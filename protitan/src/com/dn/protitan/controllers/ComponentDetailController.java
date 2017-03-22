package com.dn.protitan.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dn.protitan.dao.ComponentDetail;
import com.dn.protitan.servicelayer.ComponentDetailService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class ComponentDetailController {
	
	private ComponentDetailService componentDetailService;
	
	@Autowired	
	public void setComponentDetailService(ComponentDetailService componentDetailService) {
		this.componentDetailService = componentDetailService;
	}

	@RequestMapping("/ComponentDetail")
	public String getComponentDetail( 
			@RequestParam(value = "componentName", required = false, defaultValue = "") 
			String componentName, Model model){
		
		List<ComponentDetail> componentDetail = componentDetailService.getCurrent(componentName);
		
		model.addAttribute("componentDetail", componentDetail);
		
		model.addAttribute("componentName", componentName);
		
		return "componentdetail";
	}
	
	@RequestMapping(value="/updateComponentDetail", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String upDateComponentDetail( 
			@RequestParam(value = "componentName", required = false, defaultValue = "") 
			String componentName, Model model){
		
		List<ComponentDetail> componentDetail = componentDetailService.getCurrent(componentName);
		
		model.addAttribute("componentName", componentName);
		
		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();
	
		return gson1.toJson(componentDetail);
	}

}
