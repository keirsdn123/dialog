package net.su.dialog.schedule.controller;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.schedule.domain.DataCollectionVo;
import net.su.dialog.schedule.domain.DataDevelopSourceVo;
import net.su.dialog.schedule.domain.DataExportVo;
import net.su.dialog.schedule.domain.SchVo;
import net.su.dialog.schedule.domain.ScheduleLog;
import net.su.dialog.schedule.service.ScheService;

@RestController
public class ScheduleAjaxController {

   @Autowired
   private ScheService mainService;
   @Autowired
   private SchedulerService schedulerService;

   // 스케줄 조회
   @RequestMapping("/selectSche")
   public List<SchVo> getSchList(SchVo schVo) throws Exception {
      return mainService.selectSche(schVo);
   }
   
   // 스케줄 등록
   @RequestMapping("/insertSche")
   public void insertSche(SchVo schVo) throws Exception {
      System.out.println("스케줄 크론 " + schVo.getScheCron());
      mainService.insertSche(schVo);
   }

   // 스케줄 삭제
   @RequestMapping("/deleteSche")
   public void deleteSche(SchVo schVo) throws Exception {
      mainService.deleteSche(schVo);
   }

   // 스케줄 상세조회
   @RequestMapping("/scheduleinfo")
   public SchVo infoSches(SchVo schVo) throws Exception {
      return mainService.scheduleinfo(schVo);
   }

   // 스케줄 등록 (다음 수집 요청)
   @RequestMapping("/dataCollectioninsertSche")
   public void dataCollectioninsertSche(SchVo schVo, DataRequest dataRequest, DataCollectionVo dataCollectionVo)
         throws Exception {
      File file = new File("scheduler");
      schVo.setDaumSchedulerPath(file.getAbsolutePath());
      // 스케줄 등록
      mainService.insertSche(schVo);
      // 다음 뉴스 크롤링 등록
      dataCollectionVo.setScheCode(schVo.getScheCode());
      dataCollectionVo.setDaumNewsDataCollectRequestCode(dataRequest.getDaumNewsDataCollectRequestCode());
      dataCollectionVo.setDaumNewsRequestCollectEndDate(dataRequest.getDaumNewsRequestCollectEndDate());
      dataCollectionVo.setDaumNewsRequestCollectStartDate(dataRequest.getDaumNewsRequestCollectStartDate());
      dataCollectionVo.setDaumNewsRequestCollectWord(dataRequest.getDaumNewsRequestCollectWord());
      dataCollectionVo.setDevSourceCode(dataRequest.getDevSourceCode());
      mainService.insertDataCollection(dataCollectionVo);

      // 데이터 반출 요청 상태값 변경 - 스케줄 등록
      mainService.updataDaumNewsExportStatus(dataRequest.getDaumNewsDataCollectRequestCode());
      // 다음 뉴스 정형적 모듈 등록
      mainService.insertDevSourceFormalModule(schVo);

      schedulerService.scheduleTaskUpdate();
   }

   // 스케줄 등록 (데이터 반출 요청)
   @RequestMapping("/dataExportinsertSche")
   public void dataExportinsertSche(SchVo schVo, DataRequest dataRequest, DataExportVo dataExportVo) throws Exception {
      // 클래스 경로 추출
      File file = new File("scheduler");
      schVo.setDaumSchedulerPath(file.getAbsolutePath());

      mainService.insertSche(schVo);
      dataExportVo.setScheCode(schVo.getScheCode());
      int dataExportManagementCode = mainService.selectDataExportManagement(dataRequest);
      dataRequest.setDataExportManagementCode(dataExportManagementCode);
      dataExportVo.setDataExportManagementCode(dataRequest.getDataExportManagementCode());
      mainService.insertDataExport(dataExportVo);
      System.out.println("도는 지 확인" + dataRequest.getDataExportRequestCode());
      // 데이터 반출 요청 상태값 변경 - 스케줄 등록
      mainService.updataRssExportStatus(dataRequest.getDataExportRequestCode());

      // 다음 뉴스 정형적 모듈 등록
      mainService.insertDevSourceFormalModuleExport(schVo);

      schedulerService.scheduleTaskUpdate();
   }
   
   // 스케줄 등록 (개발 소스 파일)
   @RequestMapping("/devinsertSche")
   public void devinsertSche(SchVo schVo, DataDevelopSourceVo dataDevelopSourceVo) throws Exception {
      // 클래스 경로 추출
//      File file = new File("scheduler");
//      schVo.setDaumSchedulerPath(file.getAbsolutePath());
      
      mainService.insertSche(schVo);
      dataDevelopSourceVo.setScheCode(schVo.getScheCode());
      
      // 외부 개발소스파일 커스터마이징 스케줄 코드 업데이트 
      mainService.devFileCusScheUpdate(dataDevelopSourceVo);
      
      System.out.println("뭐지" + schVo.getScheType());
      // 외부 개발소스파일 정형적 모듈 등록
      mainService.insertDevSourceFormalModuleExport(schVo);

      schedulerService.scheduleTaskUpdate();
   }

