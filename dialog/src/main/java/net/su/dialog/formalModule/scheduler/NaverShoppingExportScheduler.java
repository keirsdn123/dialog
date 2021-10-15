package net.su.dialog.formalModule.scheduler;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import net.su.dialog.CommonMethods;
import net.su.dialog.formalModule.domain.ExportExcelVo;
import net.su.dialog.formalModule.domain.NaverShoppingVo;
import net.su.dialog.formalModule.domain.NewsExportModule;
import net.su.dialog.formalModule.service.NaverShoppingExportService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.schedule.domain.ScheduleLog;

public class NaverShoppingExportScheduler {

	private SchedulerService schedulerService = new SchedulerService();

	private CommonMethods commonMethods = new CommonMethods();

	private NaverShoppingExportService naverShoppingExportService = new NaverShoppingExportService();

	private ExportExcelVo exportExcelVo = new ExportExcelVo();

	private String fileName;

	private String filePath;

	public void NaverShoppingExportScheduler() throws Exception {
		System.out.println("네이버쇼핑 반출 모듈");

		List<NewsExportModule> naverShoppingExportList = naverShoppingExportService.selectNaverShoppingExportList();
		
		naverShoppingExportFile(naverShoppingExportList);

	}

	public void naverShoppingExportFile(List<NewsExportModule> naverShoppingExportList) throws Exception {
		ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod(2);
		schedulerService.startInsertLog(scheduleLog);
		try {
			XSSFWorkbook wb = new XSSFWorkbook();
			
			for (int i = 0; i < naverShoppingExportList.size(); i++) {
				
				if (naverShoppingExportList.get(i).getRegularDataTableTitle().contains("phone_product_tb")) {
					
					// 휴대폰 제품 데이터 추출
					List<NaverShoppingVo> naverShoppingPhone = naverShoppingExportService.naverShoppingPhone(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());

					// 휴대폰 판매처 데이터 추출
					List<NaverShoppingVo> naverShoppingPhoneMall = naverShoppingExportService.naverShoppingPhoneMall(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());

					wb = phoneExportFile(naverShoppingPhone, naverShoppingPhoneMall);
				} 
				else if (naverShoppingExportList.get(i).getRegularDataTableTitle().contains("tablet_pc_product_tb")) {
					
					// 태블릿PC 제품 데이터 추출
					List<NaverShoppingVo> naverShoppingTablet = naverShoppingExportService.naverShoppingTablet(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());
	
					// 태블릿PC 판매처 데이터 추출
					List<NaverShoppingVo> naverShoppingTabletMall = naverShoppingExportService.naverShoppingTabletMall(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());
	
					wb =  tabletExportFile(naverShoppingTablet, naverShoppingTabletMall);
	
				} else if (naverShoppingExportList.get(i).getRegularDataTableTitle().contains("storage_device_product_tb")) {
					
					// 저장장치 제품 데이터 추출
					List<NaverShoppingVo> naverShoppingStorage = naverShoppingExportService.naverShoppingStorage(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());
	
					// 저장장치 판매처 데이터 추출
					List<NaverShoppingVo> naverShoppingStroageMall = naverShoppingExportService.naverShoppingStorageMall(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());
	
					wb = storageExportFile(naverShoppingStorage, naverShoppingStroageMall);
				} else if (naverShoppingExportList.get(i).getRegularDataTableTitle().contains("graphic_card_product_tb")) {
					
					// 그래픽카드 제품 데이터 추출
					List<NaverShoppingVo> naverShoppingGraphic = naverShoppingExportService.naverShoppingGraphic(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());
					
					// 그래픽카드 판매처 데이터 추출
					List<NaverShoppingVo> naverShoppingGraphicMall = naverShoppingExportService.naverShoppingGraphicMall(
							naverShoppingExportList.get(i).getRegularDataTableTitle(),
							naverShoppingExportList.get(i).getExportCollectWord(),
							naverShoppingExportList.get(i).getExportCollectStartDate(),
							naverShoppingExportList.get(i).getExportCollectEndDate());
					
					wb = graphicExportFile(naverShoppingGraphic, naverShoppingGraphicMall);
					
				} else {
					
					 // tv 제품 데이터 추출
					List<NaverShoppingVo> naverShoppingTV = naverShoppingExportService.naverShoppingTV(
						  naverShoppingExportList.get(i).getRegularDataTableTitle(),
						  naverShoppingExportList.get(i).getExportCollectWord(),
						  naverShoppingExportList.get(i).getExportCollectStartDate(),
						  naverShoppingExportList.get(i).getExportCollectEndDate());
					
					 // tv 판매처 데이터 추출
					List<NaverShoppingVo> naverShoppingTvMall = naverShoppingExportService.naverShoppingTvMall(
						  naverShoppingExportList.get(i).getRegularDataTableTitle(),
						  naverShoppingExportList.get(i).getExportCollectWord(),
						  naverShoppingExportList.get(i).getExportCollectStartDate(),
						  naverShoppingExportList.get(i).getExportCollectEndDate());
					 
					 wb = tvExportFile(naverShoppingTV, naverShoppingTvMall);
					 
				}
				
				FileOutputStream fileOut = null;
				
				// 반출 파일명
				fileName = "NaverShopping_" + naverShoppingExportList.get(i).getDateExportRequestCode() +"_"+naverShoppingExportList.get(i).getExportCollectStartDate() + "-" + naverShoppingExportList.get(i).getExportCollectEndDate();

				// 입력된 내용 파일로 쓰기
				fileOut = new FileOutputStream(getProjectPath() + "/src/main/resources/static/uploadFiles/rssExportFile/" + fileName + ".xlsx");
				String filePath = getProjectPath() + "/src/main/resources/static/uploadFiles/rssExportFile/" + fileName+ ".xlsx";
				wb.write(fileOut);
				fileOut.close();
				
				// 스케줄 데이터 반출 파일 등록
				schedulerService.insertDataExportFile(filePath,fileName,naverShoppingExportList.get(i).getScheCode());
			
				// 데이터 반출 요청 상태값 변경 및 스케줄 상태값 변경 
				schedulerService.updateExportRequestStatus(naverShoppingExportList.get(i).getDateExportRequestCode(), naverShoppingExportList.get(i).getScheCode());
			
				schedulerService.completeInsertLog(scheduleLog);
				
			}	
				
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"NaverShoppingExportScheduler(메서드 : naverShoppingExportFile, 네이버 쇼핑 반출 오류)");
			
		}
	}

	public XSSFWorkbook phoneExportFile(List<NaverShoppingVo> naverShoppingPhone, List<NaverShoppingVo> naverShoppingPhoneMall) throws Exception {
		
			// 헤더 정보 구성 - 제품
			exportExcelVo.setExcelProductTitle(
					"제품 식별자 , 제품 분류 , 제품 이름 , 제품 순위 , 제품 등록날짜 , 화면크기 , 해상도, RAM , 내장 메모리 , 외장 메모리 유형 , 운영체제 , 통신사 , 수집날짜 , 제품 URL");

			// 워크북 생성
			XSSFWorkbook wb = new XSSFWorkbook();

			// 워크시트 생성 - 제품
			XSSFSheet sheet = wb.createSheet(exportExcelVo.getDownFileProductNm());

			// 워크시트 생성 - 판매처
			XSSFSheet sheet2 = wb.createSheet(exportExcelVo.getDownFileMallNm());

			// 행 생성 - 제품
			String titleArr[] = exportExcelVo.getExcelProductTitle().split(",");

			// 행 생성 - 판매처
			String titleArr2[] = exportExcelVo.getExcelMallTitle().split(",");

			// 셀 생성
			Cell cell = null;

			Row row = sheet.createRow(0);

			Row row2 = sheet2.createRow(0);

			for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
				cell = row.createCell(titleNo);
				cell.setCellValue(titleArr[titleNo]);
			}

			for (int titleNo = 0; titleNo < titleArr2.length; titleNo++) {
				cell = row2.createCell(titleNo);
				cell.setCellValue(titleArr2[titleNo]);
			}

			NaverShoppingVo vo2;

			// 리스트의 size 만큼 row를 생성
			for (int rowIdx = 0; rowIdx < naverShoppingPhoneMall.size(); rowIdx++) {
				vo2 = naverShoppingPhoneMall.get(rowIdx);

				// 행 생성
				row2 = sheet2.createRow(rowIdx + 1);
				cell = row2.createCell(0);
				cell.setCellValue(vo2.getMallSeq());

				cell = row2.createCell(1);
				cell.setCellValue(vo2.getMallNme());

				cell = row2.createCell(2);
				cell.setCellValue(vo2.getMallPrice());

				cell = row2.createCell(3);
				cell.setCellValue(vo2.getMallGood());

				cell = row2.createCell(4);
				cell.setCellValue(vo2.getMallDiscount());

				cell = row2.createCell(5);
				cell.setCellValue(vo2.getMallAddition());

				cell = row2.createCell(6);
				cell.setCellValue(vo2.getMallDeliveryCost());

				cell = row2.createCell(7);
				cell.setCellValue(vo2.getMallPriceDate());

				cell = row2.createCell(8);
				cell.setCellValue(vo2.getProductDescription());

				cell = row2.createCell(9);
				cell.setCellValue(vo2.getCollection_date());

				cell = row2.createCell(10);
				cell.setCellValue(vo2.getMallUrlAddress());

				cell = row2.createCell(11);
				cell.setCellValue(vo2.getPhoneSeq());

			}

			NaverShoppingVo vo;
			for (int rowIdx = 0; rowIdx < naverShoppingPhone.size(); rowIdx++) {
				vo = naverShoppingPhone.get(rowIdx);

				// 행 생성
				row = sheet.createRow(rowIdx + 1);
				cell = row.createCell(0);
				cell.setCellValue(vo.getPhoneSeq());

				cell = row.createCell(1);
				cell.setCellValue(vo.getProductKategorie());

				cell = row.createCell(2);
				cell.setCellValue(vo.getProductTitle());

				cell = row.createCell(3);
				cell.setCellValue(vo.getProductRank());

				cell = row.createCell(4);
				cell.setCellValue(vo.getProductRegisteredDate());

				cell = row.createCell(5);
				cell.setCellValue(vo.getPhoneScreenSize());

				cell = row.createCell(6);
				cell.setCellValue(vo.getPhoneResolution());

				cell = row.createCell(7);
				cell.setCellValue(vo.getPhoneRam());

				cell = row.createCell(8);
				cell.setCellValue(vo.getPhoneEmbedMemory());

				cell = row.createCell(9);
				cell.setCellValue(vo.getPhoneExternalMemoryType());

				cell = row.createCell(10);
				cell.setCellValue(vo.getPhoneOperatingSystem());

				cell = row.createCell(11);
				cell.setCellValue(vo.getPhoneAgency());

				cell = row.createCell(12);
				cell.setCellValue(vo.getCollection_date());

				cell = row.createCell(13);
				cell.setCellValue(vo.getProductUrlAdress());
			}
		return wb;
	}

	public XSSFWorkbook tabletExportFile(List<NaverShoppingVo> naverShoppingTablet,
			List<NaverShoppingVo> naverShoppingTabletMall) throws Exception {

		// 헤더 정보 구성 - 제품
		exportExcelVo.setExcelProductTitle(
				"제품 식별자 , 제품 분류 , 제품 이름 , 제품 순위 , 제품 등록날짜 , 화면크기 , 해상도, 칩셋 제조사 , 시리즈 , 무선랜 , 블루투스 , 웹카메라 , 무게, 운영체제,  수집날짜 , 제품 URL");

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		// 워크시트 생성 - 제품
		XSSFSheet sheet = wb.createSheet(exportExcelVo.getDownFileProductNm());

		// 워크시트 생성 - 판매처
		XSSFSheet sheet2 = wb.createSheet(exportExcelVo.getDownFileMallNm());

		// 행 생성 - 제품
		String titleArr[] = exportExcelVo.getExcelProductTitle().split(",");

		// 행 생성 - 판매처
		String titleArr2[] = exportExcelVo.getExcelMallTitle().split(",");

		// 셀 생성
		Cell cell = null;

		Row row = sheet.createRow(0);

		Row row2 = sheet2.createRow(0);

		for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
			cell = row.createCell(titleNo);
			cell.setCellValue(titleArr[titleNo]);
		}

		for (int titleNo = 0; titleNo < titleArr2.length; titleNo++) {
			cell = row2.createCell(titleNo);
			cell.setCellValue(titleArr2[titleNo]);
		}

		NaverShoppingVo vo2;

		// 리스트의 size 만큼 row를 생성
		for (int rowIdx = 0; rowIdx < naverShoppingTabletMall.size(); rowIdx++) {
			vo2 = naverShoppingTabletMall.get(rowIdx);

			// 행 생성
			row2 = sheet2.createRow(rowIdx + 1);
			cell = row2.createCell(0);
			cell.setCellValue(vo2.getMallSeq());

			cell = row2.createCell(1);
			cell.setCellValue(vo2.getMallNme());

			cell = row2.createCell(2);
			cell.setCellValue(vo2.getMallPrice());

			cell = row2.createCell(3);
			cell.setCellValue(vo2.getMallGood());

			cell = row2.createCell(4);
			cell.setCellValue(vo2.getMallDiscount());

			cell = row2.createCell(5);
			cell.setCellValue(vo2.getMallAddition());

			cell = row2.createCell(6);
			cell.setCellValue(vo2.getMallDeliveryCost());

			cell = row2.createCell(7);
			cell.setCellValue(vo2.getMallPriceDate());

			cell = row2.createCell(8);
			cell.setCellValue(vo2.getProductDescription());

			cell = row2.createCell(9);
			cell.setCellValue(vo2.getCollection_date());

			cell = row2.createCell(10);
			cell.setCellValue(vo2.getMallUrlAddress());

			cell = row2.createCell(11);
			cell.setCellValue(vo2.getTabletSeq());

		}

		NaverShoppingVo vo;
		for (int rowIdx = 0; rowIdx < naverShoppingTablet.size(); rowIdx++) {
			vo = naverShoppingTablet.get(rowIdx);

			// 행 생성
			row = sheet.createRow(rowIdx + 1);
			cell = row.createCell(0);
			cell.setCellValue(vo.getTabletSeq());

			cell = row.createCell(1);
			cell.setCellValue(vo.getProductKategorie());

			cell = row.createCell(2);
			cell.setCellValue(vo.getProductTitle());

			cell = row.createCell(3);
			cell.setCellValue(vo.getProductRank());

			cell = row.createCell(4);
			cell.setCellValue(vo.getProductRegisteredDate());

			cell = row.createCell(5);
			cell.setCellValue(vo.getTabletScreenSize());

			cell = row.createCell(6);
			cell.setCellValue(vo.getTabletResolution());

			cell = row.createCell(7);
			cell.setCellValue(vo.getTabletChipset_maker());

			cell = row.createCell(8);
			cell.setCellValue(vo.getTabletSeries());

			cell = row.createCell(9);
			cell.setCellValue(vo.getTabletWireless_lan());

			cell = row.createCell(10);
			cell.setCellValue(vo.getTabletBluetooth());

			cell = row.createCell(11);
			cell.setCellValue(vo.getTabletWeb_camera());

			cell = row.createCell(12);
			cell.setCellValue(vo.getTabletWeight());

			cell = row.createCell(13);
			cell.setCellValue(vo.getTabletOperatingSystem());

			cell = row.createCell(14);
			cell.setCellValue(vo.getCollection_date());

			cell = row.createCell(15);
			cell.setCellValue(vo.getProductUrlAdress());
		}
		return wb;
	}

	public XSSFWorkbook storageExportFile(List<NaverShoppingVo> naverShoppingStorage,
			List<NaverShoppingVo> naverShoppingStroageMall) throws Exception {

		// 헤더 정보 구성 - 제품
		exportExcelVo.setExcelProductTitle(
				"제품 식별자 , 제품 분류 , 제품 이름 , 제품 순위 , 제품 등록날짜 , HDD 사이즈 , HDD 방식, PC 연결방식 , 부가기능 ,  수집날짜 , 제품 URL");

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		// 워크시트 생성 - 제품
		XSSFSheet sheet = wb.createSheet(exportExcelVo.getDownFileProductNm());

		// 워크시트 생성 - 판매처
		XSSFSheet sheet2 = wb.createSheet(exportExcelVo.getDownFileMallNm());

		// 행 생성 - 제품
		String titleArr[] = exportExcelVo.getExcelProductTitle().split(",");

		// 행 생성 - 판매처
		String titleArr2[] = exportExcelVo.getExcelMallTitle().split(",");

		// 셀 생성
		Cell cell = null;

		Row row = sheet.createRow(0);

		Row row2 = sheet2.createRow(0);

		for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
			cell = row.createCell(titleNo);
			cell.setCellValue(titleArr[titleNo]);
		}

		for (int titleNo = 0; titleNo < titleArr2.length; titleNo++) {
			cell = row2.createCell(titleNo);
			cell.setCellValue(titleArr2[titleNo]);
		}

		NaverShoppingVo vo2;

		// 리스트의 size 만큼 row를 생성
		for (int rowIdx = 0; rowIdx < naverShoppingStroageMall.size(); rowIdx++) {
			vo2 = naverShoppingStroageMall.get(rowIdx);

			// 행 생성
			row2 = sheet2.createRow(rowIdx + 1);
			cell = row2.createCell(0);
			cell.setCellValue(vo2.getMallSeq());

			cell = row2.createCell(1);
			cell.setCellValue(vo2.getMallNme());

			cell = row2.createCell(2);
			cell.setCellValue(vo2.getMallPrice());

			cell = row2.createCell(3);
			cell.setCellValue(vo2.getMallGood());

			cell = row2.createCell(4);
			cell.setCellValue(vo2.getMallDiscount());

			cell = row2.createCell(5);
			cell.setCellValue(vo2.getMallAddition());

			cell = row2.createCell(6);
			cell.setCellValue(vo2.getMallDeliveryCost());

			cell = row2.createCell(7);
			cell.setCellValue(vo2.getMallPriceDate());

			cell = row2.createCell(8);
			cell.setCellValue(vo2.getProductDescription());

			cell = row2.createCell(9);
			cell.setCellValue(vo2.getCollection_date());

			cell = row2.createCell(10);
			cell.setCellValue(vo2.getMallUrlAddress());

			cell = row2.createCell(11);
			cell.setCellValue(vo2.getStorageSeq());

		}

		NaverShoppingVo vo;
		for (int rowIdx = 0; rowIdx < naverShoppingStorage.size(); rowIdx++) {
			vo = naverShoppingStorage.get(rowIdx);

			// 행 생성
			row = sheet.createRow(rowIdx + 1);
			cell = row.createCell(0);
			cell.setCellValue(vo.getStorageSeq());

			cell = row.createCell(1);
			cell.setCellValue(vo.getProductKategorie());

			cell = row.createCell(2);
			cell.setCellValue(vo.getProductTitle());

			cell = row.createCell(3);
			cell.setCellValue(vo.getProductRank());

			cell = row.createCell(4);
			cell.setCellValue(vo.getProductRegisteredDate());

			cell = row.createCell(5);
			cell.setCellValue(vo.getStorageHddSize());

			cell = row.createCell(6);
			cell.setCellValue(vo.getStoragePcConnectWay());

			cell = row.createCell(7);
			cell.setCellValue(vo.getStorageAddFunction());

			cell = row.createCell(8);
			cell.setCellValue(vo.getCollection_date());

			cell = row.createCell(9);
			cell.setCellValue(vo.getProductUrlAdress());
		}
		return wb;
	}
	
	public XSSFWorkbook graphicExportFile(List<NaverShoppingVo> naverShoppingGraphic,
			List<NaverShoppingVo> naverShoppingGraphicMall) throws Exception {

		// 헤더 정보 구성 - 제품
		exportExcelVo.setExcelProductTitle(
				"제품 식별자 , 제품 분류 , 제품 이름 , 제품 순위 , 제품 등록날짜 , 칩셋, 메모리, 메모리 유형, 메모리 대역폭, 메모리 클럭, GPU 클럭, 프로세서, 그래픽 인터페이스, 출력단자, 스트림 프로세서,   수집날짜 , 제품 URL");

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		// 워크시트 생성 - 제품
		XSSFSheet sheet = wb.createSheet(exportExcelVo.getDownFileProductNm());

		// 워크시트 생성 - 판매처
		XSSFSheet sheet2 = wb.createSheet(exportExcelVo.getDownFileMallNm());

		// 행 생성 - 제품
		String titleArr[] = exportExcelVo.getExcelProductTitle().split(",");

		// 행 생성 - 판매처
		String titleArr2[] = exportExcelVo.getExcelMallTitle().split(",");

		// 셀 생성
		Cell cell = null;

		Row row = sheet.createRow(0);

		Row row2 = sheet2.createRow(0);

		for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
			cell = row.createCell(titleNo);
			cell.setCellValue(titleArr[titleNo]);
		}

		for (int titleNo = 0; titleNo < titleArr2.length; titleNo++) {
			cell = row2.createCell(titleNo);
			cell.setCellValue(titleArr2[titleNo]);
		}

		NaverShoppingVo vo2;

		// 리스트의 size 만큼 row를 생성
		for (int rowIdx = 0; rowIdx < naverShoppingGraphicMall.size(); rowIdx++) {
			vo2 = naverShoppingGraphicMall.get(rowIdx);

			// 행 생성
			row2 = sheet2.createRow(rowIdx + 1);
			cell = row2.createCell(0);
			cell.setCellValue(vo2.getMallSeq());

			cell = row2.createCell(1);
			cell.setCellValue(vo2.getMallNme());

			cell = row2.createCell(2);
			cell.setCellValue(vo2.getMallPrice());

			cell = row2.createCell(3);
			cell.setCellValue(vo2.getMallGood());

			cell = row2.createCell(4);
			cell.setCellValue(vo2.getMallDiscount());

			cell = row2.createCell(5);
			cell.setCellValue(vo2.getMallAddition());

			cell = row2.createCell(6);
			cell.setCellValue(vo2.getMallDeliveryCost());

			cell = row2.createCell(7);
			cell.setCellValue(vo2.getMallPriceDate());

			cell = row2.createCell(8);
			cell.setCellValue(vo2.getProductDescription());

			cell = row2.createCell(9);
			cell.setCellValue(vo2.getCollection_date());

			cell = row2.createCell(10);
			cell.setCellValue(vo2.getMallUrlAddress());

			cell = row2.createCell(11);
			cell.setCellValue(vo2.getGraphiccardSeq());

		}

		NaverShoppingVo vo;
		for (int rowIdx = 0; rowIdx < naverShoppingGraphic.size(); rowIdx++) {
			vo = naverShoppingGraphic.get(rowIdx);

			// 행 생성
			row = sheet.createRow(rowIdx + 1);
			cell = row.createCell(0);
			cell.setCellValue(vo.getGraphiccardSeq());

			cell = row.createCell(1);
			cell.setCellValue(vo.getProductKategorie());

			cell = row.createCell(2);
			cell.setCellValue(vo.getProductTitle());

			cell = row.createCell(3);
			cell.setCellValue(vo.getProductRank());

			cell = row.createCell(4);
			cell.setCellValue(vo.getProductRegisteredDate());

			cell = row.createCell(5);
			cell.setCellValue(vo.getGraphiccardChipset());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getGraphiccardMemory());
			
			cell = row.createCell(6);
			cell.setCellValue(vo.getGraphiccardMemoryType());
			
			cell = row.createCell(7);
			cell.setCellValue(vo.getGraphiccardMemoryBandwidth());
			
			cell = row.createCell(8);
			cell.setCellValue(vo.getGraphiccardMemoryCluck());
			
			cell = row.createCell(9);
			cell.setCellValue(vo.getGraphiccardGpuCluck());
			
			cell = row.createCell(10);
			cell.setCellValue(vo.getGraphiccardProcessor());
			
			cell = row.createCell(11);
			cell.setCellValue(vo.getGraphiccardInterface());
			
			cell = row.createCell(12);
			cell.setCellValue(vo.getGraphiccardOutputJack());
			
			cell = row.createCell(13);
			cell.setCellValue(vo.getGraphiccardStreamProcess());

			cell = row.createCell(14);
			cell.setCellValue(vo.getCollection_date());

			cell = row.createCell(15);
			cell.setCellValue(vo.getProductUrlAdress());
		}
		return wb;
	}
	
	public XSSFWorkbook tvExportFile(List<NaverShoppingVo> naverShoppingTV,
			List<NaverShoppingVo> naverShoppingTvMall) throws Exception {

		// 헤더 정보 구성 - 제품
		exportExcelVo.setExcelProductTitle(
				"제품 식별자 , 제품 분류 , 제품 이름 , 제품 순위 , 제품 등록날짜 , 화면크기, 화면형태, 해상도, 화면비율, 유형, 단자, 부가기능, 에너지 효율, 소비전력, 밝기,백라이트, 수집날짜 , 제품 URL");

		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();

		// 워크시트 생성 - 제품
		XSSFSheet sheet = wb.createSheet(exportExcelVo.getDownFileProductNm());

		// 워크시트 생성 - 판매처
		XSSFSheet sheet2 = wb.createSheet(exportExcelVo.getDownFileMallNm());

		// 행 생성 - 제품
		String titleArr[] = exportExcelVo.getExcelProductTitle().split(",");

		// 행 생성 - 판매처
		String titleArr2[] = exportExcelVo.getExcelMallTitle().split(",");

		// 셀 생성
		Cell cell = null;

		Row row = sheet.createRow(0);

		Row row2 = sheet2.createRow(0);

		for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
			cell = row.createCell(titleNo);
			cell.setCellValue(titleArr[titleNo]);
		}

		for (int titleNo = 0; titleNo < titleArr2.length; titleNo++) {
			cell = row2.createCell(titleNo);
			cell.setCellValue(titleArr2[titleNo]);
		}

		NaverShoppingVo vo2;

		// 리스트의 size 만큼 row를 생성
		for (int rowIdx = 0; rowIdx < naverShoppingTvMall.size(); rowIdx++) {
			vo2 = naverShoppingTvMall.get(rowIdx);

			// 행 생성
			row2 = sheet2.createRow(rowIdx + 1);
			cell = row2.createCell(0);
			cell.setCellValue(vo2.getMallSeq());

			cell = row2.createCell(1);
			cell.setCellValue(vo2.getMallNme());

			cell = row2.createCell(2);
			cell.setCellValue(vo2.getMallPrice());

			cell = row2.createCell(3);
			cell.setCellValue(vo2.getMallGood());

			cell = row2.createCell(4);
			cell.setCellValue(vo2.getMallDiscount());

			cell = row2.createCell(5);
			cell.setCellValue(vo2.getMallAddition());

			cell = row2.createCell(6);
			cell.setCellValue(vo2.getMallDeliveryCost());

			cell = row2.createCell(7);
			cell.setCellValue(vo2.getMallPriceDate());

			cell = row2.createCell(8);
			cell.setCellValue(vo2.getProductDescription());

			cell = row2.createCell(9);
			cell.setCellValue(vo2.getCollection_date());

			cell = row2.createCell(10);
			cell.setCellValue(vo2.getMallUrlAddress());

			cell = row2.createCell(11);
			cell.setCellValue(vo2.getTvSeq());

		}

		NaverShoppingVo vo;
		for (int rowIdx = 0; rowIdx < naverShoppingTV.size(); rowIdx++) {
			vo = naverShoppingTV.get(rowIdx);

			// 행 생성
			row = sheet.createRow(rowIdx + 1);
			cell = row.createCell(0);
			cell.setCellValue(vo.getTvSeq());

			cell = row.createCell(1);
			cell.setCellValue(vo.getProductKategorie());

			cell = row.createCell(2);
			cell.setCellValue(vo.getProductTitle());

			cell = row.createCell(3);
			cell.setCellValue(vo.getProductRank());

			cell = row.createCell(4);
			cell.setCellValue(vo.getProductRegisteredDate());

			cell = row.createCell(5);
			cell.setCellValue(vo.getTvScreenSize());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getTvShape());
			
			cell = row.createCell(6);
			cell.setCellValue(vo.getTvResolution());
			
			cell = row.createCell(7);
			cell.setCellValue(vo.getTvAspectRatio());
			
			cell = row.createCell(8);
			cell.setCellValue(vo.getTvType());
			
			cell = row.createCell(9);
			cell.setCellValue(vo.getTvTerminal());
			
			cell = row.createCell(10);
			cell.setCellValue(vo.getTvTechnique());
			
			cell = row.createCell(11);
			cell.setCellValue(vo.getTvEnergyEfficiency());
			
			cell = row.createCell(12);
			cell.setCellValue(vo.getTvPowerConsumption());
			
			cell = row.createCell(13);
			cell.setCellValue(vo.getTvBrightness());

			cell = row.createCell(14);
			cell.setCellValue(vo.getTvBackLight());
			
			cell = row.createCell(15);
			cell.setCellValue(vo.getCollection_date());
			
			cell = row.createCell(16);
			cell.setCellValue(vo.getProductUrlAdress());
		
		}
		return wb;
	}

	// 프로젝트 경로 반환
	public String getProjectPath() {
		String classPath = this.getClass().getResource("").getPath();
		return classPath.substring(1, classPath.indexOf("/target/classes/"));
	}

}
