package net.su.dialog.dataSet.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.commons.io.FileUtils;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.eventusermodel.ReadOnlySharedStringsTable;
import org.apache.poi.xssf.eventusermodel.XSSFReader;
import org.apache.poi.xssf.model.StylesTable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.supercsv.cellprocessor.Optional;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvListReader;
import org.supercsv.io.ICsvListReader;
import org.supercsv.prefs.CsvPreference;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.su.dialog.dataSet.domain.DataSetCategoryVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.StandardVo;
import net.su.dialog.dataSet.excelFileRead.CharsetDetector;
import net.su.dialog.dataSet.excelFileRead.Sheet2ListHandler;
import net.su.dialog.dataSet.excelFileRead.SheetHandler;
import net.su.dialog.dataSet.excelFileRead.excelCellRef;
import net.su.dialog.dataSet.excelFileRead.excelReadOption;
import net.su.dialog.dataSet.mapper.DataSetConfirmMapper;
import net.su.dialog.dataSet.service.DataSetConfirmService;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.report.domain.ReportDomain;

@Service
public class DataSetConfirmServiceImpl implements DataSetConfirmService {
	
	@Resource(name="net.su.dialog.dataSet.mapper.DataSetConfirmMapper")
    private DataSetConfirmMapper datasetMapper;
	
	
	