   // 스케줄 등록 (중복검사)
   @RequestMapping("/selectOverlap")
   public SchVo selectOverlap(SchVo schVo) throws Exception {

      return mainService.selectOverlap(schVo);
   }

   // 개발소스파일 상세조회
   @RequestMapping("/developSourceInfo")
   public DevelopSource developSourceInfo(DevelopSource developSource) throws Exception {

      return mainService.developSourceInfo(developSource);
   }

   // 스케줄 등록 (개발 소스파일)
   @RequestMapping("/insertDevelopSourceSche")
   public void insertDevelopSourceSche(SchVo schVo, DevelopSource developSource,
         DataDevelopSourceVo dataDevelopSourceVo) throws Exception {
      System.out.println("개발소스코드" + developSource.getDevSourceCode());
      mainService.insertSche(schVo);
      mainService.insertScheCrawling(schVo);
      dataDevelopSourceVo.setScheCode(schVo.getScheCode());
      dataDevelopSourceVo.setDevSourceCode(developSource.getDevSourceCode());
      mainService.updateDevelopmentSche(dataDevelopSourceVo);
   }

   // 스케줄 중지
   @RequestMapping("/stopSche")
   public void stopSche(SchVo schVo) throws Exception {
      // 스케줄 상태값 변경
      mainService.stopSche(schVo);

      // 개발소스파일 모듈 조회
      ScheduleLog scheduleLog = mainService.selectDevSourceInfo(schVo);
      schedulerService.stopInsertLog(scheduleLog);

      schedulerService.scheduleTaskUpdate();

   }

   // 스케줄 재시작
   @RequestMapping("/restartSche")
   public void restartSche(SchVo schVo) throws Exception {
      mainService.restartSche(schVo);

      // 개발소스파일 모듈 조회
      ScheduleLog scheduleLog = mainService.selectDevSourceInfo(schVo);
      schedulerService.startInsertLog(scheduleLog);

      schedulerService.scheduleTaskUpdate();
   }

   // 스케줄 수정
   @RequestMapping("/updateSche")
   public void updateSche(SchVo schVo) throws Exception {
      mainService.updateSche(schVo);

//      // 개발소스파일 모듈 조회
//      ScheduleLog scheduleLog = mainService.selectDevSourceInfo(schVo);
//      schedulerService.startInsertLog(scheduleLog);

      schedulerService.scheduleTaskUpdate();
   }

   // //스케줄 로그 조회
   @RequestMapping("/selectScheduleLog")
   public List<ScheduleLog> selectScheduleLog() throws Exception {
      return mainService.selectScheduleLog();
   }

   // 스케줄 에러 로그 조회
   @RequestMapping("/selectScheErrorLog")
   public ScheduleLog selectScheErrorLog(SchVo schVo) throws Exception {
      
      return mainService.selectScheErrorLog(schVo);
   }
   
   @RequestMapping("/selectScheRowCount")
   public int selectScheRowCount() throws Exception{
      return mainService.selectScheRowCount();
   }
   
// 스케줄 등록 (데이터 반출 요청)
   @RequestMapping("/daumDataExportinsertSche")
   public void daumDataExportinsertSche(SchVo schVo, DataRequest dataRequest, DataExportVo dataExportVo) throws Exception {
      // 클래스 경로 추출
      File file = new File("scheduler");
      schVo.setDaumSchedulerPath(file.getAbsolutePath());

      mainService.insertSche(schVo);
      dataExportVo.setScheCode(schVo.getScheCode());
      int dataExportManagementCode = mainService.selectDataExportManagement(dataRequest);
      dataRequest.setDataExportManagementCode(dataExportManagementCode);
      dataExportVo.setDataExportManagementCode(dataRequest.getDataExportManagementCode());
      mainService.insertDataExport(dataExportVo);
      System.out.println("도는 지 확인" + dataRequest.getDataExportRequestCode());
      // 데이터 반출 요청 상태값 변경 - 스케줄 등록
      mainService.updataRssExportStatus(dataRequest.getDataExportRequestCode());

      // 다음 뉴스 정형적 모듈 등록
      mainService.insertDevSourceFormalModuleDaumExport(schVo);

      schedulerService.scheduleTaskUpdate();
   }

}