package net.su.dialog.dataSet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.StandardVo;
import net.su.dialog.dataSet.service.DataSetCreateService;

@RestController
@RequestMapping("/dataSetCreate")
public class DataSetCreateAjaxController {
	
	@Autowired
    private DataSetCreateService datasetCreateService;

	//생성DB컬럼명 조회
	@RequestMapping("/selectDbDatasetCoList")
	public Map<String, Object> selectDbDatasetCoList(String normalDataTableTitle, DataSetVo dvo) throws Exception {
		return datasetCreateService.selectDbDatasetCoList(normalDataTableTitle, dvo);
	}
	
	//생성DB데이터 조회
	@RequestMapping("/selectDbDatasetList")
	public List<DataSetVo> selectDbDatasetList(String colNme,String normalDataTableTitle) throws Exception {
		List<DataSetVo> blist = datasetCreateService.selectDbDatasetList(colNme,normalDataTableTitle);

		return blist;
	}
	//가공후추가 팝업 선택 데이터 조회
	@RequestMapping("/selectProcessList")
	public List<DataSetVo> selectProcessList(String colNme,String normalDataTableTitle) throws Exception {
		return datasetCreateService.selectProcessList(colNme,normalDataTableTitle);
	}
	
	//표준데이터 등록 및 생성
	@RequestMapping(value="/insertStandarData", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String,Object> insertStandarData(String totalObject, int dataCode, String normalDataTableTitle) throws Exception {
		return datasetCreateService.insertStandarData(totalObject, dataCode, normalDataTableTitle);
	}
	
	//표준화 데이터 조회
	@RequestMapping("/selectStandDatasetCoList")
	public Map<String, Object> selectStandDatasetCoList(DataSetVo dvo) throws Exception {
		return datasetCreateService.selectStandDatasetCoList(dvo);
	}
	//기본 시각화 설정
	@RequestMapping("/updateViz")
	public void updateViz(DataVizVo vizvo) throws Exception {
		datasetCreateService.updateViz(vizvo);
	}

}
