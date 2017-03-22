package com.dn.protitan.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dn.protitan.dao.DashboardDefault;
import com.dn.protitan.dao.TopTenFail;
import com.dn.protitan.dao.TpsCount;
import com.dn.protitan.dao.UploadedFile;
import com.dn.protitan.servicelayer.DashboardDefaultService;
import com.dn.protitan.servicelayer.TopTenFailService;
import com.dn.protitan.servicelayer.TpsCountService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class HomeController {

	private DashboardDefaultService dashboardDefaultService;
	private TopTenFailService topTenFailService;
	private TpsCountService tpscountservice;

	@Autowired
	public void setDashboardDefaultService(DashboardDefaultService dashboardDefaultService) {
		this.dashboardDefaultService = dashboardDefaultService;
	}

	@Autowired
	public void setTopTenFailService(TopTenFailService topTenFailService) {
		this.topTenFailService = topTenFailService;
	}

	@Autowired
	public void setTpscountservice(TpsCountService tpscountservice) {
		this.tpscountservice = tpscountservice;
	}

	@RequestMapping("/")
	public String showDashboarDefault(Model model) {

		List<DashboardDefault> dashboardDefaultV = dashboardDefaultService.getCurrent();
		model.addAttribute("dashboardDefaultV", dashboardDefaultV);

		return "index";
	}

	@RequestMapping(value = "/updateData", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String updateData() {

		List<DashboardDefault> dashboardDefaultV = dashboardDefaultService.getCurrent();

		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();

		// System.out.println("Someone summon me!");

		return gson1.toJson(dashboardDefaultV);
	}

	@RequestMapping(value = "/updateTopTenFail", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String updateTopTenFail(@RequestParam(value = "topN", required = false, defaultValue = "") String topN) {

		List<TopTenFail> topTenFail = topTenFailService.getCurrent(topN);

		Gson gson2 = new GsonBuilder().setPrettyPrinting().create();

		return gson2.toJson(topTenFail);
	}

	ArrayList al = new ArrayList();

	@RequestMapping(value = "/updateTpsCount", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String updateTpsCount() {

		List<TpsCount> tpscount = tpscountservice.getCurrent();

		if (al.size() <= 3) {

			if (al.size() <= 2) {
				al.add(tpscount);
			} else if (al.size() == 3) {
				al.remove(0);
				al.add(tpscount);
			}
		}

		Gson gson1 = new GsonBuilder().setPrettyPrinting().create();

		return gson1.toJson(al);
	}
	
	@RequestMapping("/save-product")
    public void saveFile(HttpServletRequest servletRequest,
            @ModelAttribute UploadedFile uploadedFile,
            BindingResult bindingResult, Model model) {
 
        MultipartFile multipartFile = uploadedFile.getMultipartFile();
        String fileName = multipartFile.getOriginalFilename();
    	try {
			File file = new File("C:\\mantap\\" + fileName);
			multipartFile.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
     
    @RequestMapping(value = "/product-input-form")
    public String inputProduct(Model model) {
        return "productForm";
    }

}
