package net.su.dialog.dataSet.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.report.domain.ReportDomain;

public interface DataSetConfirmService {

	
	public Map<String,Object> selectNormalDataSetInfo(DataSetConfirmVo datasetVo) throws Exception;
	
	public Map<String, Object> selectDataPreviewList(DataSetConfirmVo datasetVo) throws Exception;
	
	public Map<String,Object> selectFilePreviewList(DataSetConfirmVo datasetVo) throws Exception;
	
	public Map<String,Object> insertFileData(DataSetConfirmVo datasetVo, String colIndexObject, String colNameObject, String colTypeObject) throws Exception;
	
	public void createFileTable(Map<String,String> crmap) throws Exception;
	
	public void insertDataInFileTable(Map<String,Object> insertMap) throws Exception;
	
	public String selectNormalDataTableName(DataSetConfirmVo datasetVo) throws Exception;
	
	public Map<String, Object> selectNormalDatabase(DataSetConfirmVo datasetVo) throws Exception;
	
	public int selectNormalDataRowCount(DataSetConfirmVo datasetVo) throws Exception;
	
	public List<LinkedHashMap<String,Object>> selectNormalDatabasePaging(DataSetConfirmVo datasetVo) throws Exception;
	
	public void updateRejectReason(DataSetConfirmVo datasetVo) throws Exception;
	//연관 보고서 조회
	public List<ReportDomain> selectReferenceReportList(DataSetConfirmVo datasetVo) throws Exception;
	
	public void selectFileDownload(HttpServletResponse response , DataSetConfirmVo datasetVo) throws Exception;
	
}
