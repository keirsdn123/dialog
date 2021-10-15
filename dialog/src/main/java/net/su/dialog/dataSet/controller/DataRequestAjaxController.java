package net.su.dialog.dataSet.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.service.DataRequestService;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.schedule.domain.SchVo;

@RestController
public class DataRequestAjaxController {

	@Autowired
	private DataRequestService dataRequestService;

	// 다음 뉴스 데이터 수집 요청 등록
	@RequestMapping("/insertDaumCollectRequest")
	public void insertDaumCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequestService.insertDaumCollectRequest(dataRequest, session);
	}

	// 다음 뉴스 데이터 수집 요청 조회
	@RequestMapping("/selectMyDaumCollectRequest")
	public List<DataRequest> selectMyDaumCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectMyDaumCollectRequest(dataRequest, session);
	}
	
	//다음 뉴스 데이터 수집 요청 게시글 수
	@RequestMapping("/selectDaumRequestRecords")
	public int selectDaumRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectDaumRequestRecords(dataRequest, session);
	}

	// 기타 데이터 수집 요청 등록
	@RequestMapping("/insertActCollectRequest")
	public void insertActCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequestService.insertActCollectRequest(dataRequest, session);
	}
	
	//기타 데이터 수집 요청 게시글 수
	@RequestMapping("/selectActRequestRecords")
	public int selectActRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectActRequestRecords(dataRequest, session);
	}	

	// 기타 데이터 수집 요청 조회
	@RequestMapping("/selectMyActCollectRequest")
	public List<DataRequest> selectMyActCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectMyActCollectRequest(dataRequest, session);
	}

	// 기타 데이터 수집 요청 상세 조회
	@RequestMapping("/infoMyActCollectRequest")
	public DataRequest infoMyActCollectRequest(DataRequest dataRequest) throws Exception {
		return dataRequestService.infoMyActCollectRequest(dataRequest);
	}

	// 다음 뉴스 데이터 수집 요청 상세 조회
	@RequestMapping("/infoMyDaumCollectRequest")
	public DataRequest infoMyDaumCollectRequest(DataRequest dataRequest) throws Exception {
		return dataRequestService.infoMyDaumCollectRequest(dataRequest);
	}

	// 반출 요청 RSS 데이터셋 조회
	@RequestMapping("/selectRssDtSet")
	public List<DataRequest> selectRssDtSet(DataRequest dataRequest) throws Exception {
		return dataRequestService.selectRssDtSet(dataRequest);
	}

	// 반출 요청 쇼핑 데이터셋 조회
	@RequestMapping("/selectShopDtSet")
	public List<DataRequest> selectShopDtSet(DataRequest dataRequest) throws Exception {
		return dataRequestService.selectShopDtSet(dataRequest);
	}

	// 데이터 반출 요청 등록
	@RequestMapping("/insertExportRequest")
	public void insertExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		System.out.println(dataRequest.getExportCollectWord());
		System.out.println(dataRequest.getExportCollectStartDate());
		System.out.println(dataRequest.getExportCollectEndDate());
		System.out.println(dataRequest.getDataCode());
		dataRequestService.insertExportRequest(dataRequest, session);
	}

	// rss 뉴스 데이터 반출 요청 조회
	@RequestMapping("/selectMyRssExportRequest")
	public List<DataRequest> selectMyRssExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectMyRssExportRequest(dataRequest, session);
	}
	
	//rss 데이터 반출 요청 게시글 수
	@RequestMapping("/selectRssRequestRecords")
	public int selectRssRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectRssRequestRecords(dataRequest, session);
	}
	
	// 쇼핑 데이터 반출 요청 조회
	@RequestMapping("/selectMyShopExportRequest")
	public List<DataRequest> selectMyShopExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectMyShopExportRequest(dataRequest, session);
	}
	
	//쇼핑 데이터 반출 요청 게시글 수
	@RequestMapping("/selectShopRequestRecords")
	public int selectShopRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectShopRequestRecords(dataRequest, session);
	}
		
	// rss 데이터 반출 요청 상세 조회
	@RequestMapping("/infoMyRssExportRequest")
	public DataRequest infoMyRssExportRequest(DataRequest dataRequest) throws Exception {
		return dataRequestService.infoMyRssExportRequest(dataRequest);
	}

	// 다음 뉴스 데이터 수집 요청 관리자 조회
	@RequestMapping("/selectApprovalDaumRequest")
	public List<DataRequest> selectApprovalDaumRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalDaumRequest(dataRequest, session);
	}

	//다음 뉴스 데이터 수집 요청 게시글 수
	@RequestMapping("/selectApprovalDaumRequestRecords")
	public int selectApprovalDaumRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalDaumRequestRecords(dataRequest, session);
	}
	
	//기타 데이터 수집 요청 관리자 조회
	@RequestMapping("/selectApprovalActRequest")
	public List<DataRequest> selectApprovalActRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalActRequest(dataRequest, session);
	}

	// rss 데이터 반출 요청 관리자 조회
	//기타 데이터 수집 요청 게시글 수
	@RequestMapping("/selectApprovalActRequestRecords")
	public int selectApprovalActRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalActRequestRecords(dataRequest, session);
	}
	
	//rss 데이터 반출 요청 관리자 조회
	@RequestMapping("/selectApprovalRssRequest")
	public List<DataRequest> selectApprovalRssRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalRssRequest(dataRequest, session);
	}

	// 쇼핑 데이터 반출 요청 관리자 조회
	//rss 데이터 반출 요청 게시글 수
	@RequestMapping("/selectApprovalRssRequestRecords")
	public int selectApprovalRssRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalRssRequestRecords(dataRequest, session);
	}
	//쇼핑 데이터 반출 요청 관리자 조회
	@RequestMapping("/selectApprovalShopRequest")
	public List<DataRequest> selectApprovalShopRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalShopRequest(dataRequest, session);
	}
	
	//쇼핑 데이터 반출 요청 게시글 수
	@RequestMapping("/selectApprovalShopRequestRecords")
	public int selectApprovalShopRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalShopRequestRecords(dataRequest, session);
	}
		
	// 기타 데이터 수집 요청 승인 거부
	@RequestMapping("/updateApprovalActRequest")
	public void updateApprovalActRequest(DataRequest dataRequest) throws Exception {
		dataRequestService.updateApprovalActRequest(dataRequest);
	}

	// 시각화 요청 조회
	@RequestMapping("/selectMyVizRequest")
	public List<Dataset> selectMyVizRequest(HttpSession session,Dataset dataset) throws Exception {
		return dataRequestService.selectMyVizRequest(session,dataset);
	}
	
	@RequestMapping("/selectMyVizRequestRoecords")
	public int selectMyVizRequestRoecords(HttpSession session,Dataset dataset) throws Exception {
		return dataRequestService.selectMyVizRequestRoecords(session, dataset);
	}

	// 데이터 승인관리 > 시각화 승인관리 조회
	@RequestMapping("/selectApprovalVizRequest")
	public Map<String, Object> selectApprovalVizRequest(HttpSession session, Dataset dataset) throws Exception {
		return dataRequestService.selectApprovalVizRequest(session, dataset);
	}

	// 데이터 승인관리 > 데이터 수집요청 상세조회 재훈
	@RequestMapping("/infoDataCollection")
	public DataRequest infoDataCollection(DataRequest dataRequest, HttpSession session) throws Exception {

		return dataRequestService.infoDataCollection(dataRequest, session);
	}

	// 데이터 승인관리 > 데이터 반출요청 상세조회 재훈
	@RequestMapping("/infoDataExport")
	public DataRequest infoDataExport(DataRequest dataRequest, HttpSession session) throws Exception {

		return dataRequestService.infoDataExport(dataRequest, session);
	}

	// 다음 뉴스 클래스 폴더 절대경로 조회
	@RequestMapping("/selectDaumNewsFormalFilePath")
	public String selectDaumNewsFormalFilePath() throws Exception {
		File file = new File("scheduler");

		System.out.println("getPath: " + file.getAbsolutePath()); // 파일 경로 추출
		// developSource.setDevSourceFilePath(file.getAbsolutePath());

		return file.getAbsolutePath();
	}

	// 데이터 반출 파일 (재훈)
	@RequestMapping("/selectDataExportFile")
	public SchVo selectDataExportFile(DataRequest dataRequest) throws Exception {
		SchVo SchVo = dataRequestService.selectDataExportFile(dataRequest);
		return SchVo;
	}

	// 데이터 반출 파일 다운로드 (재훈)
	@RequestMapping("/exportFileDownload")
	public void exportFileDownload(HttpServletResponse response, SchVo schVo) throws Exception {
		dataRequestService.exportFileDownload(response, schVo);

	}

	// rss 데이터 반출 요청 스케줄 등록화면 관리자 조회
	@RequestMapping("/selectApprovalRssScheRequest")
	public List<DataRequest> selectApprovalRssScheRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalRssScheRequest(dataRequest, session);
	}
	
	// 다음 뉴스 데이터 수집 요청 관리자 조회
	@RequestMapping("/selectApprovalDaumScheRequest")
	public List<DataRequest> selectApprovalDaumScheRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalDaumScheRequest(dataRequest, session);
	}
	
	// 쇼핑 데이터 반출 요청 관리자 조회
	@RequestMapping("/selectApprovalShopScheRequest")
	public List<DataRequest> selectApprovalShopScheRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectApprovalShopScheRequest(dataRequest, session);
	}
	
	//반출 데이터셋 조회(다음뉴스)
	@RequestMapping("/selectDaumDtSet")
	public List<DataRequest> selectDaumDtSet() throws Exception{
		return dataRequestService.selectDaumDtSet();
	}
