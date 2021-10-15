package net.su.dialog.dataSet.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.su.dialog.dataSet.domain.DataVizGroupVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.report.domain.ReportDomain;

public interface DataSetVizService {
	//칼럼명 들고온다		
	   public List<DataVizVo> getSelectBox(DataVizVo dataVizVo) throws Exception;
	   
	
	// 선택해서 만들어지는 그래프 bar,line,area
	public List<DataVizVo> makeChartView(DataVizVo dataVizVo) throws Exception;
	// 선택해서 만들어지는 그래프 pie,donut
	public List<HashMap<String, Object>> pieChartView(DataVizVo dataVizVo) throws Exception;
	// 선택해서 만들어지는 그래프 groupBar,stackAreaChart
	public List<HashMap<String, Object>> groupChartView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	// 상세조회시 바로 보이는 그래프 bar, line,area
	public List<DataVizVo> selectBLChart(DataVizVo dataVizVo) throws Exception;
	// 상세조회시 바로 보이는 그래프 pie,donut
	public List<HashMap<String, Object>> selectPDChart(DataVizVo dataVizVo) throws Exception;
	// 상세조회시 바로 보이는 그래프 group,stackArea
	public List<HashMap<String, Object>> selectGChart(DataVizGroupVo dataVizGroupVo) throws Exception;

	public void updateDataSetRequestViz(DataVizVo dataVizVo) throws Exception;

	public List<ReportDomain> selectDReferenceReportList(Dataset dvo) throws Exception;
	
	public DataVizVo selectVTitle(DataVizVo dataVizVo) throws Exception;
	
	public DataVizVo selectDBPreviewTitle(DataVizVo dataVizVo) throws Exception;
	
	public Map<String, Object> selectDBPreviewCol (DataVizVo dataVizVo) throws Exception; 
	
	public List<DataVizVo> selectDBdataList(String changeData, String normalDataTableTitle) throws Exception;
}