	//시각화 요청 내용 상세조회
	public Map<String,Object> selectNormalDataSetInfo(DataSetConfirmVo datasetVo) throws Exception{
		/*데이터셋 상세정보 내용*/
		DataSetConfirmVo detailDataInfo = datasetMapper.selectNormalDataInfo(datasetVo);
		/*카테고리 내용*/
		List<DataSetCategoryVo> dataCateInfoList = datasetMapper.selectNormalDataCategInfo(datasetVo);
		/*카테고리 화면에 보기 좋게 나열하기 위해 배열로 재 정렬*/
		List<String> dataCateInfo = new ArrayList<String>();
		
		if(dataCateInfoList.get(0).getCateTitle2() != null) {
			dataCateInfo.add(dataCateInfoList.get(0).getCateTitle1()+" > ");
			for(int i=0; i<dataCateInfoList.size()-1; i++) {
				dataCateInfo.add(dataCateInfoList.get(i).getCateTitle2()+", ");
			}
			dataCateInfo.add(dataCateInfoList.get(dataCateInfoList.size()-1).getCateTitle2());
		}
		else {
			dataCateInfo.add(dataCateInfoList.get(0).getCateTitle1());
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		/*이미 db화가 되어 있는 데이터 셋인지 확인 (파일 데이터 db화까지만 하고 표준데이터 생성하지 못했을 경우 체크)*/
		if(datasetMapper.selectNormalDataSetTableName(datasetVo) != null) {
			map.put("dbcheck", 1);
		} else {
			map.put("dbcheck", 0);
		}
		
		
		map.put("dataDetailInfo", detailDataInfo);
		map.put("dataCategoryInfo", dataCateInfo);
		return map;
	}
	
	public Map<String, Object> selectDataPreviewList(DataSetConfirmVo datasetVo) throws Exception{
		String normalDataTableName = selectNormalDataTableName(datasetVo);
		
		datasetVo.setNormalDataTableTiltle("`"+normalDataTableName+"`");
		datasetVo.setCurrentPage(1);
		datasetVo.setPerPage(10);
		List<LinkedHashMap<String,Object>> dataPreviewList = datasetMapper.selectNormalDatabase(datasetVo);
		Set<String> dataColName = dataPreviewList.get(0).keySet();
		
		Map<String, Object> normalDataMap = new HashMap<String, Object>();
		
		normalDataMap.put("dataPreviewList", dataPreviewList);
		normalDataMap.put("dataColName", dataColName);
		
		return normalDataMap;
	}
	
	//시각화 요청 데이터 미리보기
	public Map<String,Object> selectFilePreviewList(DataSetConfirmVo datasetVo) throws Exception {
		long startTime = System.currentTimeMillis();
		
		datasetVo = datasetMapper.selectFileInfo(datasetVo);
		
		File dataFile = new File(datasetVo.getFilePath());
		
		List<List<String>> columnDataLists = new ArrayList<List<String>>();
		
		if(datasetVo.getFileExtension().equals(".csv")) {
			//csv 타입 데이터 읽어오기
			columnDataLists = readCsvFile(datasetVo);
		} else if(datasetVo.getFileExtension().equals(".xlsx")) {
//			columnDataLists = readExcelFile(dataFile);
			try {
				//xlsx 타입 데이터 읽어오기 (대용량까지 가능)
				columnDataLists = readLargeExcelFile(dataFile);
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("sax excel parsing 실패");
			}		
		} else if(datasetVo.getFileExtension().equals(".xls")) {
			//xls 타입 데이터 읽어오기
			columnDataLists = xlsFileRead(dataFile);
		}
		
		ArrayList<String> columnNameList = new ArrayList<String>();
		
		/*칼럼 데이터 타입*/
		ArrayList<String> tempList = new ArrayList<String>();
		ArrayList<String> columnTypeList = new ArrayList<String>();
		String valueType = "";
		for(int colIndex=0; colIndex<columnDataLists.size(); colIndex++) {
			for(int dataIndex=1; dataIndex < columnDataLists.get(colIndex).size(); dataIndex++) {
				String value = columnDataLists.get(colIndex).get(dataIndex);
				if(value == null) {
					value="";
				}
				else if(excelReadOption.tryParseInt(value)) {
					value="INT";
				}
				else if(excelReadOption.tryParseDouble(value)) {
					value="DOUBLE";
				}
				else {
					value="VARCHAR";
				}
				tempList.add(value);
			}
			
			if(tempList.contains("VARCHAR")) {
				valueType = "VARCHAR";
			} else if(tempList.contains("DOUBLE")) {
				valueType = "DOUBLE";
			} else if(tempList.contains("INT")) {
				valueType = "INT";
			} else {
				valueType = "unknown";
			}
			tempList.clear();
			columnTypeList.add(valueType);
			
			columnNameList.add(columnDataLists.get(colIndex).get(0));
		}
		
		
		/*데이터 행별로 담기*/
		List<List<String>> dataValueLists = new ArrayList<List<String>>();
		for(int dataIndex=1; dataIndex < columnDataLists.get(0).size(); dataIndex++) {
			String value = "";
			tempList = new ArrayList<String>();
			for(int colIndex = 0; colIndex < columnDataLists.size(); colIndex++) {
				value = columnDataLists.get(colIndex).get(dataIndex);
				tempList.add(value);
				
			}
			dataValueLists.add(tempList);
		}
		
		List<List<String>> previewList = new ArrayList<List<String>>();
		int maxLength = 10;
		if(dataValueLists.size()<10) {
			maxLength = dataValueLists.size();
		}
		for(int rowIndex = 0; rowIndex < maxLength; rowIndex++) {
			previewList.add(dataValueLists.get(rowIndex));
		}
		
		/*데이터 인덱스 번호 리스트*/
		List<Integer> dataIndexList = new ArrayList<Integer>();
		for (int i=0; i < columnNameList.size(); i++) {
			dataIndexList.add(i);
		}
		
		
		Map<String,Object> excelDataList = new HashMap<String,Object>();
		
		/*이미 db화가 되어 있는 데이터 셋인지 확인 (파일 데이터 db화까지만 하고 표준데이터 생성하지 못했을 경우 체크)*/
		if(datasetMapper.selectNormalDataSetTableName(datasetVo) != null) {
			excelDataList.put("dbcheck", 1);
		} else {
			excelDataList.put("dbcheck", 0);
		}
		
		excelDataList.put("columnNameList", columnNameList); //칼럼명 리스트
		excelDataList.put("columnTypeList", columnTypeList); //칼럼 데이터 타입 리스트
		excelDataList.put("dataValueLists", dataValueLists); //행별 데이터 리스트
//		excelDataList.put("columnDataLists", columnDataLists); //열별 데이터 리스트
		excelDataList.put("previewList", previewList); //미리보기 데이터 리스트
		excelDataList.put("dataIndexList", dataIndexList); //칼럼 인덱스 번호 리스트
		
		long endTime = System.currentTimeMillis();
		
		long totalTime = endTime - startTime;
		System.out.println("파일 읽기 Time: "+totalTime/1000.0+"(s)");
		
		return excelDataList;
	}
	
	
	
	public List<List<String>> selectDataValueListPaging(DataSetConfirmVo datasetVo) throws Exception{
		List<List<String>> dataValueLists = new ArrayList<List<String>>();
		int startPage = 0;
		for(int i = startPage; i<=startPage+4; i++) {
			dataValueLists.add(datasetVo.getFileDataList().get(i));
		}
		return dataValueLists;
	}
	
	
	
	//시각화 요청 데이터 db화
	public Map<String,Object> insertFileData(DataSetConfirmVo datasetVo, String colIndexObject, String colNameObject, String colTypeObject) throws Exception {
		long startTime = System.currentTimeMillis();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		/*이미 db화가 되어 있는 데이터 셋인지 확인 (파일 데이터 db화까지만 하고 표준데이터 생성하지 못했을 경우 체크)*/
		String checkTableName = datasetMapper.selectNormalDataSetTableName(datasetVo);
		System.out.println("dataCode = "+datasetVo.getDataCode());
		if(datasetMapper.selectNormalDataSetTableName(datasetVo) != null) {
			map.put("result", 4);
			map.put("tableName", checkTableName);
			return map;
		}
		
		List<String> tempList = new ArrayList<String>(); //값 옮길 때 쓸 리스트
		
		List<Integer> checkedColumnIndex = new ObjectMapper().readValue(colIndexObject, new TypeReference<List<Integer>>(){});
		List<String> colNameList = new ObjectMapper().readValue(colNameObject, new TypeReference<List<String>>(){});
		List<String> colTypeList = new ObjectMapper().readValue(colTypeObject, new TypeReference<List<String>>(){});
		
//		List<Integer> checkedColumnIndex = datasetVo.getCheckedColumnIndex(); //체크한 칼럼 인덱스 번호
//		List<List<String>> fileDataList = datasetVo.getFileDataList(); //파일 데이터 리스트 (행별로 묶인 전체 데이터)
		
		/*행별로 된 데이터 열별로 묶기*/
//		List<List<String>> dataByColList = new ArrayList<List<String>>();
//		for(int i=0; i<fileDataList.get(0).size(); i++) {
//			tempList = new ArrayList<String>();
//			for(int j=0; j<fileDataList.size(); j++) {
//				tempList.add(fileDataList.get(j).get(i));
//			}
//			dataByColList.add(tempList);
//		}
		
		/*체크한 칼럼 인덱스 번호로 선택된 칼럼 데이터만 리스트에 담기*/
		List<String> selectedColNameList = new ArrayList<String>();
		List<String> selectedColTypeList = new ArrayList<String>();
		List<List<String>> selectedDataByColList = new ArrayList<List<String>>();
		
		for(int i=0; i<checkedColumnIndex.size(); i++) {
			selectedColNameList.add(colNameList.get(checkedColumnIndex.get(i)));
			selectedColTypeList.add(colTypeList.get(checkedColumnIndex.get(i)));
//			selectedDataByColList.add(dataByColList.get(checkedColumnIndex.get(i)));
		}
		
		/*칼럼 중복 검사*/
		int doubleCheck = 0;
		for(String str : selectedColNameList) {
			if(!tempList.contains(str)){
				tempList.add(str);
			} else {
				doubleCheck++;
			}
			if(doubleCheck > 0) {
				System.out.println("중복발견 : "+str);
				map.put("result", 0);
				return map;
			} else {
				doubleCheck = 0;
			}
		}
		
		DataSetConfirmVo filedataVo = new DataSetConfirmVo();
		filedataVo = datasetMapper.selectFileInfo(datasetVo);
		
		File dataFile = new File(filedataVo.getFilePath());
		List<List<String>> columnDataLists = new ArrayList<List<String>>();
		
		if(filedataVo.getFileExtension().equals(".csv")) {
			//csv 타입 데이터 읽어오기
			columnDataLists = readCsvFile(datasetVo);
		} else if(filedataVo.getFileExtension().equals(".xlsx")) {
//			columnDataLists = readExcelFile(dataFile);
			try {
				//xlsx 타입 데이터 읽어오기
				columnDataLists = readLargeExcelFile(dataFile);
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("sax excel parsing 실패");
			}		
		} else if(filedataVo.getFileExtension().equals(".xls")) {
			//xls 타입 데이터 읽어오기
			columnDataLists = xlsFileRead(dataFile);
		}
		
		for(int i=0; i<checkedColumnIndex.size(); i++) {
			selectedDataByColList.add(columnDataLists.get(checkedColumnIndex.get(i)));
		}
		
		/*선택한 데이터만 행별로 담기*/
		List<List<String>> selectedDataList = new ArrayList<List<String>>();
		int dataCode = datasetVo.getDataCode();
		String dataCodeSt = Integer.toString(dataCode);
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeNow = dayTime.format(new Date(time));
		
		for(int dataIndex=1; dataIndex < selectedDataByColList.get(0).size(); dataIndex++) {
			tempList = new ArrayList<String>();
			tempList.add(dataCodeSt);
			for(int colIndex = 0; colIndex < selectedDataByColList.size(); colIndex++) {
				tempList.add(selectedDataByColList.get(colIndex).get(dataIndex));
			}
			tempList.add(timeNow);
			selectedDataList.add(tempList);
		}
//		for (int check=0; check< selectedDataList.size(); check++) {
//			
//			System.out.println("check!!!!!!!!!!!!!!!!!!!!!!! :"  + selectedDataList.get(check));
//		}
//		System.out.println("사이즈 :" + selectedDataList.size());
		
		
		/*테이블 create할 때 컬럼 byte 구하기 ex.VARCHAR(20)에서 20*/
		List<Integer> colByteList = new ArrayList<Integer>();
		for(int i=0; i<selectedDataByColList.size(); i++) {
			List<Integer> byteList = new ArrayList<Integer>();
			
			for(int j=1; j<selectedDataByColList.get(i).size(); j++) {
				byte[] valbyte;
				if(selectedDataByColList.get(i).get(j)==null) {
					valbyte = "".getBytes();
				} else {
					valbyte = selectedDataByColList.get(i).get(j).getBytes();
				}
				
				int length = valbyte.length;
				if(length<45) {
					byteList.add(45);
				} else {
					byteList.add(length);
				}
			}
			int colBytes = Collections.max(byteList);
			colByteList.add(colBytes);
		}
		
		/*CREATE 구문에 들어갈 값 구하기*/
		List<String> cr = new ArrayList<String>();
		for(int i=0; i<selectedColNameList.size(); i++) {
			String ct = "";
			if(selectedColTypeList.get(i).equals("VARCHAR")) {
				ct = "`"+selectedColNameList.get(i)+"` "+selectedColTypeList.get(i)+"("+colByteList.get(i)+") ";
			} else {
				ct = "`"+selectedColNameList.get(i)+"` "+selectedColTypeList.get(i);
			}
			cr.add(ct);
		}
		
		

//		String stcr = "`data_code` char(18) NOT NULL, `seq` int NOT NULL, "+cr.toString().substring(1, cr.toString().length()-1)+", PRIMARY KEY (`data_code`, `seq`)";
		
//		System.out.println("create 변수"+stcr);
//		String tableName = datasetVo.getFileName()+datasetVo.getDataCode();
		String tableName = filedataVo.getFileOriginalName().substring(0, filedataVo.getFileOriginalName().lastIndexOf('.'))+"_pa"+datasetVo.getDataCode();
		String stcr = "`data_code` int(18) NOT NULL, `seq` int(11) NOT NULL AUTO_INCREMENT, "+cr.toString().substring(1, cr.toString().length()-1)
				+", `normal_data_enroll_date` VARCHAR(45)"
				+", PRIMARY KEY (`data_code`, `seq`), UNIQUE KEY `"+tableName+"_uniqueseq`(`seq`)";
		String create_table = "CREATE TABLE `"+tableName+"` ("+stcr+") CHARSET=utf8";
		
		
		/*테이블 create*/
		try {
			Map <String,String> crmap = new HashMap<String,String>();
			crmap.put("create_table", create_table);
			createFileTable(crmap);
			System.out.println("테이블 생성 완료");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			map.put("result", 1);
			return map;
		}
		
		
		
//		insertDataInFileTable(selectedDataList, tableName);
		
		try {
			/*데이터 insert (1천행씩 넣기)*/
			Map<String,Object> insertMap = new HashMap<String,Object>();
			selectedColNameList.add(0, "data_code");
			for(int i=0; i<selectedColNameList.size(); i++) {
				selectedColNameList.set(i, "`"+selectedColNameList.get(i)+"`");
			}
			selectedColNameList.add("normal_data_enroll_date");
			insertMap.put("tableName", "`"+tableName+"`");
			insertMap.put("colNameList", selectedColNameList);
//			insertMap.put("selectedDataList", selectedDataList);
			int rowSize = 0;
			if(selectedDataList.size()>100) {
				rowSize = 100;
			} else {
				rowSize = selectedDataList.size();
			}
//			System.out.println("rowSize="+rowSize);
			List<List<String>> insertList = new ArrayList<List<String>>();
			for(int i=0; i<selectedDataList.size(); i=i+rowSize) {
				if(selectedDataList.size()-i < 100) {
					rowSize = selectedDataList.size()-i;
				}
				for(int j = i; j<i+rowSize; j++) {
					insertList.add(selectedDataList.get(j));
				}
//				insertMap.put("tableName", "`"+tableName+"`");
//				insertMap.put("colNameList", selectedColNameList);
//				insertMap.put("selectedDataList", selectedDataList.get(i));
				insertMap.put("selectedDataList", insertList);
				insertDataInFileTable(insertMap);
				insertMap.remove("selectedDataList");
				insertList.clear();
			}
//			insertDataInFileTable(insertMap);
		}catch(SQLException e) {
			datasetMapper.dropFileTable("`"+tableName+"`");
			System.out.println(e.getMessage());
			map.put("result", 2);
			return map;
		}
		
		/*dataset_normal에 테이블 명 추가(update)*/
		datasetVo.setNormalDataTableTiltle(tableName);
		datasetMapper.updateNormalDataSetTableName(datasetVo);
		datasetMapper.updateDatasetProcessingWhether(datasetVo);
		
		map.put("result", 4);
		map.put("tableName", tableName);
		
		long endTime = System.currentTimeMillis();
		
		long totalTime = endTime - startTime;
		System.out.println("db화 Time: "+totalTime/1000.0+"(s)");
		
		return map;
		
	}
	
	//시각화 요청 데이터 테이블 생성
	public void createFileTable(Map<String,String> crmap) throws Exception{
		datasetMapper.createFileTable(crmap);
	}
	
	//시각화 요청 데이터 삽입(insert)
	public void insertDataInFileTable(Map<String,Object> insertMap) throws Exception{
		datasetMapper.insertDataInFileTable(insertMap);
	}
	
	//시각화 요청 데이터 테이블 이름 조회
	public String selectNormalDataTableName(DataSetConfirmVo datasetVo) throws Exception{
		return datasetMapper.selectNormalDataSetTableName(datasetVo);
	}
	
	/*일시 데이터 db화 후 확인하기*/
	public Map<String, Object> selectNormalDatabase(DataSetConfirmVo datasetVo) throws Exception{
		String normalDataTableName = selectNormalDataTableName(datasetVo);
		
		datasetVo.setNormalDataTableTiltle("`"+normalDataTableName+"`");
		
		List<LinkedHashMap<String,Object>> normalDatabase = datasetMapper.selectNormalDatabase(datasetVo);
		Set<String> normalDataColName = normalDatabase.get(0).keySet();
		
		Map<String, Object> normalDatabaseMap = new HashMap<String, Object>();
		
		normalDatabaseMap.put("normalDatabase", normalDatabase);
		normalDatabaseMap.put("normalDataColName", normalDataColName);
		normalDatabaseMap.put("normalDataTableName", normalDataTableName);
		
		return normalDatabaseMap;
	}
	
	//데이터 총 행 개수
	public int selectNormalDataRowCount(DataSetConfirmVo datasetVo) throws Exception{
		String normalDataTableName = selectNormalDataTableName(datasetVo);
		datasetVo.setNormalDataTableTiltle("`"+normalDataTableName+"`");
		int allRecords = datasetMapper.selectNormalDataRowCount(datasetVo);
//		if(allRecords >= 1000) {
//			allRecords = 1000;
//		}
		return allRecords;
	}
	//페이징
	public List<LinkedHashMap<String,Object>> selectNormalDatabasePaging(DataSetConfirmVo datasetVo) throws Exception{
		String normalDataTableName = selectNormalDataTableName(datasetVo);
		
		datasetVo.setNormalDataTableTiltle("`"+normalDataTableName+"`");
		
		List<LinkedHashMap<String,Object>> normalDatabase = datasetMapper.selectNormalDatabase(datasetVo);
		
		return normalDatabase;
	}
	
	//시각화 요청 거절 이유 저장
	public void updateRejectReason(DataSetConfirmVo datasetVo) throws Exception{
		datasetMapper.updateRejectReason(datasetVo);
	}
	
	
	/*
	 * CSV 읽어오기
	 */
	
	private static CellProcessor[] getProcessors(int size) {
//		System.out.println("프로세서 사이즈1   " + size);
		CellProcessor[] processors = new CellProcessor[size];
//		System.out.println("프로세서 사이즈2   " + size);
		for(int i = 0; i<size; i++) {
//			System.out.println("프로세서 사이즈3   " + size);
			Optional sub_processors = new Optional();
			processors[i] = sub_processors;
//			System.out.println(i+"번  " + processors.length);
		}
		return processors;
	}
	
	public List<List<String>> readCsvFile(DataSetConfirmVo datasetVo) throws Exception {
		datasetVo = datasetMapper.selectFileInfo(datasetVo);
		
		File dataFile = new File(datasetVo.getFilePath());
		String[] charsets = {"EUC-KR", "UTF-8"};
		CharsetDetector detector = new CharsetDetector();
		Charset charset = detector.detectCharset(dataFile, charsets);
		
		List<List<String>> dataByColList = new ArrayList<List<String>>();
		
		if(charset != null) {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(datasetVo.getFilePath()),charset));
			
			ICsvListReader listReader = null;
			try {
//				listReader = new CsvListReader(new FileReader(dataFile.getAbsolutePath()), CsvPreference.STANDARD_PREFERENCE);
				listReader = new CsvListReader(br, CsvPreference.STANDARD_PREFERENCE);
				
				final String[] header = listReader.getHeader(true); //첫번째 줄 데이터 가져오기
				
				int lastCellNum = header.length; //마지막 데이터 셀 번호
		        int PhysicalCellNum = lastCellNum;
		        for(int i=0; i<header.length;i++) {
		        	String a=header[i];
		        	if(a!=null) {
//		        		System.out.println(a);
		        	}
		        	else {
//		        		System.out.println(""+a);
		        		PhysicalCellNum-=1;
		        	}
		        }
		        final CellProcessor[] processors = getProcessors(lastCellNum);
				List<List<String>> dataByRowList = new ArrayList<List<String>>();
		        while((listReader.read()) != null) {
		        	final List<Object> csvFileList = listReader.executeProcessors(processors); //위에서부터 한 행씩 담긴다. (while문 돌 때마다)
		        	List<String> csvDataTempList = new ArrayList<String>(); //List<Object>->List<String>으로 바꿔주기 위함
		        	for(int i=0; i<PhysicalCellNum; i++) {
		        		if(csvFileList.get(i) == null) {
		        			csvFileList.set(i, ""); //null 빈 값 처리
		        		}
		        		csvDataTempList.add((String)csvFileList.get(i)); //Object->String 변환 후 리스트에 담기
		        		csvDataTempList.set(i, excelCellRef.dateReformated(csvDataTempList.get(i))); //날짜 형식 맞추기
		        		String regex = "(?<=[\\d])(,)(?=[\\d])"; // 15,000 같이 콤마가 있는 숫자 정규표현식
		        		Pattern p = Pattern.compile(regex); // regex에 담긴 정규표현식의 패턴 생성
		        		Matcher m = p.matcher(csvDataTempList.get(i)); // 위에서 선언한 패턴 p에 맞는 조건인지 검사하여 m에 저장
		        		if(m.find()) { //m.find()는 패턴이 일치하는 경우 boolean 형으로 true/false 리턴
		        			csvDataTempList.set(i, m.replaceAll("")); //콤마 지운 값으로 다시 리스트에 담기
		        		}
		        	}
		        	dataByRowList.add(csvDataTempList); //행별로 된 데이터 리스트들
		        }
		        
		        
		        /*행별로 된 데이터 열별로 묶기*/
				
				for(int i=0; i<dataByRowList.get(0).size(); i++) {
					List<String> tempList = new ArrayList<String>();
					for(int j=0; j<dataByRowList.size(); j++) {
						tempList.add(dataByRowList.get(j).get(i));
					}
					dataByColList.add(tempList);
				}
				
				/*리스트 맨 앞에 칼럼명(header) 붙여주기*/
				for(int i=0; i<PhysicalCellNum; i++) {
					dataByColList.get(i).add(0, header[i]);
				}
			}
			finally {
				if(listReader != null) {
					listReader.close();
				}
			}
		}
		
//		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(datasetVo.getFilePath()),"utf-8"));
//		BufferedReader br_kr = new BufferedReader(new InputStreamReader(new FileInputStream(datasetVo.getFilePath()),"euc-kr"));
		
