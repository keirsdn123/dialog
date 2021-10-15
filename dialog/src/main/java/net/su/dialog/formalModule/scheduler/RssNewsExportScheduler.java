package net.su.dialog.formalModule.scheduler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;

import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.CommonMethods;
import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.domain.NewsExportModule;
import net.su.dialog.formalModule.domain.RssNewsModule;
import net.su.dialog.formalModule.service.RssNewsExportService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.schedule.domain.ScheduleLog;

public class RssNewsExportScheduler {

	private RssNewsExportService rssNewsExportService = new RssNewsExportService();

	private SchedulerService schedulerService = new SchedulerService();

	private CommonMethods commonMethods = new CommonMethods();

	private int schedulerSuccess = 0;

	private String fileName;

	private String filePath;

	public void RssNewsExportScheduler() throws Exception {
		System.out.println("RSS 반출 모듈");
		ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();

		schedulerService.startInsertLog(scheduleLog);

		List<NewsExportModule> rssNewsExportList = rssNewsExportService.selectRssNewsExportList();

		rssNewsExportFile(rssNewsExportList);

		if (schedulerSuccess == 1) {
			schedulerService.completeInsertLog(scheduleLog);

			// 스케줄 상태 변경 - 작동완료 -
			schedulerService.rssSchedulerStatus(scheduleLog);

		}

	}

	public void rssNewsExportFile(List<NewsExportModule> rssNewsExportList) throws Exception {
		try {
			for (int i = 0; i < rssNewsExportList.size(); i++) {

				List<RssNewsModule> rssNewsModule = rssNewsExportService.rssNewsData(
						rssNewsExportList.get(i).getRegularDataTableTitle(),
						rssNewsExportList.get(i).getExportCollectWord(),
						rssNewsExportList.get(i).getExportCollectStartDate(),
						rssNewsExportList.get(i).getExportCollectEndDate());

				// 헤더 정보 구성
				String excelTitle = "뉴스 식별자,뉴스 제목,뉴스 내용,뉴스 등록일,뉴스 수정일,뉴스 기자,뉴스 카테고리,뉴스 링크";

				// 시트 이름 구성
				String downFileNm = "RSS 뉴스";

				// 워크북 생성
				XSSFWorkbook wb = new XSSFWorkbook();
				// 워크시트 생성
				XSSFSheet sheet = wb.createSheet(downFileNm);
				// 행 생성
				String titleArr[] = excelTitle.split(",");
				// 셀 생성
				Cell cell = null;

				Row row = sheet.createRow(0);

				for (int titleNo = 0; titleNo < titleArr.length; titleNo++) {
					cell = row.createCell(titleNo);
					cell.setCellValue(titleArr[titleNo]);
				}

				int k = 1;

				for (Object obj : rssNewsModule) {

					row = sheet.createRow(k);

					int p = 0;

					for (Field field : obj.getClass().getDeclaredFields()) {

						field.setAccessible(true);
						Object value = field.get(obj);
						if (value == null) {
							cell = row.createCell(p);
							cell.setCellValue("");
						} else {
							cell = row.createCell(p);
							cell.setCellValue(String.valueOf(value));
						}
						p++;
					}
					k++;
				}

				FileOutputStream fileOut = null;
				// 반출 파일명
				fileName = "RssNews_" + rssNewsExportList.get(i).getDateExportRequestCode()+"_"+rssNewsExportList.get(i).getExportCollectStartDate() + "-"
						+ rssNewsExportList.get(i).getExportCollectEndDate();

				fileOut = new FileOutputStream(
						getProjectPath() + "/src/main/resources/static/uploadFiles/rssExportFile/" + fileName + ".xlsx");
				String filePath = getProjectPath() + "/src/main/resources/static/uploadFiles/rssExportFile/" + fileName
						+ ".xlsx";
				wb.write(fileOut);
				fileOut.close();

				// 스케줄 데이터 반출 파일 등록
				schedulerService.insertDataExportFile(filePath, fileName, rssNewsExportList.get(i).getScheCode());

				// 데이터 반출 요청 상태값 변경 및 스케줄 상태값 변경
				schedulerService.updateExportRequestStatus(rssNewsExportList.get(i).getDateExportRequestCode(),
						rssNewsExportList.get(i).getScheCode());

				schedulerSuccess = 1;

			}

		} catch (IOException e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsExportScheduler(메서드 : rssNewsExportFile, RSS 반출 오류)");
		}

	}

	// 프로젝트 경로 반환
	public String getProjectPath() {
		String classPath = this.getClass().getResource("").getPath();
		return classPath.substring(1, classPath.indexOf("/target/classes/"));
	}
}
