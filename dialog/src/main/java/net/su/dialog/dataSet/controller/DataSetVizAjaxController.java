package net.su.dialog.dataSet.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.DataVizGroupVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.service.DataSetVizService;
import net.su.dialog.report.domain.ReportDomain;



@RestController
public class DataSetVizAjaxController {

		@Autowired
    	private DataSetVizService dataSetVizService;
	
	
		//칼럼명 들고오기
	   @RequestMapping("/getSelectBox")
	      public List<DataVizVo> getSelectBox(DataVizVo dataVizVo)throws Exception{
	         System.out.println("가는가");
	         return dataSetVizService.getSelectBox(dataVizVo);
	      }
		//바, 라인차트
		@RequestMapping("/makeChartView")
		public List<DataVizVo> makeChartView(DataVizVo dataVizVo)throws Exception{
			System.out.println("받아오는지"+dataVizVo.getNormalDataStandardTableTitle());
			System.out.println("조건받아오는지"+dataVizVo.getCondition());
			System.out.println("인포받아오는지"+dataVizVo.getXcolInfo());
			return dataSetVizService.makeChartView(dataVizVo);
		}
		// 그룹 차트
		@RequestMapping("/groupChartView")
		public List<HashMap<String, Object>> groupChartView(DataVizGroupVo dataVizGroupVo) throws Exception {
			System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"+dataVizGroupVo.getCondition() );
			
			return (List<HashMap<String, Object>>) dataSetVizService.groupChartView(dataVizGroupVo);
		}
		
		// 원, 파이 차트
		@RequestMapping("/pieChartView")
		public List<HashMap<String, Object>> pieChartView(DataVizVo dataVizVo) throws Exception {
			System.out.println("아아아앙앙ㅇㅇㅇㅇㅇㅇ"+dataVizVo.getCondition() );
			return (List<HashMap<String, Object>>) dataSetVizService.pieChartView(dataVizVo);
		}
		
		//상세조회시 보이는 그래프 bar,Line,stack
		@RequestMapping("/selectBLChart")
		public List<DataVizVo> selectBarChart(DataVizVo dataVizVo)throws Exception{
			System.out.println("selectBLChart받아오는지"+dataVizVo.getNormalDataStandardTableTitle());
			System.out.println("selectBLChart조건받아오는지"+dataVizVo.getCondition());
			return dataSetVizService.selectBLChart(dataVizVo);
		}
		
		//상세조회시 보이는 그래프 donut, pie
		@RequestMapping("/selectPDChart")
		public List<HashMap<String, Object>> selectPDChart(DataVizVo dataVizVo) throws Exception {
			System.out.println("아아아앙앙ㅇㅇㅇㅇㅇㅇ"+dataVizVo.getCondition() );
			return (List<HashMap<String, Object>>) dataSetVizService.selectPDChart(dataVizVo);
		}
		
		//상세조회시 보이는 group,stackArea
		@RequestMapping("/selectGChart")
		public List<HashMap<String, Object>> selectGChart(DataVizGroupVo dataVizGroupVo) throws Exception {
			System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"+dataVizGroupVo.getCondition());		
			return (List<HashMap<String, Object>>) dataSetVizService.selectGChart(dataVizGroupVo);
		}
		//데이터셋 상세조회 - 연관 보고서 조회
		@RequestMapping("/selectDReferenceReportList")
		public List<ReportDomain> selectDReferenceReportList(Dataset dvo) throws Exception {
			return dataSetVizService.selectDReferenceReportList(dvo);
		}
		// 시각화 요청 
		@RequestMapping("/updateDataSetRequestViz")
		public void updateDataSetRequestViz(DataVizVo dataVizVo) throws Exception {
			dataSetVizService.updateDataSetRequestViz(dataVizVo);
		}
		//범주, 수치, 범례 바로 보이기
		@RequestMapping("/selectVTitle")
		public DataVizVo selectVTitle(DataVizVo dataVizVo) throws Exception {
			return dataSetVizService.selectVTitle(dataVizVo);
		}
		//데이터셋 상세조회 - DB화된 데이터 미리보기1 (타이틀 가지고 오기)
		@RequestMapping("/selectDBPreviewTitle")
		public DataVizVo selectDBPreviewTitle (DataVizVo dataVizVo) throws Exception {
			return dataSetVizService.selectDBPreviewTitle(dataVizVo);
		}
		//데이터셋 상세조회 - DB화된 데이터 미리보기2 (컬럼명 들고오기)
		@RequestMapping("/selectDBPreviewCol")
		public Map<String, Object> selectDBPreviewCol(DataVizVo dataVizVo) throws Exception {
			System.out.println("타이틀 제대로 들고 오는지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@~"+ dataVizVo.getNormalDataTableTitle());
			return dataSetVizService.selectDBPreviewCol(dataVizVo);
		}
		//데이터셋 상세조회  - DB화 된 데이터 미리보기 3(데이터 틀고오기)
		@RequestMapping("/selectDBdataList")
		public List<DataVizVo> selectDBdataList(String changeData, String normalDataTableTitle) throws Exception {
			System.out.println("@@@@@@@@타이틀 제대로 들고 오는지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@~");
			List<DataVizVo> blist = dataSetVizService.selectDBdataList(changeData,normalDataTableTitle);
			return blist;
		}
		
}