		return dataByColList;
	}
	
	/*
	 * 대용량 엑셀 파일 읽기
	 * (기존의 문서 전체를 메모리에 로드시키는 dom(document object model) 방식 (조금 양이 많은 대략 6만행 정도의 엑셀 데이터는 out of memory 발생)과 달리 
	 * sax(simple API for XML) 방식은 전체를 메모리에 올리지 x -> 메모리 사용량이 적고 단순히 읽기만 할 때 속도가 빠르다.)
	 * */
	public List<List<String>> readLargeExcelFile(File dataFile) throws Exception{
		
		//OPCPackage 파일을 읽거나 쓸 수 있는 상태의 컨테이너를 생성함
		OPCPackage opc = OPCPackage.open(dataFile);
		//opc 컨테이너를 XSSF형식으로 읽어옴. 이 Reader는 적은 메모리로 sax parsing을 하기 쉽게 만들어줌.
		XSSFReader xssfReader = new XSSFReader(opc);
		//XSSFReader에서 sheet 별 collection으로 분할해서 가져옴.
		XSSFReader.SheetIterator itr = (XSSFReader.SheetIterator)xssfReader.getSheetsData();
		
		//통합문서 내의 모든 sheet에서 공유되는 스타일 테이블이라는데 정확한 사용용도는 모름
		StylesTable styles = xssfReader.getStylesTable();
		//ReadOnlySharedStringsTable 이것도 정확한 역할은 모르겠음. data의 type을 처리할 때 참조하는 것 같음.
		ReadOnlySharedStringsTable strings = new ReadOnlySharedStringsTable(opc);
		
		//데이터를 파싱해서 담아올 List 객체
		//이것 마저도 메모리에 부담이 된다면, Handler에 처리 로직을 넣어서 한건씩 처리하면 됨.
		List<List<String>> dataList = new ArrayList<List<String>>();
		
		//sheet 수 만큼 loop를 돌린다.
		while(itr.hasNext()) {
			InputStream sheetStream = itr.next();
			InputSource sheetSource = new InputSource(sheetStream);
			
			//Sheet2ListHandler은 엑셀 data를 가져와서 SheetContentHandler(Interface)를 재정의해서 만든 class
			Sheet2ListHandler sheet2ListHandler = new Sheet2ListHandler(dataList);
			//new XSSFSheetXMLHandler(StyleTable styles, ReadOnlySharedStringsTable strings, SheetContentsHandler sheet2ListHandler, boolean formulasNotResults)
			//formulasNotResults 이것도 무슨 옵션인지는 모름
//			어쨌든 이 핸들러는 sheet의 행(row) 및 cell 이벤트를 생성한다.
			ContentHandler handler = new SheetHandler(styles, strings, sheet2ListHandler, false);
			
			//sax parser를 생성하고...
			SAXParserFactory saxFactory = SAXParserFactory.newInstance();
			SAXParser saxParser = saxFactory.newSAXParser();
			
			//sax parser 방식과 xmlReader 생성
			XMLReader sheetParser = saxParser.getXMLReader();
			//xml reader에 row와 cell 이벤트를 생성하는 핸들러를 설정한 후,
			sheetParser.setContentHandler(handler);
			//위에서 Sheet 별로 생성한 inputSource를 parsing한다.
			//이 과정에서 handler는 row와 cell 이벤트를 생성하고 생성된 이벤트는 sheet2ListHandler가 받아서 처리한다.
			//sheet2ListHandler의 내용은 아래를 참조하세요.
			sheetParser.parse(sheetSource);
			
			sheetStream.close();
		}
		
		opc.close();
		
		/*행별로 된 데이터 열별로 묶기*/
		List<List<String>> dataByColList = new ArrayList<List<String>>();
		for(int i=0; i<dataList.get(0).size(); i++) {
			List<String> tempList = new ArrayList<String>();
			for(int j=0; j<dataList.size(); j++) {
				tempList.add(dataList.get(j).get(i));
			}
			dataByColList.add(tempList);
		}
		
		return dataByColList;
	}
	
	public List<List<String>> xlsFileRead(File dataFile) throws Exception{
		excelReadOption readOption = new excelReadOption();
		readOption.setFilePath(dataFile.getAbsolutePath());
		readOption.setStartRow(1);
		Workbook wb = WorkbookFactory.create(dataFile);
		Sheet sheet = wb.getSheetAt(0);
		int numOfRows = sheet.getPhysicalNumberOfRows();
		
		Row row = null;
		Cell cell = null;
		Row firstrow = sheet.getRow(0);
		Map<String, String> map = null;
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		for(int rowIdx = readOption.getStartRow()-1; rowIdx < numOfRows; rowIdx++) {
			row = sheet.getRow(rowIdx);
			if(row != null) {
				int numOfCells = firstrow.getLastCellNum();
				map = new LinkedHashMap<String,String>();
				for(int cellIdx = 0; cellIdx < numOfCells; cellIdx++) {
					cell = row.getCell(cellIdx);
					String cellName = excelCellRef.getName(cell, cellIdx);
					map.put(cellName, excelCellRef.getValue(cell));
				}
				result.add(map);
			}
		}
		List<List<String>> dataByColList = new ArrayList<List<String>>();
		String[] keys = map.keySet().toArray(new String[0]);
		for(int i=0; i<keys.length; i++) {
			List<String> dataList = new ArrayList<String>();
			for(Map<String,String> col : result) {
				dataList.add(col.get(keys[i]));
        	}
			dataByColList.add(dataList);
		}
		return dataByColList;
	}
	
	
	
	//연관 보고서 조회
	public List<ReportDomain> selectReferenceReportList(DataSetConfirmVo datasetVo) throws Exception{
		return datasetMapper.selectReferenceReportList(datasetVo);
	}
	//데이터 셋 상세조회 다운로드
	public void selectFileDownload(HttpServletResponse response, DataSetConfirmVo datasetVo) throws Exception {

		byte fileByte[] = FileUtils.readFileToByteArray(new File(datasetVo.getFilePath()));
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(datasetVo.getFileOriginalName(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}	
}
