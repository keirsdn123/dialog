package net.su.dialog.schedule.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.main.mapper.MainMapper;
import net.su.dialog.schedule.domain.DataCollectionVo;
import net.su.dialog.schedule.domain.DataDevelopSourceVo;
import net.su.dialog.schedule.domain.DataExportVo;
import net.su.dialog.schedule.domain.SchVo;
import net.su.dialog.schedule.domain.ScheduleLog;
import net.su.dialog.schedule.mapper.ScheduleMapper;
import net.su.dialog.schedule.service.ScheService;

@Service
public class ScheServiceImpl implements ScheService {

   @Resource(name = "net.su.dialog.schedule.mapper.ScheduleMapper")
   private ScheduleMapper scheduleMapper;

   // 스케줄 목록 조회
   public List<SchVo> selectSche(SchVo schVo) throws Exception {
      System.out.println("serviceImpl");
      return scheduleMapper.selectSche(schVo);
   }

   // 스케줄 등록
   public void insertSche(SchVo schVo) throws Exception {
      scheduleMapper.insertSche(schVo);
   }

   // 개발소스파일 정형적 모듈 등록 (다음 뉴스)
   public void insertDevSourceFormalModule(SchVo schVo) throws Exception {
      scheduleMapper.insertDevSourceFormalModule(schVo);
   }

   // 개발소스파일 정형적 모듈 등록 (rss 뉴스 반출 )
   public void insertDevSourceFormalModuleExport(SchVo schVo) throws Exception {
      scheduleMapper.insertDevSourceFormalModuleExport(schVo);
   }

   // 스케줄 삭제
   public void deleteSche(SchVo schVo) throws Exception {
      scheduleMapper.deleteSche(schVo);
   }

   // 스케줄 상세조회
   public SchVo scheduleinfo(SchVo schVo) throws Exception {
      return scheduleMapper.scheduleinfo(schVo);
   }

   // 스케줄 수정
   public void updateSche(SchVo schVo) throws Exception {
      scheduleMapper.updateSche(schVo);
   }

   public void testJobMethod() throws Exception {
//      scheduleMapper.selectSche();
   }

   // 스케줄 등록 (다음 수집 요청)
   public void insertDataCollection(DataCollectionVo dataCollectionVo) throws Exception {
      scheduleMapper.insertDataCollection(dataCollectionVo);
   }

   // 데이터 반출 관리 코드 조회
   public int selectDataExportManagement(DataRequest dataRequest) throws Exception {
      return scheduleMapper.selectDataExportManagement(dataRequest);
   }

   // 스케줄 데이터 반출 등록
   public void insertDataExport(DataExportVo dataExportVo) throws Exception {
      scheduleMapper.insertDataExport(dataExportVo);
   }

   // 데이터 반출 요청 상태값 변경 - 스케줄 등록
   public void updataRssExportStatus(int dataExportRequestCode) throws Exception {
      scheduleMapper.updataRssExportStatus(dataExportRequestCode);
   }

   // 데이터 수집 요청 상태값 변경 - 스케줄 등록
   public void updataDaumNewsExportStatus(int daumNewsDataCollectRequestCode) throws Exception {
      scheduleMapper.updataDaumNewsExportStatus(daumNewsDataCollectRequestCode);
   }

   // 스케줄 등록 (중복검사)
   public SchVo selectOverlap(SchVo schVo) throws Exception {
      return scheduleMapper.selectOverlap(schVo);
   }

   // 개발소스파일 상세조회
   public DevelopSource developSourceInfo(DevelopSource developSource) throws Exception {

      return scheduleMapper.developSourceInfo(developSource);
   }

   // 스케줄 크롤링 등록
   public void insertScheCrawling(SchVo schVo) throws Exception {
      scheduleMapper.insertScheCrawling(schVo);
   }

   // 개발소스파일 스케줄 수정
   public void updateDevelopmentSche(DataDevelopSourceVo dataDevelopSourceVo) throws Exception {
      scheduleMapper.updateDevelopmentSche(dataDevelopSourceVo);
   }

   // 스케줄 중지
   public void stopSche(SchVo schVo) throws Exception {
      scheduleMapper.stopSche(schVo);
   }

   // 개발소스파일 모듈 조회
   public ScheduleLog selectDevSourceInfo(SchVo schVo) throws Exception {
      return scheduleMapper.selectDevSourceInfo(schVo);

   }

   // 스케줄 재시작
   public void restartSche(SchVo schVo) throws Exception {
      scheduleMapper.restartSche(schVo);
   }

   // 스케줄 로그조회
   public List<ScheduleLog> selectScheduleLog() throws Exception {
      return scheduleMapper.selectScheduleLog();
   }

   // 스케줄 로그조회
   public ScheduleLog selectScheErrorLog(SchVo schVo) throws Exception {
      return scheduleMapper.selectScheErrorLog(schVo);
   }
   
   public int selectScheRowCount() throws Exception{
      return scheduleMapper.selectScheRowCount();
   }
   
   public void insertDevSourceFormalModuleDaumExport(SchVo schVo) throws Exception {
      scheduleMapper.insertDevSourceFormalModuleDaumExport(schVo);
   }

   public void devFileCusScheUpdate(DataDevelopSourceVo dataDevelopSourceVo) throws Exception{
      scheduleMapper.devFileCusScheUpdate(dataDevelopSourceVo);
   }
}