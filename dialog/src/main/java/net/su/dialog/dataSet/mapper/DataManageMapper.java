package net.su.dialog.dataSet.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataManage;

@Repository("net.su.dialog.dataSet.mapper.DataManageMapper")
public interface DataManageMapper {
	
	public List<DataManage> getCategoryList() throws Exception; //카테고리 조회
	
	public List<DataManage> selectDtset1(DataManage dataManage) throws Exception; //일시데이터셋 조회
	
	public int countDtset1(DataManage dataManage) throws Exception; //일시데이터셋갯수
	
	public int countDtset2(DataManage dataManage) throws Exception; //정기데이터셋갯수
	
	public List<DataManage> selectDtset2(DataManage dataManage) throws Exception; //정기데이터셋 조회
	
	public DataManage selectTbTitle(DataManage dataManage) throws Exception; // 테이블명 조회 
	
	public List<LinkedHashMap<String, Object>> infoRawDataRecode(DataManage tbTitle) throws Exception; // raw데이터 레코드 조회
	
	public List<DataManage> infoSdDataRecode(DataManage tbTitle) throws Exception; // 표준데이터 정보 조회
	
	public List<DataManage> infoSdDataDetailRecode(DataManage dataManage) throws Exception; // 표준데이터 상세 조회
	
	public List<DataManage> selectRegularTb(DataManage dataManage) throws Exception; // 테이블 구조 조회
	
	public int countRawRecode(DataManage tbTitle) throws Exception; // raw데이터 레코드 행수
	
	public int countStandardRecode(DataManage tbTitle) throws Exception; // 표준데이터 레코드 행수
}
