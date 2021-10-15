package net.su.dialog.formalModule.scheduler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import net.su.dialog.CommonMethods;
import net.su.dialog.formalModule.domain.DaumNewsData;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.service.DaumNewsExportService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.schedule.domain.ScheduleLog;

public class DaumNewsExportScheduler {
	private DaumNewsExportService daumNewsExportService = new DaumNewsExportService();

	private SchedulerService schedulerService = new SchedulerService();

	private CommonMethods commonMethods = new CommonMethods();

	private int schedulerSuccess = 0;

	private String fileName;

	private String filePath;

	public void daumNewsExportScheduler() throws Exception {
		ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();

		schedulerService.startInsertLog(scheduleLog);

		List<DaumNewsModule> daumNewsExportList = daumNewsExportService.selectDaumNewsExportList();

		insertDaumNewsExportFile(daumNewsExportList);

		if (schedulerSuccess == 1) {
			schedulerService.completeInsertLog(scheduleLog);

			// 스케줄 상태 변경 - 작동완료 -
			schedulerService.rssSchedulerStatus(scheduleLog);

		}
	}

	public void insertDaumNewsExportFile(List<DaumNewsModule> daumNewsExportList) throws Exception {
		for (int i = 0; i < daumNewsExportList.size(); i++) {

			List<DaumNewsData> daumNewsData = daumNewsExportService
					.daumNewsData(daumNewsExportList.get(i).getRegularDataTableTitle());

			String excelTitle = "뉴스 식별자,뉴스 제목,뉴스 내용,뉴스 등록일,뉴스 수정일,뉴스 기자,신문사,뉴스 링크";

			String downFileNm = "다음 뉴스";

			XSSFWorkbook wb = new XSSFWorkbook();

			XSSFSheet sheet = wb.createSheet(downFileNm);

			String titleArr[] = excelTitle.split(",");

			Cell cell = null;

			Row row = sheet.createRow(0);

			for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
				cell = row.createCell(titleNo);
				cell.setCellValue(titleArr[titleNo]);
			}

			int k = 1;

			for (Object obj : daumNewsData) {

				row = sheet.createRow(k++);

				int p = 0;

				for (Field field : obj.getClass().getDeclaredFields()) {

					field.setAccessible(true);
					Object value = field.get(obj);
					if (value == null) {
						cell = row.createCell(p++);
						cell.setCellValue("");
					} else {
						cell = row.createCell(p++);
						cell.setCellValue(String.valueOf(value));
					}
				}
			}

			FileOutputStream fileOut = null;
			// 반출 파일명
			fileName = "DaumNews_" +daumNewsExportList.get(i).getDataExportRequestCode() +"_" +daumNewsExportList.get(i).getNewsCollectStartDate() + "-" + daumNewsExportList.get(i).getNewsCollectEndDate();

			try {

				fileOut = new FileOutputStream(getProjectPath() + "/src/main/resources/static/uploadFiles/rssExportFile/" + fileName + ".xlsx");
				String filePath = getProjectPath() + "/src/main/resources/static/uploadFiles/rssExportFile/" + fileName+ ".xlsx";
				wb.write(fileOut);
				fileOut.close();

				// 스케줄 데이터 반출 파일 등록
				daumNewsExportService.insertDataExportFile(filePath, fileName,
						daumNewsExportList.get(i).getScheduleCode());
				// 데이터 반출 요청 상태값 변경 및 스케줄 상태값 변경
				daumNewsExportService.updateExportRequestStatus(daumNewsExportList.get(i).getDataExportRequestCode(),
						daumNewsExportList.get(i).getScheduleCode());

				schedulerSuccess = 1;

			} catch (Exception e) {
				SchedulerService schedulerService = new SchedulerService();
				schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
						"DaumNewsExportScheduler(메서드 : DaumNewsExportScheduler, 다음뉴스 반출 오류)");
			}
		}
	}

	// 프로젝트 경로 반환
	public String getProjectPath() {
		String classPath = this.getClass().getResource("").getPath();
		return classPath.substring(1, classPath.indexOf("/target/classes/"));
	}

}
