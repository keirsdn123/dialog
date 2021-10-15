package net.su.dialog.report.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.report.service.ReportService;
import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataSetListViewVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.PagingVo;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.report.domain.ReportDomain;



@RestController
public class ReportAjaxController {
	
	@Autowired
    private ReportService reportService;

	
	//팝업창 데이터 셋 목록 조회
	@RequestMapping("/selectDataList")
	public List<Dataset> selectDataList(HttpSession session) throws Exception {
		System.out.println("데이터셋 리스트 불러오기");
		return reportService.selectDataList(session);
	}
	//1카테고리 가지고 오기
	@RequestMapping("/selectUCategoryList")
	public List<CategoryValueObject> selectUCategoryList(CategoryValueObject cvo) throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectUCategoryList(cvo);
	}
	//연관데이터셋으로 넘어가기전 멤버레이팅 체크!
	@RequestMapping("/selectcompareRating")
	public int selectcompareRating(HttpSession session) throws Exception {
		System.out.println("멤버레이팅 체크체크");
		int list;
		User userInfo = new User();
		if(session.getAttribute("memInfo") == null) {
			userInfo.setMemberRatingCode(0);
			list = userInfo.getMemberRatingCode();
			return list;			
		} 
		userInfo = (User) session.getAttribute("memInfo");	
		list = userInfo.getMemberRatingCode();
		return list;		
	}
	//검색
	//팝업창 데이터 셋 카테고리 조회
	@RequestMapping("/selectCategory")
	public List<CategoryValueObject> selectCategory(HttpSession session) throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectCategory(session);
	}
	//보고서 카테고리별 조회
	@RequestMapping("/selectReportCate")
	public List<ReportDomain> selectReportCate(ReportDomain rvo, HttpSession session) throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectReportCate(rvo, session);
	}
	//팝업창 데이터 셋 카테고리 선택시 데이터셋 조회
	@RequestMapping("/selectDataCate")
	public List<CategoryValueObject> selectDataCate(CategoryValueObject cvo) throws Exception {
		System.out.println(cvo.getCategorySeq());
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectDataCate(cvo);
	}
	//팝업창 데이터 셋 선택시 연관참조데이터 줄에 선택한값 삽입.
	@RequestMapping("/selectDataSetBox")
	public List<Dataset> selectDataSetBox(Dataset dvo) throws Exception {
		System.out.println(dvo.getDataCode());
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectDataSetBox(dvo);
	}
	//보고서 수정시 연관참조데이터 바로 불러오기!
	@RequestMapping("/selectUDataSetBox")
	public List<Dataset> selectUDataSetBox(Dataset dvo) throws Exception {
		System.out.println("보고서 수정시 연관참조데이터 바로 불러오기"+dvo.getReportCode());
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectUDataSetBox(dvo);
	}
	//보고서 등록.
	@RequestMapping("/insertReport")
	public String insertReport(MultipartHttpServletRequest request, ReportDomain report ,HttpSession session) throws Exception {
		System.out.println("보고서 등록");
		System.out.println("데이터코드SEQ: "  + report.getDataCodeList());
		reportService.insertReport(request,report,session);
		return "등록이 완료되었습니다";
	}
	//보고서 수정하기
	@RequestMapping("/updateReport")
	public String updateReport(MultipartHttpServletRequest request, ReportDomain report ,HttpSession session) throws Exception {
		System.out.println("보고서 등록");
		System.out.println("데이터코드SEQ: "  + report.getDataCodeList());
		reportService.updateReport(request,report,session);
		return "수정이 완료되었습니다";
	}
	//일시적 데이터 클릭시 실행.
	@RequestMapping("/selectFileType1")
	public List<Dataset> selectFileType1() throws Exception {		
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectFileType1();
	}
	//정기적 데이터 클릭시 실행.
	@RequestMapping("/selectFileType2")
	public List<Dataset> selectFileType2() throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectFileType2();
	}
	//나만의 데이터 
	@RequestMapping("/selectMyFile")
	public List<Dataset> selectMyFile(Dataset dvo, HttpSession session) throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return reportService.selectMyFile(dvo, session);
	}
	//데이터 검색(팝업창)
	@RequestMapping("/selectDtSearchDataSet")
	public List<Dataset> selectDtSearchDataSet(Dataset dvo, HttpSession session) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		dvo.setMemberRatingCode(userInfo.getMemberRatingCode());
		System.out.println("sdfsdaf"+dvo.getMemberRatingCode());
		return reportService.selectDtSearchDataSet(dvo);
	}
	//보고서 검색
	@RequestMapping("/selectDtSearchReportSet")
	public List<ReportDomain> selectDtSearchReportSet(ReportDomain rvo, HttpSession session) throws Exception {
		User userInfo = new User();
		if(session.getAttribute("memInfo") == null) {
			userInfo.setMemberRatingCode(0);
			rvo.setMemberRatingCode(userInfo.getMemberRatingCode());
			System.out.println("sdfsdasdasdsadaf"+rvo.getMemberRatingCode());
			return reportService.selectDtSearchReportSet(rvo);
		} else 
		rvo.setMemberRatingCode(userInfo.getMemberRatingCode());
		System.out.println("sdfsdaf"+rvo.getMemberRatingCode());
		return reportService.selectDtSearchReportSet(rvo);
	}
	//2차 카테고리 조회(보고서 수정)
	@RequestMapping(value="/selectUSecCategoryList")
	public List<CategoryValueObject> selectUSecCategoryList(CategoryValueObject cvo) throws Exception {
		System.out.println(cvo.getCategorySeq());
		System.out.println(cvo.getReportCode());
		return reportService.selectUSecCategoryList(cvo);
	}
	//보고서 목록 조회
	@RequestMapping("/selectReportList")
	public List<ReportDomain> selectReportList(ReportDomain rvo, HttpSession session) throws Exception {
		System.out.println("보고서 목록 불러오기");
		
		return reportService.selectReportList(rvo, session);
	}
	//페이징 총수
	@RequestMapping("/selectReportDataRowCount")
	public int selectReportDataRowCount(HttpSession session, ReportDomain rvo) throws Exception {
		System.out.println("보고서 목록 불러오기");
		return reportService.selectReportDataRowCount(session, rvo);
	}
	//권한 조회
	@RequestMapping("/selectRatingList")
	public List<Authority> selectAuthorityList() throws Exception {
		System.out.println("권한 조회");
		return reportService.selectRatingList();
	}
	//보고서 -> 보고서 상세조회
	@RequestMapping("/selectReportView")
	public Map<String,Object> selectReportView(ReportDomain report) throws Exception {
		return reportService.selectReportView(report);
	}
	//보고서 수정 (이전에 작성한 내용 들고오기)
	@RequestMapping("/selectReportInfo")
	public Map<String,Object> selectReportInfo(ReportDomain report) throws Exception {
		System.out.println("보고서 수정 - 상세조회");
		System.out.println("보고서 seq@@@@"+report.getReportCode());
		return reportService.selectReportInfo(report);
	}
	//보고서 수정(전에 등록한 type 가져오기)
	@RequestMapping("/selectTypePaper")
	 public List<ReportDomain> selectTypePaper(ReportDomain report)throws Exception{
        System.out.println("가는가");
        return reportService.selectTypePaper(report);
     }
	//보고서 수정(파일 들고오기)
	@RequestMapping("/selectOriginFileNme")
	 public List<ReportDomain> selectOriginFileNme(ReportDomain report)throws Exception{
       System.out.println("가는가");
       return reportService.selectOriginFileNme(report);
    }
	
	//보고서 -> 파일 다운로드
	@RequestMapping("/selectRFileDownload")
	public void selectRFileDownload(HttpServletResponse response, ReportDomain report) throws Exception{
		System.out.println("보고서  상세조회 - 파일 다운로드 컨트롤러");
		reportService.selectRFileDownload(response, report);
	}
	
	//보고서 삭제
	@RequestMapping("/inVisibleReport")
	public void inVisibleReport(ReportDomain report) throws Exception{
		System.out.println("보고서 삭제");
		reportService.inVisibleReport(report);
	}
	//보고서 -> 연관 데이터셋
	@RequestMapping("/selectReferenceDataSetList")
	public List<Dataset> selectReferenceDataSetList(Dataset dvo) throws Exception {
		return reportService.selectReferenceDataSetList(dvo);
	}
	//나의데이터 -> 보고서 목록
	@RequestMapping("/selectMyReportList")
	public Map<String, Object> selectMyReportList(HttpSession session,ReportDomain report) throws Exception {
		System.out.println("나의 보고서 리스트 불러오기!!!!");
		return reportService.selectMyReportList(session,report);
	}
	
	@RequestMapping("/selectDatasetType")
	public String selectDatasetType(int dataCode) throws Exception {
		return reportService.selectDatasetType(dataCode);
	}
}
