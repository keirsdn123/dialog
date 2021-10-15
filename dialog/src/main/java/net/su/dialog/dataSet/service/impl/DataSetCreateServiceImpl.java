package net.su.dialog.dataSet.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.StandardVo;
import net.su.dialog.dataSet.mapper.DataSetCreateMapper;
import net.su.dialog.dataSet.service.DataSetCreateService;


@Service
public class DataSetCreateServiceImpl implements DataSetCreateService {
	
	
	@Resource(name="net.su.dialog.dataSet.mapper.DataSetCreateMapper")
    private DataSetCreateMapper datasetCreateMapper;
	
	int insertCheck = 0;

	//생성DB컬럼명 조회
	public Map<String, Object> selectDbDatasetCoList(String normalDataTableTitle, DataSetVo dvo) throws Exception{

		Map<String, Object> selecMap = new HashMap<String, Object>();
		
		List<DataSetVo> coList = datasetCreateMapper.selectDbDatasetCoList(normalDataTableTitle);
		DataSetVo dvo1 = datasetCreateMapper.selectVizList(dvo);
		String vizRequests = dvo1.getVizRequests();
		selecMap.put("coList", coList);
		selecMap.put("vizRequests", vizRequests);
		
		return selecMap;
	}

	//생성DB데이터 조회
	public List<DataSetVo> selectDbDatasetList(String colNme,String normalDataTableTitle) throws Exception{

		Map<String, String> dbMap = new HashMap<String, String>();
		dbMap.put("colNme",colNme);
		dbMap.put("normalDataTableTitle",normalDataTableTitle);
		List<DataSetVo> list = datasetCreateMapper.selectDbDatasetList(dbMap);
		return list;
	}

	//가공후추가 팝업 선택 데이터 조회
	public List<DataSetVo> selectProcessList(String colNme,String normalDataTableTitle) throws Exception{
		
		Map<String, String> processMap = new HashMap<String, String>();
		processMap.put("colNme",colNme);
		processMap.put("normalDataTableTitle",normalDataTableTitle);
		return datasetCreateMapper.selectProcessList(processMap);
	}
	
