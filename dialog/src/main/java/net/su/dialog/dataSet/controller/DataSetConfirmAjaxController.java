package net.su.dialog.dataSet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.service.DataSetConfirmService;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.report.domain.ReportDomain;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;

//@ResponseBody 안써도됨
//Ajax만
@RestController
@RequestMapping("/dataSetConfirm")
public class DataSetConfirmAjaxController {
	
	@Autowired
    private DataSetConfirmService datasetService;
	
	
	
//	상세조회
	@RequestMapping("/selectNormalDataSetInfo")
	public Map<String,Object> selectNormalDataSetInfo(DataSetConfirmVo datasetVo) throws Exception {
		return datasetService.selectNormalDataSetInfo(datasetVo);
	}
	
	//파일 미리보기
	@RequestMapping("/selectFilePreviewList")
	public Map<String,Object> selectFilePreviewList(DataSetConfirmVo datasetVo) throws Exception {
		return datasetService.selectFilePreviewList(datasetVo);
	}
	
	//db화 후 데이터 미리보기
	@RequestMapping("/selectDataPreviewList")
	public Map<String,Object> selectDataPreviewList(DataSetConfirmVo datasetVo) throws Exception {
		return datasetService.selectDataPreviewList(datasetVo);
	}
	
	//db화
	@RequestMapping("/insertFileData")
	public Map<String,Object> insertFileData(DataSetConfirmVo datasetVo, String colIndexObject, String colNameObject, String colTypeObject) throws Exception {
		Map<String,Object> map = datasetService.insertFileData(datasetVo, colIndexObject, colNameObject, colTypeObject);
		return map;
	}
	
	//일시 데이터 db화 확인 조회
	@RequestMapping("/selectNormalDatabase")
	public Map<String, Object> selectNormalDatabase(DataSetConfirmVo datasetVo) throws Exception {
		Map<String, Object> normalDatabaseMap = datasetService.selectNormalDatabase(datasetVo);
		return normalDatabaseMap;
	}
	
	@RequestMapping("/selectNormalDataRowCount")
	public int selectNormalDataRowCount(DataSetConfirmVo datasetVo) throws Exception{
		int rowCount = datasetService.selectNormalDataRowCount(datasetVo);
		return rowCount;
	}
	
	@RequestMapping("/selectNormalDatabasePaging")
	public List<LinkedHashMap<String,Object>> selectNormalDatabasePaging(DataSetConfirmVo datasetVo) throws Exception{
		List<LinkedHashMap<String,Object>> normalDatabase = datasetService.selectNormalDatabasePaging(datasetVo);
		return normalDatabase;
	}
	
	//승인 거부 사유 입력
	@RequestMapping("/updateRejectReason")
	public void updateRejectReason(DataSetConfirmVo datasetVo) throws Exception {
		datasetService.updateRejectReason(datasetVo);
	}
	//연관 보고서 조회
	@RequestMapping("/selectReferenceReportList")
	public List<ReportDomain> selectReferenceReportList(DataSetConfirmVo datasetVo) throws Exception {
		return datasetService.selectReferenceReportList(datasetVo);
	}
	
	//데이터 셋 상세조회 - 파일 다운로드
	@RequestMapping("/selectFileDownload")
	public void selectFileDownload(HttpServletResponse response, DataSetConfirmVo datasetVo) throws Exception{
		System.out.println("개발 소스 상세조회 - 파일 다운로드 컨트롤러");
		datasetService.selectFileDownload(response, datasetVo);
	}
}
