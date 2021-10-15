package net.su.dialog.dataSet.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.domain.Menulist;

public interface DataSetService {

	//##
//	다음 뉴스 수집 요청 목록조회	(재훈)
	public List<DataRequest> selectCollectRequestList() throws Exception;
//	//다음 뉴스 수집 요청 데이터 테이블 조회 (재훈)  
//	public SchVo selectDaumNewsTableName(DataRequest dataRequest) throws Exception;
	
	//1차 카테고리
	public List<CategoryValueObject> getCategotyList() throws Exception;	
	//2차
	public List<CategoryValueObject> getCategoryList(CategoryValueObject cvo) throws Exception; 
//	//카테고리 선택시 불러오기
//	public List<Dataset> selectCDatasetList(Dataset dvo) throws Exception; 
	//카테고리 목록
	public List<CategoryValueObject> selectDCategory() throws Exception; 
	//데이터셋 리스트 조회
	public Map<String, Object> selectDatasetList(HttpSession session,Dataset dataset) throws Exception; 
	//데이터 셋 (뉴스 카테고리) 목록 조회
	public Map<String, Object> selectDatasetNewsList(HttpSession session,Dataset dataset) throws Exception; 
	//메뉴 리스트 조회
	public List<Menulist> SelectMenuList(HttpSession session) throws Exception; 
//	//3데스 메뉴 리스트 조회
//	public List<Menulist> SelectMenuList(HttpSession session, int menuCode) throws Exception; 
	//데이터셋 일시 등록(관리자)
	public void insertDataset(MultipartHttpServletRequest request, Dataset dataset,HttpSession session) throws Exception;
	//데이터셋 등록(사용자)
	public void insertUserDataset(MultipartHttpServletRequest request, Dataset dataset,HttpSession session) throws Exception;
	//나의 데이터셋 리스트 조회
	public Map<String, Object> selectMydataSetList(HttpSession session,Dataset dataset) throws Exception; 
	//엑셀 파일 유효성 체크
	public int dataSetFileCheck(MultipartHttpServletRequest request) throws Exception; 
	//정기 데이터 셋 개발 소스 조회
	public List<Dataset> selectDSource(Dataset dataset) throws Exception; 
	//데이터 셋 조회수 업데이트
	public void updateDatasetViews(int dataCode) throws Exception;
	//데이터 셋 삭제(상태 변경)
	public void deleteDataSet(int dataCode) throws Exception;
	//데이터셋 정기 등록(다음뉴스)
	public void insertRegularDaumNewsDataSet(Dataset dataset,HttpSession session)throws Exception;
}