	//표준데이터 등록 및 생성
	public Map<String,Object> insertStandarData(String totalObject, int dataCode, String normalDataTableTitle) throws Exception{
		
		Map<String, Object> errorTypeMap = new HashMap<String, Object>();
		DataSetVo dvo = new DataSetVo(); 
		/*표준데이터 컬럼명 등록*/
		
		String insertList = "INSERT INTO normal_data_standard_info (data_code,";
		String insertStColNme = "SELECT "+dataCode+","; 
		String insertStList = "INSERT INTO `"+normalDataTableTitle+"_st"+dataCode+"_detail`(pause_standar_seq,";
		String insertStQuery = "";
		int d = 1;
		int v = 6;
		List<StandardVo> totalList = new ObjectMapper().readValue(totalObject, new TypeReference<List<StandardVo>>(){});
		
		for (int i = 0; i<totalList.size(); i++){
			StandardVo totalInfo = totalList.get(i);
			if (totalInfo.getStDataType().equals("int") || totalInfo.getStDataType().equals("double")){
				if(totalInfo.getStLableNme().equals("")) {
					insertList += " pause_standar_column"+d+",";
					insertStColNme += "'"+totalInfo.getStColNme()+"',";
				}else {
					insertList += " pause_standar_column"+d+", pause_standar_column"+d+"_lable,";
					insertStColNme += "'"+totalInfo.getStColNme()+"','"+totalInfo.getStLableNme()+"',";
				}
				
				insertStList += " pause_standar_column"+d+",";
				insertStQuery += totalInfo.getStQryList()+",";
				d++;
			}
		}
		for (int i = 0; i<totalList.size(); i++){
			StandardVo totalInfo = totalList.get(i);
			if (totalInfo.getStDataType().equals("varchar")){
				insertList += " pause_standar_column"+v+",";
				insertStColNme += "'"+totalInfo.getStColNme()+"',";
				insertStList += " pause_standar_column"+v+",";
				insertStQuery += totalInfo.getStQryList()+",";
				v++;
			}
		}

		insertList = insertList+"pause_standar_date)";
		insertStColNme = insertStColNme+"CURDATE() FROM DUAL WHERE NOT EXISTS (SELECT * FROM normal_data_standard_info WHERE data_code="+dataCode+")";
		insertStList = insertStList.substring(0, insertStList.length()-1)+")";
		insertStQuery = insertStQuery.substring(0, insertStQuery.length()-1)+" FROM `"+normalDataTableTitle+"`";
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
//		insertMap.put("stId", 0);
		insertMap.put("insertList", insertList);
		insertMap.put("insertStColNme", insertStColNme);
		insertMap.put("insertStList", insertStList);
		insertMap.put("insertStQuery", insertStQuery);
	
		
//		if(insertCheck == 0) {
			try {
//				insertCheck = 1;
				datasetCreateMapper.insertStandarData(insertMap);
				System.out.println("표준 컬럼명 리스트 등록완료"+insertMap.get("stId"));
			}catch(Exception e) {
				System.out.println(e.getMessage());
				System.out.println("표준 컬럼명 리스트 등록실패");
				errorTypeMap.put("errorType", 1);
				System.out.println("타입은"+errorTypeMap.get("errorType"));
				return errorTypeMap;
			}
//		}else {
//			errorTypeMap.put("erorrType", 2);
//			return errorTypeMap;
//		}
		

		/*표준데이터 상세테이블 생성*/
		String createStandarTable = "CREATE TABLE `"+normalDataTableTitle+"_st"+dataCode+"_detail`(`pause_standar_seq` int(11) NOT NULL," + 
				"  `pause_standar_detail_seq` int(11) NOT NULL AUTO_INCREMENT," + 
				"  `pause_standar_column1` double DEFAULT NULL," + 
				"  `pause_standar_column2` double DEFAULT NULL,"+ 
				"  `pause_standar_column3` double DEFAULT NULL," + 
				"  `pause_standar_column4` double DEFAULT NULL," + 
				"  `pause_standar_column5` double DEFAULT NULL," + 
				"  `pause_standar_column6` varchar(500) DEFAULT NULL," + 
				"  `pause_standar_column7` varchar(500) DEFAULT NULL," + 
				"  `pause_standar_column8` varchar(500) DEFAULT NULL," + 
				"  `pause_standar_column9` varchar(500) DEFAULT NULL," + 
				"  `pause_standar_column10` varchar(500) DEFAULT NULL," + 
				"  PRIMARY KEY (`pause_standar_detail_seq`)" + 
				") ENGINE=InnoDB DEFAULT CHARSET=utf8";

		dvo.setStandarTbTitle(normalDataTableTitle+"_st"+dataCode+"_detail");
		dvo.setDataCode(dataCode);
		
		try {
			Map<String,String> createmap = new HashMap<String,String>();
			createmap.put("createStandarTable",createStandarTable);
			datasetCreateMapper.createStandarDetail(createmap);
			datasetCreateMapper.updateStTableName(dvo);
			System.out.println("테이블 생성 완료");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("테이블 생성 실패");
			errorTypeMap.put("errorType", 3);
			return errorTypeMap;
		}
		
		try {
			datasetCreateMapper.insertStandarDataDetail(insertMap);
			System.out.println("표준상세 테이블 등록완료");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("표준상세 테이블 등록실패");
			errorTypeMap.put("errorType", 4);
			return errorTypeMap;
		}
		return errorTypeMap;
	}
	
	//표준화 데이터 조회
	public Map<String, Object> selectStandDatasetCoList(DataSetVo dvo) throws Exception{

		List<DataSetVo> standColList = datasetCreateMapper.selectStandDatasetCoList(dvo);
		List<DataSetVo> standList = datasetCreateMapper.selectStandDatasetList(dvo);
		
		Map<String, Object> standMap = new HashMap<String, Object>();
		standMap.put("standColList", standColList);
		standMap.put("standList", standList);
		return standMap;
	}
	
	//기본 시각화 설정
	public void updateViz(DataVizVo vizvo) throws Exception {
		datasetCreateMapper.updateViz(vizvo);
		datasetCreateMapper.updateStatus(vizvo);
		datasetCreateMapper.updateVizWhether(vizvo);
	}
	
	
}
