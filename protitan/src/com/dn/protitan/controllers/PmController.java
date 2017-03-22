package com.dn.protitan.controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.dn.protitan.dao.PreventiveMaintenance;
import com.dn.protitan.dao.UploadedFile;
import com.dn.protitan.servicelayer.PmService;

@Controller
public class PmController {
	
	private PmService pmService;
	
	@Autowired
	public void setPmService(PmService pmService) {
		this.pmService = pmService;
	}

	@RequestMapping("/PmPage")
	public String pmPage() {	
		return "pmpage";
	}

	@RequestMapping("/PmUploadCsv")
	public void saveFile(HttpServletRequest servletRequest, @ModelAttribute UploadedFile uploadedFile,
			BindingResult bindingResult, Model model) {

		MultipartFile multipartFile = uploadedFile.getMultipartFile();
		String fileName = multipartFile.getOriginalFilename();
		try {
			File file = new File("C:\\mantap\\" + fileName);
			multipartFile.transferTo(file);
			readCsv(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/PmPageOpen")
	public String pmPageOpen(Model model) {	

		List<PreventiveMaintenance> pm = pmService.getPmScheduleOpen();
		model.addAttribute("pmSchedule", pm);
		
		return "pmpageopen";
	}

	public void readCsv(File fileName) {
		BufferedReader csvBuffer = null;
		PreventiveMaintenance pm = new PreventiveMaintenance();
		try {
			String mLine;
			csvBuffer = new BufferedReader(new FileReader(fileName));

			while ((mLine = csvBuffer.readLine()) != null) {

				mLine = mLine.replace("\"", "");

				String[] finalLine = mLine.split(",");
				
				pm.setDeviceid(finalLine[0].trim());
				pm.setDate(finalLine[1].trim());
				pm.setStatus(true);
				
				pmService.insertToPm(pm);

			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (csvBuffer != null)
					csvBuffer.close();
					fileName.delete();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
