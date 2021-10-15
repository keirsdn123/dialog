package net.su.dialog.dataSet.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.User;
import net.su.dialog.schedule.domain.SchVo;

@Repository("net.su.dialog.dataSet.mapper.DataReqeustMapper")
public interface DataRequestMapper {

	// 다음 뉴스 데이터수집 요청 등록
	public void insertDaumCollectRequest(DataRequest dataRequest) throws Exception;

	// 다음 뉴스 데이터 수집 요청 조회
	public List<DataRequest> selectMyDaumCollectRequest(DataRequest dataRequest) throws Exception;
	
	//다음 뉴스 데이터 수집 요청 게시글 수
	public int selectDaumRequestRecords(DataRequest dataRequest) throws Exception;

	// 기타 데이터 수집 요청 등록
	public void insertActCollectRequest(DataRequest dataRequest) throws Exception;

	// 기타 데이터 수집 요청 조회
	public List<DataRequest> selectMyActCollectRequest(DataRequest dataRequest) throws Exception;
	
	//기타 데이터 수집 요청 게시글 수
	public int selectActRequestRecords(DataRequest dataRequest) throws Exception;

	// 기타 데이터 수집 요청 상세 조회
	public DataRequest infoMyActCollectRequest(DataRequest dataRequest) throws Exception;

	// 다음 뉴스 데이터 수집 요청 상세 조회
	public DataRequest infoMyDaumCollectRequest(DataRequest dataRequest) throws Exception;
	
	// 반출 요청 RSS 데이터셋 조회 
	public List<DataRequest> selectRssDtSet(DataRequest dataRequest) throws Exception;
	
	// 반출 요청 쇼핑 데이터셋 조회 
	public List<DataRequest> selectShopDtSet(DataRequest dataRequest) throws Exception;
	// 데이터 반출 요청 관리 등록
	public void insertExportRequest2(DataRequest dataRequest) throws Exception;
	
	// 데이터 반출 요청 등록
	public void insertExportRequest(DataRequest dataRequest) throws Exception;
	
	// rss 뉴스 데이터 반출 요청 조회
	public List<DataRequest> selectMyRssExportRequest(DataRequest dataRequest) throws Exception;
	
	//rss 데이터 반출 요청 게시글 수
	public int selectRssRequestRecords(DataRequest dataRequest) throws Exception;
	
	// 쇼핑 데이터 반출 요청 조회
	public List<DataRequest> selectMyShopExportRequest(DataRequest dataRequest) throws Exception;
	
	//쇼핑 데이터 반출 요청 게시글 수
	public int selectShopRequestRecords(DataRequest dataRequest) throws Exception;
	
	// rss 데이터 반출 요청 상세 조회
	public DataRequest infoMyRssExportRequest(DataRequest dataRequest) throws Exception;

	// 다음 뉴스 데이터 수집 요청 관리자 조회
	public List<DataRequest> selectApprovalDaumRequest(DataRequest dataRequest) throws Exception;
	
	//다음 뉴스 데이터 수집 요청 게시글 수
	public int selectApprovalDaumRequestRecords(DataRequest dataRequest) throws Exception;
	
	// 기타 데이터 수집 요청 관리자 조회
	public List<DataRequest> selectApprovalActRequest(DataRequest dataRequest) throws Exception;
	
	//기타 데이터 수집 요청 게시글 수
	public int selectApprovalActRequestRecords(DataRequest dataRequest) throws Exception;
	
	//rss 데이터 반출 요청 관리자 조회
	public List<DataRequest> selectApprovalRssRequest(DataRequest dataRequest) throws Exception;
	
	//rss 데이터 반출 요청 게시글 수
	public int selectApprovalRssRequestRecords(DataRequest dataRequest) throws Exception;
	
	//쇼핑 데이터 반출 요청 관리자 조회
	public List<DataRequest> selectApprovalShopRequest(DataRequest dataRequest) throws Exception;
	
	//쇼핑 데이터 반출 요청 게시글 수
	public int selectApprovalShopRequestRecords(DataRequest dataRequest) throws Exception;
	
	// 기타 데이터 수집 요청 승인 거부
	public void updateApprovalActRequest(DataRequest dataRequest) throws Exception;
		
	// 시각화 요청 조회
	public List<Dataset> selectMyVizRequest(Dataset dataset) throws Exception;
	
	// 시각화 요청 게시글 수
	public int selectMyVizRequestRoecords(Dataset dataset) throws Exception;
	
	// 데이터 승인관리 > 시각화 승인관리 조회
	public List<Dataset> selectApprovalVizRequest(Dataset dataset) throws Exception;
	
	//##
	// 데이터 승인관리 > 데이터 수집요청 상세조회
	public DataRequest infoDataCollection(DataRequest dataRequest) throws Exception;
	
	// 데이터 승인관리 > 데이터 수집요청 상세조회
	public DataRequest infoDataExport(DataRequest dataRequest) throws Exception;
	
	public SchVo selectDataExportFile(DataRequest dataRequest) throws Exception;
	
	public List<DataRequest> selectApprovalRssScheRequest(DataRequest dataRequest) throws Exception;
	
	//	다음 뉴스 데이터 수집 요청 관리자 조회
	public List<DataRequest> selectApprovalDaumScheRequest(DataRequest dataRequest) throws Exception;
	
	//쇼핑 데이터 반출 요청 관리자 조회
	public List<DataRequest> selectApprovalShopScheRequest(DataRequest dataRequest) throws Exception;



	//추가
	public int selectVizRequestRowCount(Dataset dataset) throws Exception;
	//다음뉴스 데이터셋 조회
	public List<DataRequest> selectDaumDtSet() throws Exception;
	//
	public DataRequest selectDaumDtSetInfo(DataRequest dataRequest) throws Exception;
	//MY다음뉴스 반출요청 조회
	public List<DataRequest> selectMyDaumNewsExportRequest(DataRequest dataRequest) throws Exception;
	//MY다음뉴스 반출요청 갯수
	public int selectMyDaumNewsExportRecords(DataRequest dataRequest) throws Exception;
	//
	public List<DataRequest> selectApprovalDaumNewsRequest(DataRequest dataRequest)throws Exception;
	//
	public int selectApprovalDaumNewsRequestRecords(DataRequest dataRequest)throws Exception;
	//
	public List<DataRequest> selectApprovalDaumNewsExportRequest()throws Exception;
}
