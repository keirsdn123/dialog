package net.su.dialog.main.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.report.domain.ReportDomain;

public interface MainServicePea {

	public List<Dataset> selectBestDataList(HttpSession session, Dataset dataset) throws Exception;
	
	public List<ReportDomain> selectBestReportList(HttpSession session, ReportDomain reportDomain) throws Exception;
	
	public Map<String, Integer> selectCount(HttpSession session) throws Exception;
}
