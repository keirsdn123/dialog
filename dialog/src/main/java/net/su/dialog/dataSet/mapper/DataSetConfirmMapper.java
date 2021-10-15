package net.su.dialog.dataSet.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataSetCategoryVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.report.domain.ReportDomain;

@Repository("net.su.dialog.dataSet.mapper.DataSetConfirmMapper")
public interface DataSetConfirmMapper {
	
	public DataSetConfirmVo selectNormalDataInfo(DataSetConfirmVo datasetVo) throws Exception;
	
	public List<DataSetCategoryVo> selectNormalDataCategInfo(DataSetConfirmVo datasetVo) throws Exception;
	
	public DataSetConfirmVo selectFileInfo(DataSetConfirmVo datasetVo) throws Exception;
	
	public void createFileTable(Map<String,String> crmap) throws Exception;
	
	public void insertDataInFileTable(Map<String,Object> insertMap) throws Exception;
	
	public void dropFileTable(String tableName) throws Exception;
	
	public void updateNormalDataSetTableName(DataSetConfirmVo datasetVo) throws Exception;
	
	public void updateDatasetProcessingWhether(DataSetConfirmVo datasetVo) throws Exception;
	
	public String selectNormalDataSetTableName(DataSetConfirmVo datasetVo) throws Exception;
	
	public List<LinkedHashMap<String,Object>> selectNormalDatabase(DataSetConfirmVo datasetVo) throws Exception;
	
	public int selectNormalDataRowCount(DataSetConfirmVo datasetVo) throws Exception;
	
	public void updateRejectReason(DataSetConfirmVo datasetVo) throws Exception;
	
	public List<ReportDomain> selectReferenceReportList(DataSetConfirmVo datasetVo) throws Exception;
	
}
