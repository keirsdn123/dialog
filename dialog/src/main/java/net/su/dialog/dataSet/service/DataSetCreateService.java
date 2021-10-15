package net.su.dialog.dataSet.service;

import java.util.List;
import java.util.Map;
import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.DataVizVo;

public interface DataSetCreateService {


	//수진
	//생성DB컬럼명 조회
	public Map<String, Object> selectDbDatasetCoList(String normalDataTableTitle, DataSetVo dvo) throws Exception;
	
	//생성DB데이터 조회
	public List<DataSetVo> selectDbDatasetList(String colNme,String normalDataTableTitle) throws Exception;

	//가공후추가 팝업 선택 데이터 조회
	public List<DataSetVo> selectProcessList(String colNme,String normalDataTableTitle) throws Exception;
	
	//표준데이터 등록 및 생성
	public Map<String,Object> insertStandarData(String totalObject, int dataCode, String normalDataTableTitle) throws Exception;

	//표준화 데이터 조회
	public Map<String, Object> selectStandDatasetCoList(DataSetVo dvo) throws Exception;
	
	public void updateViz(DataVizVo vizvo) throws Exception;

}
