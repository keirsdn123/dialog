package net.su.dialog.dataSet.service;

import java.util.List;
import java.util.Map;

import net.su.dialog.dataSet.domain.DataManage;

public interface DataManageService {

	public List<DataManage> getCategoryList() throws Exception; //카테고리 조회
	
	public Map<String, Object> selectDtset(DataManage dataManage) throws Exception; //데이터셋 조회
	
	public Map<String, Object> infoRawData(DataManage dataManage) throws Exception; // raw데이터, 표준데이터정보, 표준데이터상세 조회 
	
	public Map<String, Object> infoRd(DataManage dataManage) throws Exception; // 테이블구조에 따른 raw데이터레코드 조회
}