//	반출 데이터셋 상세조회(다음뉴스)
	@RequestMapping("/selectDaumDtSetInfo")
	public DataRequest selectDaumDtSetInfo(DataRequest dataRequest) throws Exception{
		return dataRequestService.selectDaumDtSetInfo(dataRequest);
	}
	// 다음 뉴스 데이터 반출 요청 조회
	@RequestMapping("/selectMyDaumNewsExportRequest")
	public List<DataRequest> selectMyDaumNewsExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectMyDaumNewsExportRequest(dataRequest, session);
	}
	
	//다음뉴스 데이터 반출 요청 게시글 수
	@RequestMapping("/selectMyDaumNewsExportRecords")
	public int selectMyDaumNewsExportRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		return dataRequestService.selectMyDaumNewsExportRecords(dataRequest, session);
	}
	
	@RequestMapping("/selectApprovalDaumNewsRequest")
	public List<DataRequest> selectApprovalDaumNewsRequest(DataRequest dataRequest)throws Exception{
		return dataRequestService.selectApprovalDaumNewsRequest(dataRequest);
	}
	
	@RequestMapping("/selectApprovalDaumNewsRequestRecords")
	public int selectApprovalDaumNewsRequestRecords(DataRequest dataRequest)throws Exception{
		return dataRequestService.selectApprovalDaumNewsRequestRecords(dataRequest);
	}
	
	@RequestMapping("/selectApprovalDaumNewsExportRequest")
	public List<DataRequest> selectApprovalDaumNewsExportRequest()throws Exception{
		return dataRequestService.selectApprovalDaumNewsExportRequest();
	}
}
