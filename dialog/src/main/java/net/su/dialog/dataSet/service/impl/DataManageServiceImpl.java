package net.su.dialog.dataSet.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.DataManage;
import net.su.dialog.dataSet.mapper.DataManageMapper;
import net.su.dialog.dataSet.service.DataManageService;

@Service
public class DataManageServiceImpl implements DataManageService {

	@Resource(name = "net.su.dialog.dataSet.mapper.DataManageMapper")
	private DataManageMapper dataManageMapper;
	
	//카테고리 조회
	public List<DataManage> getCategoryList() throws Exception {
		List<DataManage> cateList = dataManageMapper.getCategoryList();
		int count = 0;
		for(int i=0; i<cateList.size(); i++) {
			count += cateList.get(i).getCateCount();
		};
		cateList.get(0).setCateCount(count);
		
		return cateList;
	}
	
	
	
	
	//데이터셋 조회
	public Map<String, Object> selectDtset(DataManage dataManage) throws Exception {
		Map<String, Object> selectDtset = new HashMap<String, Object>();
		
		List<DataManage> selectDtset1 =  dataManageMapper.selectDtset1(dataManage); //일시데이터셋 조회
		List<DataManage> selectDtset2 =  dataManageMapper.selectDtset2(dataManage); //정기데이터셋 조회
		
		int countDtset1 = dataManageMapper.countDtset1(dataManage); //일시데이터셋갯수
		int countDtset2 = dataManageMapper.countDtset2(dataManage); //정기데이터셋갯수
		
		selectDtset.put("selectDtset1", selectDtset1);
		selectDtset.put("selectDtset2", selectDtset2);
		selectDtset.put("countDtset1", countDtset1);
		selectDtset.put("countDtset2", countDtset2);
		return selectDtset;
	}
	
	// raw데이터, 표준데이터정보, 표준데이터상세 조회
	public Map<String, Object> infoRawData(DataManage dataManage) throws Exception {
		Map<String, Object> infoRawData = new HashMap<String, Object>();

		DataManage tbTitle = dataManageMapper.selectTbTitle(dataManage); // 테이블명 조회
		
		if (dataManage.getDataType().equals("일시")) {
			tbTitle.setDataType("일시");
		} else {
			tbTitle.setDataType("정기");
			int countRecode = dataManageMapper.countRawRecode(tbTitle); // raw데이터 레코드 행수
			tbTitle.setRecodeCount(countRecode);
			
			if(tbTitle.getNormalDataStandardTableTitle() != null) {
				int countStandardRecode = dataManageMapper.countStandardRecode(tbTitle); // 표준데이터 레코드 행수
				tbTitle.setRecodeStandardCount(countStandardRecode);
			}
		}

		System.out.println("raw데이터 테이블 명은: " + tbTitle.getNormalDataTableTitle());
		System.out.println("표준데이터 테이블 명은: " + tbTitle.getNormalDataStandardTableTitle());

		List<LinkedHashMap<String, Object>> infoRawDataRecode = dataManageMapper.infoRawDataRecode(tbTitle); // raw데이터 레코드 조회
		System.out.println("raw데이터 레코드: " + infoRawDataRecode);

		Set<String> infoRawDataColumn = infoRawDataRecode.get(0).keySet(); // raw데이터 컬럼
		System.out.println("raw데이터 컬럼:" + infoRawDataColumn);

		List<DataManage> selectRegularTb = dataManageMapper.selectRegularTb(dataManage); // 테이블 구조 조회
		
		if(tbTitle.getNormalDataStandardTableTitle() != null) {
			List<DataManage> infoSdDataRecode = dataManageMapper.infoSdDataRecode(dataManage); // 표준데이터 정보 조회
			List<DataManage> infoSdDataDetailRecode = dataManageMapper.infoSdDataDetailRecode(tbTitle); // 표준데이터 상세 조회
			infoRawData.put("infoSdDataRecode", infoSdDataRecode);
			infoRawData.put("infoSdDataDetailRecode", infoSdDataDetailRecode);
		} 
		
		infoRawData.put("infoRawDataRecode", infoRawDataRecode);
		infoRawData.put("infoRawDataColumn", infoRawDataColumn); 
		infoRawData.put("selectRegularTb", selectRegularTb);
		infoRawData.put("tbTitle", tbTitle);
		
		return infoRawData;
	}
	
	// 테이블구조에 따른 raw데이터레코드 조회
	public Map<String, Object> infoRd(DataManage dataManage) throws Exception {
		Map<String, Object> infoRd = new HashMap<String, Object>();
		
		if (dataManage.getDataType().equals("정기")) {
			int countRecode = dataManageMapper.countRawRecode(dataManage); // raw데이터 레코드 행수
			dataManage.setRecodeCount(countRecode);
		} 
			
		List<LinkedHashMap<String, Object>> infoRawDataRecode = dataManageMapper.infoRawDataRecode(dataManage); // raw데이터 레코드 조회
		Set<String> infoRawDataColumn = infoRawDataRecode.get(0).keySet(); // raw데이터 컬럼

		infoRd.put("infoRawDataRecode", infoRawDataRecode);
		infoRd.put("infoRawDataColumn", infoRawDataColumn); 
		return infoRd;
	}

}
