package net.su.dialog.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.User;
import net.su.dialog.main.mapper.MainMapperPea;
import net.su.dialog.main.service.MainServicePea;
import net.su.dialog.report.domain.ReportDomain;

@Service
public class MainServiceImplPea implements MainServicePea {

	@Resource(name = "net.su.dialog.main.mapper.MainMapperPea")
	private MainMapperPea mainMapper;
	
	public List<Dataset> selectBestDataList(HttpSession session, Dataset dataset) throws Exception {
		if(session.getAttribute("memInfo")!=null) {
			
			User userInfo = (User) session.getAttribute("memInfo");
			dataset.setMemberRatingCode(userInfo.getMemberRatingCode());
		}else {
			User userInfo = new User();
			userInfo.setMemberRatingCode(0);
			dataset.setMemberRatingCode(userInfo.getMemberRatingCode());
		}
		return mainMapper.selectBestDataList(dataset);
	}
	
	public List<ReportDomain> selectBestReportList(HttpSession session, ReportDomain reportDomain) throws Exception {
		if(session.getAttribute("memInfo")!=null) {
			
			User userInfo = (User) session.getAttribute("memInfo");
			reportDomain.setMemberRatingCode(userInfo.getMemberRatingCode());
		}else {
			User userInfo = new User();
			userInfo.setMemberRatingCode(0);
			reportDomain.setMemberRatingCode(userInfo.getMemberRatingCode());
		}
		return mainMapper.selectBestReportList(reportDomain);
	}
	
	public Map<String, Integer> selectCount(HttpSession session) throws Exception {
		User userInfo = new User(); 
		int rating = 0;
		if(session.getAttribute("memInfo")!=null) {
			userInfo = (User) session.getAttribute("memInfo");
			if(userInfo.getMemberRatingCode() >= 2) {
				rating = 1;
			}
		}
		int datasetCount = mainMapper.datasetCount();
		int reportCount = mainMapper.reportCount();
		int vizCount = mainMapper.vizCount();
		Map<String, Integer> countMap = new HashMap<String, Integer>();
		countMap.put("datasetCount",datasetCount);
		countMap.put("reportCount",reportCount);
		countMap.put("vizCount",vizCount);
		countMap.put("rating", rating);
		return countMap;
	}
	
}
