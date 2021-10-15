package net.su.dialog.schedule.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.schedule.domain.DataCollectionVo;
import net.su.dialog.schedule.domain.DataDevelopSourceVo;
import net.su.dialog.schedule.domain.DataExportVo;
import net.su.dialog.schedule.domain.SchVo;
import net.su.dialog.schedule.domain.ScheduleLog;

@Repository("net.su.dialog.schedule.mapper.ScheduleMapper")
public interface ScheduleMapper {
   //스케줄 등록
   public void insertSche(SchVo schVo) throws Exception;
   //개발소스파일 정형적 모듈 등록 (다음 뉴스)
   public void insertDevSourceFormalModule(SchVo schVo) throws Exception;
   //개발소스파일 정형적 모듈 등록 (rss 뉴스 반출 ) 
   public void insertDevSourceFormalModuleExport(SchVo schVo) throws Exception;
   //스케줄 조회
   public List<SchVo> selectSche(SchVo schVo) throws Exception;
   //스케줄 삭제 
   public void deleteSche(SchVo schVo) throws Exception;
   //스케줄 상세조회 
   public SchVo scheduleinfo(SchVo schVo) throws Exception;
   //스케줄 수정 
   public void updateSche(SchVo schVo) throws Exception;
   //스케줄 등록 (다음 수집 요청)
   public void insertDataCollection(DataCollectionVo dataCollectionVo) throws Exception;
   //데이터 반출 관리 코드 조회
   public int selectDataExportManagement(DataRequest dataRequest) throws Exception;
   //스케줄 데이터 반출 등록 
   public void insertDataExport(DataExportVo dataExportVo) throws Exception;
   //데이터 반출 요청 상태값 변경 - 스케줄 등록 
   public void updataRssExportStatus(int dataExportRequestCode) throws Exception;
   //데이터 수집 요청 상태값 변경 - 스케줄 등록 
   public void updataDaumNewsExportStatus(int daumNewsDataCollectRequestCode) throws Exception;
   //스케줄 등록 (중복검사)
   public SchVo selectOverlap(SchVo schVo) throws Exception;
   //개발소스파일 상세조회
   public DevelopSource developSourceInfo(DevelopSource developSource) throws Exception;
   //스케줄 크롤링 등록
   public void insertScheCrawling(SchVo schVo) throws Exception;
   //개발소스파일 스케줄 수정
   public void updateDevelopmentSche(DataDevelopSourceVo dataDevelopSourceVo) throws Exception;
   //스케줄 중지
   public void stopSche(SchVo schVo) throws Exception;
   //스케줄 재시작
   public void restartSche(SchVo schVo) throws Exception;
   //스케줄 목록
   public List<DevelopSource> schedulerList();
   //스케줄 로그 조회
   public List<ScheduleLog> selectScheduleLog() throws Exception;
   //개발소스파일 모듈 조회
   public ScheduleLog selectDevSourceInfo(SchVo schVo) throws Exception;
   
   public ScheduleLog selectScheErrorLog(SchVo schVo) throws Exception;
   
   public int selectScheRowCount() throws Exception;
   
   public void insertDevSourceFormalModuleDaumExport(SchVo schVo) throws Exception;
   
   public void devFileCusScheUpdate(DataDevelopSourceVo dataDevelopSourceVo) throws Exception;
   
   
}