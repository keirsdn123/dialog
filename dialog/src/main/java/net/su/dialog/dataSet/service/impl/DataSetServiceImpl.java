package net.su.dialog.dataSet.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tomcat.jni.FileInfo;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.supercsv.io.CsvListReader;
import org.supercsv.io.ICsvListReader;
import org.supercsv.prefs.CsvPreference;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.domain.MenuRatingInfo;
import net.su.dialog.dataSet.domain.Menulist;
import net.su.dialog.dataSet.mapper.DataSetMapper;
import net.su.dialog.dataSet.service.DataSetService;
import net.su.dialog.main.domain.User;

@Service
public class DataSetServiceImpl implements DataSetService {

	private static final String File = null;
	@Resource(name = "net.su.dialog.dataSet.mapper.DataSetMapper")
	private DataSetMapper datasetMapper;

	// 1차 카테고리 리스트 조회
	public List<CategoryValueObject> getCategotyList() throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return datasetMapper.getCategotyList();
	}

	// 2차 카테고리 리스트 조회
	public List<CategoryValueObject> getCategoryList(CategoryValueObject cvo) throws Exception {
		System.out.println("2차 카테고리 리스트 불러오기");
		return datasetMapper.getCategoryList(cvo);
	}

	// //데이터셋 목록 카테고리 선택시 목록 조회
	// public List<Dataset> selectCDatasetList (Dataset dvo) throws Exception{
	// System.out.println("2차 카테고리 리스트 불러오기");
	// if(dvo.getCategorySeq()==0) {
	// return datasetMapper.selectACDatasetList(dvo);
	// } else
	//
	// return datasetMapper.selectCDatasetList(dvo);
	// }
	// 데이터셋 목록 카테고리
	public List<CategoryValueObject> selectDCategory() throws Exception {
		System.out.println("데이터셋 목록 카테고리 리스트 불러오기 서비스 임플 ");
		return datasetMapper.selectDCategory();
	}

	// 매뉴 조회
	public List<Menulist> SelectMenuList(HttpSession session) throws Exception {
		System.out.println("메뉴 리스트 불러오기");
		MenuRatingInfo menuRatingInfo = new MenuRatingInfo();

		if (session.getAttribute("memInfo") != null) {

			User userInfo = (User) session.getAttribute("memInfo");
			menuRatingInfo.setMemberRatingCode(userInfo.getMemberRatingCode());
			return datasetMapper.SelectMenuList(menuRatingInfo);
		} else {
			User userInfo = new User();
			userInfo.setMemberRatingCode(0);
			menuRatingInfo.setMemberRatingCode(userInfo.getMemberRatingCode());
			return datasetMapper.SelectMenuList(menuRatingInfo);
		}
	}

	// 메뉴 3데스 불러오기
	// public List<Menulist> SelectMenuList(HttpSession session, int menuCode)
	// throws Exception{
	// User userInfo = (User) session.getAttribute("memInfo");
	// System.out.println("3데스 메뉴 리스트 불러오기");
	// MenuRatingInfo menuRatingInfo = new MenuRatingInfo();
	// menuRatingInfo.setMenuCode(menuCode);
	// menuRatingInfo.setMemberRatingCode(userInfo.getMemberRatingCode());
	// return datasetMapper.SelectMenuListDetail(menuRatingInfo);
	// }
	//
	// 데이터 셋 리스트 조회
	public Map<String, Object> selectDatasetList(HttpSession session, Dataset dataset) throws Exception {
		System.out.println("데이터셋 리스트 불러오기");
		User userInfo = new User();
		if (session.getAttribute("memInfo") == null) {
			userInfo.setMemberRatingCode(0);
		} else {
			userInfo = (User) session.getAttribute("memInfo");
			dataset.setMemberRatingCode(userInfo.getMemberRatingCode());
		}

		int dataSetRecords = datasetMapper.selectDataSetRowCount(dataset);
		List<Dataset> selectDataSetList = datasetMapper.selectDatasetList(dataset);

		Map<String, Object> dataSetListMap = new HashMap<String, Object>();
		dataSetListMap.put("selectDataSetList", selectDataSetList);
		dataSetListMap.put("dataSetRecords", dataSetRecords);

		return dataSetListMap;
	}

	// 데이터 셋 (뉴스 카테고리) 목록 조회
	public Map<String, Object> selectDatasetNewsList(HttpSession session, Dataset dataset) throws Exception {
		System.out.println("데이터셋 뉴스 카테고리 리스트 불러오기");
		User userInfo = new User();
		if (session.getAttribute("memInfo") == null) {
			userInfo.setMemberRatingCode(0);
		} else {
			userInfo = (User) session.getAttribute("memInfo");
			dataset.setMemberRatingCode(userInfo.getMemberRatingCode());
		}

		int dataSetNewsRecords = datasetMapper.selectDataSetNewsRowCount(dataset);
		List<Dataset> selectDataSetNewsList = datasetMapper.selectDatasetNewsList(dataset);
		Map<String, Object> dataSetListNewsMap = new HashMap<String, Object>();
		dataSetListNewsMap.put("selectDataSetNewsList", selectDataSetNewsList);
		dataSetListNewsMap.put("dataSetNewsRecords", dataSetNewsRecords);

		return dataSetListNewsMap;
	}

	// 나의 데이터 관리 > 나의 Data > 등록한 데이터 조회
	public Map<String, Object> selectMydataSetList(HttpSession session, Dataset dataset) throws Exception {
		System.out.println("나의 데이터셋(등록한 데이터) 리스트 불러오기");
		datasetMapper.selectMydataSetList(dataset);
		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());

		int MydataSetRecords = datasetMapper.selectMyDataSetRowCount(dataset);
		List<Dataset> selectMyDataSetList = datasetMapper.selectMydataSetList(dataset);
		Map<String, Object> MyDataSetListMap = new HashMap<String, Object>();

		MyDataSetListMap.put("selectMyDataSetList", selectMyDataSetList);
		MyDataSetListMap.put("MydataSetRecords", MydataSetRecords);

		return MyDataSetListMap;
	}

	// 데이터 셋 일시 등록(관리자)
	public void insertDataset(MultipartHttpServletRequest request, Dataset dataset, HttpSession session)
			throws Exception {

		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());

		try {
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = "";
			String fileName = "";
			String filePath = request.getSession().getServletContext().getRealPath("/");
			filePath = filePath.substring(0, filePath.indexOf("webapp"));
			filePath += "resources/static/uploadFiles/excelFile/"; // resource경로 만들기
			File dir = new File(filePath);
			if (!dir.isDirectory()) { // 해당 경로의 폴더가 없다면 폴더를 생성
				dir.mkdirs();
			}
			while (iterator.hasNext()) {
				fileName = iterator.next();
				System.out.println("fileName : " + fileName);
				multipartFile = multipartHttpServletRequest.getFile(fileName);
				System.out.println("비었냐?? : " + multipartFile.isEmpty());
				if (multipartFile.isEmpty() == false) {// 파일의 내용이 있는지 없는지 체크 빈 파일을 업로드할거면 없어도 됨
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					long fileSize = multipartFile.getSize();

					System.out.println("원본 파일이름 : " + originalFileName);
					System.out.println("원본 파일 확장자 명 : " + originalFileExtension);
					System.out.println("파일 사이즈 : " + multipartFile.getSize());
					Random rnd = new Random();
					for (int i = 0; i < 15; i++) { // 15자리 랜덤 파일명 생성
						int rIndex = rnd.nextInt(3);
						switch (rIndex) {
						case 0:
							// a-z
							storedFileName += (char) ((int) (rnd.nextInt(26)) + 97);
							break;
						case 1:
							// A-Z
							storedFileName += (char) ((int) (rnd.nextInt(26)) + 65);
							break;
						case 2:
							// 0-9
							storedFileName += rnd.nextInt(10);
							break;
						}
					}
					storedFileName += originalFileExtension;
					File file = new File(filePath + storedFileName);
					multipartFile.transferTo(file);
					dataset.setFileOriginalTitle(originalFileName);
					dataset.setFileExtension(originalFileExtension);
					dataset.setFileTitle(storedFileName);
					dataset.setFileRoute(file.getPath());
					dataset.setFileSize(fileSize);

					datasetMapper.insertDataset(dataset); // 데이터셋 등록
					datasetMapper.insertDatasetNormal(dataset); // 데이터셋 일시 등록
					datasetMapper.insertDatasetFilelist(dataset); // 데이터셋 일시 파일 등록
					int cateList[] = dataset.getCateList();
					for (int i = 0; i < cateList.length; i++) {
						int cateCode2 = cateList[i];
						dataset.setCateCode2(cateCode2);
						datasetMapper.insertDatasetCategory(dataset); // 데이터 셋 일시 카테고리 등록
					}
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 데이터 셋 등록(이용자)
	public void insertUserDataset(MultipartHttpServletRequest request, Dataset dataset, HttpSession session)
			throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());

		try {
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = "";
			String fileName = "";

			String filePath = request.getSession().getServletContext().getRealPath("/");
			filePath = filePath.substring(0, filePath.indexOf("webapp"));
			filePath += "resources/static/uploadFiles/excelFile/"; // resource경로 만들기
			File dir = new File(filePath);
			if (!dir.isDirectory()) { // 해당 경로의 폴더가 없다면 폴더를 생성
				dir.mkdirs();
			}
			while (iterator.hasNext()) {
				fileName = iterator.next();
				System.out.println("fileName : " + fileName);
				multipartFile = multipartHttpServletRequest.getFile(fileName);
				System.out.println("비었냐?? : " + multipartFile.isEmpty());
				if (multipartFile.isEmpty() == false) {// 파일의 내용이 있는지 없는지 체크 빈 파일을 업로드할거면 없어도 됨

					System.out.println(("------------- file start -------------"));
					System.out.println(("name : " + multipartFile.getName()));
					System.out.println(("filename : " + multipartFile.getOriginalFilename()));
					System.out.println(("size : " + multipartFile.getSize()));
					System.out.println(("-------------- file end --------------\n"));

					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					long fileSize = multipartFile.getSize();

					System.out.println("원본 파일이름 : " + originalFileName);
					System.out.println("원본 파일 확장자 명 : " + originalFileExtension);
					System.out.println("파일 사이즈 : " + multipartFile.getSize());
					Random rnd = new Random();
					for (int i = 0; i < 15; i++) { // 15자리 랜덤 파일명 생성
						int rIndex = rnd.nextInt(3);
						switch (rIndex) {
						case 0:
							// a-z
							storedFileName += (char) ((int) (rnd.nextInt(26)) + 97);
							break;
						case 1:
							// A-Z
							storedFileName += (char) ((int) (rnd.nextInt(26)) + 65);
							break;
						case 2:
							// 0-9
							storedFileName += rnd.nextInt(10);
							break;
						}
					}
					storedFileName += originalFileExtension;
					File file = new File(filePath + storedFileName);
					multipartFile.transferTo(file);
					dataset.setFileOriginalTitle(originalFileName);
					dataset.setFileExtension(originalFileExtension);
					dataset.setFileTitle(storedFileName);
					dataset.setFileRoute(file.getPath());
					dataset.setFileSize(fileSize);

					dataset.setTypeNormalRegularly("일시");
					dataset.setMemberRatingCode(userInfo.getMemberRatingCode());

					datasetMapper.insertUserDataset(dataset); // 데이터셋 등록
					datasetMapper.insertDatasetNormal(dataset); // 데이터셋 일시 등록
					datasetMapper.insertDatasetFilelist(dataset); // 데이터셋 일시 파일 등록
					int cateList[] = dataset.getCateList();
					for (int i = 0; i < cateList.length; i++) {
						int cateCode2 = cateList[i];
						dataset.setCateCode2(cateCode2);
						datasetMapper.insertDatasetCategory(dataset);
					}
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int csvFileCheck(MultipartHttpServletRequest request) throws Exception {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		MultipartFile csvfile = multipartHttpServletRequest.getFile("fileUpload");
		String baseFilePath = request.getSession().getServletContext().getRealPath("/");
		baseFilePath = baseFilePath.substring(0, baseFilePath.indexOf("webapp"));
		baseFilePath += "resources/static/uploadFiles/checkFiles/";
		File testCsvFile = new File(baseFilePath + csvfile.getOriginalFilename());
		csvfile.transferTo(testCsvFile);
		int excelcheck = 0;
		ICsvListReader listReader = null;
		try {
			listReader = new CsvListReader(new FileReader(testCsvFile.getAbsolutePath()),
					CsvPreference.STANDARD_PREFERENCE);
			final String[] header = listReader.getHeader(true); // 첫번째 줄 데이터 가져오기
			int lastCellNum = header.length; // 첫번째 행의 마지막 열의 인덱스
			int PhysicalCellNum = lastCellNum; //실제로 값이 들어있는 열의 수
			for (int i = 0; i < header.length; i++) {
				String a = header[i];
				if (a == null) {
					PhysicalCellNum -= 1;
				}
			}
			System.out.println("PhysicalCellNum =" + PhysicalCellNum);
			System.out.println("lastCellNum =" + lastCellNum);
			if (PhysicalCellNum != lastCellNum) {
				System.out.println("첫 행 칼럼명 입력이 올바르지 않습니다.");
				excelcheck = 4;
			}
			// 파일 삭제
			listReader.close();
			System.gc();
			if (testCsvFile.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return excelcheck;
	}

	public int excelFileCheck(MultipartHttpServletRequest request) throws Exception {
		MultipartFile file = request.getFile("fileUpload");
		String FileName = file.getOriginalFilename();
		String FileExtension = FileName.substring(FileName.lastIndexOf("."));

		int excelcheck = 0;

		Workbook workbook = null;
		
		
		if (FileExtension.toUpperCase().endsWith(".XLS")) {
			try {
				workbook = new HSSFWorkbook(file.getInputStream());
				HSSFSheet curSheet;
				HSSFRow curRow;
				HSSFCell curCell;
				HSSFRow fixRow;
				if (workbook.getNumberOfSheets() == 1) {
					// 현재 sheet 반환
					curSheet = (HSSFSheet) workbook.getSheetAt(0);
					int lastRowNum = (curSheet.getLastRowNum() + 1);// 라스트(마지막 값이 있는 인덱스행번호) 행 갯수
					int physicalRowNum = curSheet.getPhysicalNumberOfRows(); // 피지컬(값이 있는) 행 갯수
					int lastCellNum = curSheet.getRow(0).getLastCellNum();
					int PhysicalCellNum = curSheet.getRow(0).getPhysicalNumberOfCells();
					fixRow = curSheet.getRow(0);
					System.out.println("전체 라스트 로우 갯수 : " + (curSheet.getLastRowNum() + 1));
					System.out.println("피지컬 로우 갯수 : " + curSheet.getPhysicalNumberOfRows());
					System.out.println("전체 라스트 열  갯수  : " + lastCellNum);
					System.out.println("피지컬 열 갯수 : " + PhysicalCellNum);

					// 첫 행의 정보 가져오기
					curRow = curSheet.getRow(0);
					// 첫 행의 칼럼명 기입 여부확인 (하나라도 null 이면 안됌x)
					for (int cellIndex = 0; cellIndex < curRow.getLastCellNum(); cellIndex++) {
						curCell = curRow.getCell(cellIndex);
						String header = curCell.toString();
						if (header == null || header.equals("")) {
							PhysicalCellNum -= 1;
						}
					}
					if (lastCellNum != PhysicalCellNum) {
						System.out.println("첫행 칼럼명이 이상합니다");
						excelcheck = 4;
					} else {
						for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
							// row 0은 헤더정보이기 때문에 무시
							// if (rowIndex != 0) {
							curRow = curSheet.getRow(rowIndex);
							String value;
							// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
							// if (curRow.getCell(0) != null) {
							// if (!"".equals(curRow.getCell(0))) {
							// cell 탐색 for문
							int a = fixRow.getLastCellNum();
							int b = fixRow.getPhysicalNumberOfCells();
							if (curRow.getLastCellNum() != curRow.getPhysicalNumberOfCells()) {
								excelcheck = 2;
								System.out.println("칼럼을 찾을 수 없습니다. 칼럼 외의 값은 지워 주세요");
							}
						}
						System.out.println("통과");
					}
				} else {
					excelcheck = 1;
					System.out.println("시트 수는 1개만 가능합니다.");
				}
				
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		if (FileExtension.toUpperCase().endsWith(".XLSX")) {
			try {
				workbook = new XSSFWorkbook(file.getInputStream());
				XSSFSheet curSheet;
				XSSFRow curRow;
				XSSFCell curCell;
				XSSFRow fixRow;
				
				if (workbook.getNumberOfSheets() == 1) {
					// 현재 sheet 반환
					curSheet = (XSSFSheet) workbook.getSheetAt(0);
					int lastRowNum = (curSheet.getLastRowNum() + 1);// 라스트(마지막 값이 있는 인덱스행번호) 행 갯수
					int physicalRowNum = curSheet.getPhysicalNumberOfRows(); // 피지컬(값이 있는) 행 갯수
					int lastCellNum = curSheet.getRow(0).getLastCellNum();
					int PhysicalCellNum = curSheet.getRow(0).getPhysicalNumberOfCells();
					fixRow = curSheet.getRow(0);
					System.out.println("전체 라스트 로우 갯수 : " + (curSheet.getLastRowNum() + 1));
					System.out.println("피지컬 로우 갯수 : " + curSheet.getPhysicalNumberOfRows());
					System.out.println("전체 라스트 열  갯수  : " + lastCellNum);
					System.out.println("피지컬 열 갯수 : " + PhysicalCellNum);

					// 첫 행의 정보 가져오기
					curRow = curSheet.getRow(0);
					// 첫 행의 칼럼명 기입 여부확인 (하나라도 null 이면 안됌x)
					for (int cellIndex = 0; cellIndex < curRow.getLastCellNum(); cellIndex++) {
						curCell = curRow.getCell(cellIndex);
						String header = curCell.toString();
						if (header == null || header.equals("")) {
							PhysicalCellNum -= 1;
						}
					}
					if (lastCellNum != PhysicalCellNum) {
						System.out.println("첫행 칼럼명이 이상합니다");
						excelcheck = 4;
					} else {
						for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
							// row 0은 헤더정보이기 때문에 무시
							// if (rowIndex != 0) {
							curRow = curSheet.getRow(rowIndex);
							String value;
							// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
							// if (curRow.getCell(0) != null) {
							// if (!"".equals(curRow.getCell(0))) {
							// cell 탐색 for문
							int a = fixRow.getLastCellNum();
							int b = fixRow.getPhysicalNumberOfCells();

							int getLastCellNum = curRow.getLastCellNum();
							int getPhysicalCellNum = curRow.getPhysicalNumberOfCells();
							if (getLastCellNum != getPhysicalCellNum) {
								excelcheck = 2;
								System.out.println("칼럼을 찾을 수 없습니다. 칼럼 외의 값은 지워 주세요 오케이요맨"+getLastCellNum);	
								System.out.println("칼럼을 찾을 수 없습니다. 칼럼 외의 값은 지워 주세요 오케이요맨"+getPhysicalCellNum);
								System.out.println("행 인덱스"+rowIndex);
								break;
							}
							
						}
						System.out.println("통과");
					}
				} else {
					excelcheck = 1;
					System.out.println("시트 수는 1개만 가능합니다.");
				}
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		// try {
		// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
		// workbook = new XSSFWorkbook(file.getInputStream());
		// 탐색에 사용할 Sheet, Row, Cell 객체
		
		// Sheet 탐색 for문

		return excelcheck;
	}

	// 파일 유효성 체크 (엑실 & csv)
	public int dataSetFileCheck(MultipartHttpServletRequest request) throws MultipartException, IllegalStateException {

		System.out.println("파일 유효성 체크");
		// 반환할 객체를 생성
		MultipartFile file = request.getFile("fileUpload");
		String FileName = file.getOriginalFilename();
		String FileExtension = FileName.substring(FileName.lastIndexOf("."));

		int excelcheck = 0;

		// csv 파일 유효성
		if (FileExtension.toUpperCase().endsWith(".CSV")) {
			try {
				excelcheck = csvFileCheck(request);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// excel 파일 유효성
		else if (FileExtension.toUpperCase().endsWith(".XLS") || FileExtension.toUpperCase().endsWith(".XLSX")) {
			try {
				excelcheck = excelFileCheck(request);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			excelcheck = 3;
		}
		return excelcheck;
	}

	// 정기 데이터 셋 개발 소스 조회
	public List<Dataset> selectDSource(Dataset dataset) throws Exception {
		return datasetMapper.selectDSource(dataset);
	}

	// 데이터셋 조회수 업데이트
	public void updateDatasetViews(int dataCode) throws Exception {
		datasetMapper.updateDatasetViews(dataCode);
	}

	// 데이터셋 삭제 업데이트
	public void deleteDataSet(int dataCode) throws Exception {
		datasetMapper.deleteDataSet(dataCode);
	}
	
	public List<DataRequest> selectCollectRequestList() throws Exception{
		   return datasetMapper.selectCollectRequestList();
	   }
	// 데이터셋 정기 등록(다음뉴스)
	public void insertRegularDaumNewsDataSet(Dataset dataset, HttpSession session) throws Exception {
		dataset.setMemberCode(((User) session.getAttribute("memInfo")).getMemberCode());
		
		dataset.setRegularDataTableTitle("다음뉴스수집_" + dataset.getScheCode());
		datasetMapper.insertRDataset(dataset); // 데이터셋 등록
		datasetMapper.insertDatasetRegular(dataset);// 데이터셋 정기tb 등록
		datasetMapper.updateNewsCrawlingDatacode(dataset);
		
		int cateList[] = dataset.getCateList();
		for (int i = 0; i < cateList.length; i++) {
			int cateCode2 = cateList[i];
			dataset.setCateCode2(cateCode2);
			datasetMapper.insertDatasetCategory(dataset); // 데이터 셋 일시 카테고리 등록
		}
		
	}
}
