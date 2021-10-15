package net.su.dialog.dataSet.mapper;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataVizGroupVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.report.domain.ReportDomain;


@Repository("net.su.dialog.dataSet.mapper.DataSetVizMapper")
public interface DataSetVizMapper {

	public List<DataVizVo> getSelectBox(DataVizVo dataVizVo) throws Exception;
	
	//public List<DataVizVo> getOtherValue(DataVizVo dataVizVo) throws Exception;
	
	//시각화 요청
	public void updateDataSetRequestViz(DataVizVo dataVizVo) throws Exception;
	
	public List<ReportDomain> selectDReferenceReportList(Dataset dvo) throws Exception;
	
	public DataVizVo selectVFTitle(DataVizVo dataVizVo) throws Exception;
	
	public DataVizVo selectVTitle(DataVizVo sco) throws Exception;
	
	public DataVizVo selectDBPreviewTitle(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectDBPreviewCol(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectDBdataList(Map<String, String> dbDataMap) throws Exception;
	
	// 일반 그래프
	public List<DataVizVo> makeChartView(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> makeChartSumView(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> makeChartAvgView(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> makeChartMaxView(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> makeChartMinView(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> makeChartCountView(DataVizVo dataVizVo) throws Exception;
	
	//상세조회시 바로 보이는 그래프(bar, line)
	public List<DataVizVo> selectBLChart(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectBLSumChart(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectBLAvgChart(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectBLMaxChart(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectBLMinChart(DataVizVo dataVizVo) throws Exception;
	
	public List<DataVizVo> selectBLCountChart(DataVizVo dataVizVo) throws Exception;
	
	//상세조회시 바로 보이는 그래프(pie, donut)
	public List<HashMap<String,Object>> selectPDChart(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> selectPDSumChart(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> selectPDAvgChart(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> selectPDMaxChart(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> selectPDMinChart(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> selectPDCountChart(DataVizVo dataVizVo) throws Exception;
	
	//상세조회시 바로 보이는 그래프(group)
	public List<HashMap<String,Object>> selectGChart(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> selectGSumChart(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> selectGAvgChart(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> selectGMaxChart(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> selectGMinChart(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> selectGCountChart(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	//	그룹바 차트
	public List<HashMap<String,Object>> groupChartView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> groupChartSumView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> groupChartAvgView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> groupChartMaxView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> groupChartMinView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	public List<HashMap<String,Object>> groupChartCountView(DataVizGroupVo dataVizGroupVo) throws Exception;
	
	// 파이, 도넛 차트
	public List<HashMap<String,Object>> pieChartView(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> pieChartSumView(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> pieChartAvgView(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> pieChartMaxView(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> pieChartMinView(DataVizVo dataVizVo) throws Exception;
	
	public List<HashMap<String,Object>> pieChartCountView(DataVizVo dataVizVo) throws Exception;

	
	
}
