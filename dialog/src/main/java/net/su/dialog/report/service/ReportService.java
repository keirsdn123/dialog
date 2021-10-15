package net.su.dialog.report.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataSetListViewVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.PagingVo;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.report.domain.ReportDomain;

public interface ReportService {
	//팝업창 데이터셋 가지고오기
	public List<Dataset> selectDataList(HttpSession session) throws Exception; 
	//카테고리별 보고서 조회
	public List<ReportDomain> selectReportCate(ReportDomain rvo, HttpSession session) throws Exception;
	//1차카테고리 가지고 오기
	public List<CategoryValueObject> selectUCategoryList(CategoryValueObject cvo) throws Exception; 
	//2차카테고리 가지고 오기
	public List<CategoryValueObject> selectUSecCategoryList(CategoryValueObject cvo) throws Exception;
	//카테고리 가져오기
	public List<CategoryValueObject> selectCategory(HttpSession session) throws Exception;
	//멤버 레이팅 체크체크
	//public List<Dataset> selectMemberRating(HttpSession session, Dataset dvo) throws Exception;
	//팝업창 카테고리 클릭시 해당하는 데이터셋 가지고 오기
	public List<CategoryValueObject> selectDataCate(CategoryValueObject cvo) throws Exception;
	//팝업창 데이터셋 제목 클릭시 연관 참조 데이터 항목에 값 삽입.
	public List<Dataset> selectDataSetBox(Dataset dvo) throws Exception;
	//수정시 참조한 데이터셋 값 들고오기	
	public List<Dataset> selectUDataSetBox(Dataset dvo) throws Exception;
	//팝업창 데이터셋 검색
	public List<Dataset> selectDtSearchDataSet(Dataset dvo ) throws Exception;
	//보고서 검색
	public List<ReportDomain> selectDtSearchReportSet(ReportDomain rvo) throws Exception;	
	//보고서 등록
	public void insertReport(MultipartHttpServletRequest request, ReportDomain report ,HttpSession session) throws Exception;
	//보고서 수정
	public void updateReport(MultipartHttpServletRequest request, ReportDomain report ,HttpSession session) throws Exception;
	//일시적데이터 클릭시 실행
	public List<Dataset> selectFileType1() throws Exception;
	//정기적데이터 클릭시 실행
	public List<Dataset> selectFileType2() throws Exception;
	//나만의 데이터 클릭시 실행
	public List<Dataset> selectMyFile(Dataset dvo, HttpSession session) throws Exception;
	//보고서 목록 조회
	public List<ReportDomain> selectReportList(ReportDomain rvo, HttpSession session) throws Exception;
	//페이지 총수
	public int selectReportDataRowCount(HttpSession session, ReportDomain rvo) throws Exception;
	//나의 data > 보고서 목록 조회	
	public  Map<String, Object> selectMyReportList(HttpSession session,ReportDomain report) throws Exception;
	//권한 조회
	public List<Authority> selectRatingList() throws Exception;
	//보고서 -> 보고서 상세조회
	public Map<String,Object> selectReportView(ReportDomain report) throws Exception;
	//보고서 수정 (이전에 작성한 내용 보기)
	public Map<String,Object> selectReportInfo(ReportDomain report) throws Exception;
	//보고서 수정(일반보고서/ 논문)
	public List<ReportDomain> selectTypePaper(ReportDomain report) throws Exception;
	//보고서 수정(파일 불러오기)
	public List<ReportDomain> selectOriginFileNme(ReportDomain report) throws Exception;
	
	public void selectRFileDownload(HttpServletResponse response , ReportDomain report) throws Exception;
	//보고서 삭제 
	public void inVisibleReport(ReportDomain report) throws Exception;
	
	public List<Dataset> selectReferenceDataSetList(Dataset dvo) throws Exception;
	
	//보고서 조회수
	public void updateReportViews(int userCode) throws Exception;
	
	public String selectDatasetType(int dataCode) throws Exception;
}
