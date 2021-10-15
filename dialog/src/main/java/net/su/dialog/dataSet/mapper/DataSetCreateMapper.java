package net.su.dialog.dataSet.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.DataVizVo;

@Repository("net.su.dialog.dataSet.mapper.DataSetCreateMapper")
public interface DataSetCreateMapper {

	//생성DB컬럼명 조회
	public List<DataSetVo> selectDbDatasetCoList(String normalDataTableTitle) throws Exception;
	
	//시각화 요청설명 조회
	public DataSetVo selectVizList(DataSetVo dvo) throws Exception;

	//생성DB데이터 조회
	public List<DataSetVo> selectDbDatasetList(Map<String,String> dbMap) throws Exception;
	
	//가공후추가 팝업 선택 데이터 조회
	public List<DataSetVo> selectProcessList(Map<String,String> processMap) throws Exception;
	
	//표준데이터 컬럼명 등록
	public void insertStandarData(Map<String,Object> insertMap) throws Exception;
	
	//표준데이터 상세DB생성
	public void createStandarDetail(Map<String,String>createmap) throws Exception;
	
	//표준데이터 테이블 이름 수정
	public void updateStTableName(DataSetVo dvo) throws Exception;
	
	//표준데이터 상세DB등록
	public void insertStandarDataDetail(Map<String,Object> insertMap) throws Exception;

   //표준화 데이터 조회
   public List<DataSetVo> selectStandDatasetCoList(DataSetVo dvo) throws Exception;

	//표준화 데이터 조회
	public List<DataSetVo> selectStandDatasetList(DataSetVo dvo) throws Exception;
	
	//기본 시각화 설정
	public void updateViz(DataVizVo vizvo) throws Exception;
	
	//승인여부 변경
	public void updateStatus(DataVizVo vizvo) throws Exception;
	
	//표준화여부 변경
	public void updateVizWhether(DataVizVo vizvo) throws Exception;
}
