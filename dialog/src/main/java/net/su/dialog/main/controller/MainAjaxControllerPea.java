package net.su.dialog.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.service.MainServicePea;
import net.su.dialog.report.domain.ReportDomain;


@RestController
public class MainAjaxControllerPea {

	@Autowired
	private MainServicePea mainService;
	
	@RequestMapping("/selectBestDataList")
	public List<Dataset> selectBestDataList(HttpSession session, Dataset dataset) throws Exception {			
		return mainService.selectBestDataList(session, dataset);
	}
	
	@RequestMapping("/selectBestReportList")
	public List<ReportDomain> selectBestReportList(HttpSession session, ReportDomain reportDomain) throws Exception {			
		return mainService.selectBestReportList(session, reportDomain);
	}
	
	@RequestMapping("/selectCount")
	public Map<String, Integer> selectCount(HttpSession session) throws Exception {			
		return mainService.selectCount(session);
	}
	
}
