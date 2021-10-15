package net.su.dialog.dataSet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.File;
import java.net.URLEncoder;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.mapper.DataRequestMapper;
import net.su.dialog.dataSet.service.DataRequestService;
import net.su.dialog.main.domain.User;
import net.su.dialog.schedule.domain.SchVo;

@Service
public class DataRequestServiceImpl implements DataRequestService {

	@Resource(name = "net.su.dialog.dataSet.mapper.DataReqeustMapper")
	private DataRequestMapper dataRequestMapper;

	// 다음 뉴스 데이터 수집 요청 등록
	public void insertDaumCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		dataRequestMapper.insertDaumCollectRequest(dataRequest);
	}

	// 다음 뉴스 데이터 수집 요청 조회
	public List<DataRequest> selectMyDaumCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectMyDaumCollectRequest(dataRequest);
	}

	//다음 뉴스 데이터 수집 요청 게시글 수
	public int selectDaumRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectDaumRequestRecords(dataRequest);
	}
		
	// 기타 데이터 수집 요청 등록
	public void insertActCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		dataRequestMapper.insertActCollectRequest(dataRequest);
	}

	// 기타 데이터 수집 요청 조회
	public List<DataRequest> selectMyActCollectRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectMyActCollectRequest(dataRequest);
	}

	//기타 데이터 수집 요청 게시글 수
	public int selectActRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectActRequestRecords(dataRequest);
	}
	
	// 기타 데이터 수집 요청 상세 조회
	public DataRequest infoMyActCollectRequest(DataRequest dataRequest) throws Exception {
		return dataRequestMapper.infoMyActCollectRequest(dataRequest);
	}

	// 다음 뉴스 데이터 수집 요청 상세 조회
	public DataRequest infoMyDaumCollectRequest(DataRequest dataRequest) throws Exception {
		return dataRequestMapper.infoMyDaumCollectRequest(dataRequest);
	}

	// 반출 요청 RSS 데이터셋 조회
	public List<DataRequest> selectRssDtSet(DataRequest dataRequest) throws Exception {
		return dataRequestMapper.selectRssDtSet(dataRequest);
	}

	// rss 뉴스 데이터 반출 요청 조회
	public List<DataRequest> selectMyRssExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectMyRssExportRequest(dataRequest);
	}
	
	//rss 데이터 반출 요청 게시글 수
	public int selectRssRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectRssRequestRecords(dataRequest);
	}
	
	// 데이터 반출 요청 등록
	public void insertExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		dataRequestMapper.insertExportRequest(dataRequest);
		dataRequestMapper.insertExportRequest2(dataRequest);
	}

	// 쇼핑 데이터 반출 요청 조회
	public List<DataRequest> selectMyShopExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectMyShopExportRequest(dataRequest);
	}

	// 반출 요청 쇼핑 데이터셋 조회
	public List<DataRequest> selectShopDtSet(DataRequest dataRequest) throws Exception {
		return dataRequestMapper.selectShopDtSet(dataRequest);
	}
	
	//쇼핑 데이터 반출 요청 게시글 수
	public int selectShopRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectShopRequestRecords(dataRequest);
	}
		
	// rss 데이터 반출 요청 상세 조회
	public DataRequest infoMyRssExportRequest(DataRequest dataRequest) throws Exception {
		return dataRequestMapper.infoMyRssExportRequest(dataRequest);
	}

	// 다음 뉴스 데이터 수집 요청 관리자 조회
	public List<DataRequest> selectApprovalDaumRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalDaumRequest(dataRequest);
	}
	
	//다음 뉴스 데이터 수집 요청 게시글 수
	public int selectApprovalDaumRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalDaumRequestRecords(dataRequest);
	}
	
	// 기타 데이터 수집 요청 관리자 조회
	public List<DataRequest> selectApprovalActRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalActRequest(dataRequest);
	}

	// rss 데이터 반출 요청 관리자 조회
	
	//기타 데이터 수집 요청 게시글 수
	public int selectApprovalActRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalActRequestRecords(dataRequest);
	}
	
	//rss 데이터 반출 요청 관리자 조회
	public List<DataRequest> selectApprovalRssRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalRssRequest(dataRequest);
	}

	// 쇼핑 데이터 반출 요청 관리자 조회
	
	//rss 데이터 반출 요청 게시글 수
	public int selectApprovalRssRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalRssRequestRecords(dataRequest);
	}
	
	//쇼핑 데이터 반출 요청 관리자 조회
	public List<DataRequest> selectApprovalShopRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalShopRequest(dataRequest);
	}
	
	//쇼핑 데이터 반출 요청 게시글 수
	public int selectApprovalShopRequestRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalShopRequestRecords(dataRequest);
	}
		
	// 기타 데이터 수집 요청 승인 거부
	public void updateApprovalActRequest(DataRequest dataRequest) throws Exception {
		dataRequestMapper.updateApprovalActRequest(dataRequest);
	}

	// 시각화 요청 조회

	public List<Dataset> selectMyVizRequest(HttpSession session,Dataset dataset) throws Exception {
		
		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());
		return dataRequestMapper.selectMyVizRequest(dataset);
	}
	
	// 시각화 요청 게시글 수
	public int selectMyVizRequestRoecords(HttpSession session, Dataset dataset) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());
		return dataRequestMapper.selectMyVizRequestRoecords(dataset);
	}

	// 데이터 승인관리 > 시각화 승인관리 조회

	public Map<String, Object> selectApprovalVizRequest(HttpSession session, Dataset dataset) throws Exception {
		
		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());
		List<Dataset> selectVizRequstList = dataRequestMapper.selectApprovalVizRequest(dataset);
		int vizRequestRecords = dataRequestMapper.selectVizRequestRowCount(dataset);
		Map<String, Object> vizRequestMap = new HashMap<String, Object>();
		vizRequestMap.put("selectVizRequstList", selectVizRequstList);
		vizRequestMap.put("vizRequestRecords", vizRequestRecords);
		return vizRequestMap;
	}
	//추가
	public int selectVizRequestRowCount(Dataset dataset) throws Exception {
		return dataRequestMapper.selectVizRequestRowCount(dataset);
	}

	
	//##
	// 데이터 승인관리 > 데이터 수집요청 상세조회
	public DataRequest infoDataCollection(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.infoDataCollection(dataRequest);

	}

	public DataRequest infoDataExport(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.infoDataExport(dataRequest);
	}

	public SchVo selectDataExportFile(DataRequest dataRequest) throws Exception {

		return dataRequestMapper.selectDataExportFile(dataRequest);

	}

	public void exportFileDownload(HttpServletResponse response, SchVo schVo) throws Exception{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!이름" + schVo.getExportFileTitle());
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!경로" + schVo.getExportFileRoute());
		byte fileByte[] = FileUtils.readFileToByteArray(new File(schVo.getExportFileRoute()));
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(schVo.getExportFileTitle()+schVo.getExportExtension(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	public List<DataRequest> selectApprovalRssScheRequest(DataRequest dataRequest, HttpSession session) throws Exception{
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalRssScheRequest(dataRequest);
		
	}
	
	// 다음 뉴스 데이터 수집 요청 관리자 조회
	public List<DataRequest> selectApprovalDaumScheRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalDaumScheRequest(dataRequest);
	}
	

	// 쇼핑 데이터 반출 요청 관리자 조회
	public List<DataRequest> selectApprovalShopScheRequest(DataRequest dataRequest, HttpSession session) throws Exception {

		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectApprovalShopScheRequest(dataRequest);
	}
	//다음뉴스 데이터셋 조회
	public List<DataRequest> selectDaumDtSet() throws Exception{
		return dataRequestMapper.selectDaumDtSet();
	}
	
	//
	public DataRequest selectDaumDtSetInfo(DataRequest dataRequest) throws Exception{
		return dataRequestMapper.selectDaumDtSetInfo(dataRequest);
	}
	
	// MY 반출 데이터셋 조회(다음뉴스)
	public List<DataRequest> selectMyDaumNewsExportRequest(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectMyDaumNewsExportRequest(dataRequest);
	}
	
	//MY 반출 데이터셋 (다음뉴스) 갯수
	public int selectMyDaumNewsExportRecords(DataRequest dataRequest, HttpSession session) throws Exception {
		dataRequest.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		return dataRequestMapper.selectMyDaumNewsExportRecords(dataRequest);
	}
	
	public List<DataRequest> selectApprovalDaumNewsRequest(DataRequest dataRequest)throws Exception{
		return dataRequestMapper.selectApprovalDaumNewsRequest(dataRequest);
	}
	
	public int selectApprovalDaumNewsRequestRecords(DataRequest dataRequest)throws Exception{
		return dataRequestMapper.selectApprovalDaumNewsRequestRecords(dataRequest);
	}
	
	public List<DataRequest> selectApprovalDaumNewsExportRequest()throws Exception{
		return dataRequestMapper.selectApprovalDaumNewsExportRequest();
	}
}
