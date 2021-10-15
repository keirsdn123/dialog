package net.su.dialog.dataSet.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.domain.DataManage;
import net.su.dialog.dataSet.service.DataManageService;


//@ResponseBody 안써도됨
//Ajax만
@RestController
@RequestMapping("/dataManage")
public class DataManageAjaxController {

	@Autowired
    private DataManageService dataManageService;
	
	//카테고리 조회
	@RequestMapping("/getCategoryList")
	public List<DataManage> getCategoryList() throws Exception {			
		return dataManageService.getCategoryList(); 
	}
	
	//데이터셋 조회
	@RequestMapping("/selectDtset")
	public Map<String, Object> selectDtset(DataManage dataManage) throws Exception {
		return dataManageService.selectDtset(dataManage); 
	}
	
	// raw데이터, 표준데이터정보, 표준데이터상세 조회
	@RequestMapping("/infoRawData")
	public Map<String, Object> rawdata(DataManage dataManage) throws Exception{
		System.out.println("raw데이터 가져와버리기@@@@@@@@@");
		return dataManageService.infoRawData(dataManage);
	}
	
	// 테이블구조에 따른 raw데이터레코드 조회
	@RequestMapping("/infoRd")
	public Map<String, Object> infoRd(DataManage dataManage) throws Exception {
		return dataManageService.infoRd(dataManage);
	}
}
