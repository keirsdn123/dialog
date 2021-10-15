package net.su.dialog.schedule.service;

import java.util.List;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.schedule.domain.DataCollectionVo;
import net.su.dialog.schedule.domain.DataDevelopSourceVo;
import net.su.dialog.schedule.domain.DataExportVo;
import net.su.dialog.schedule.domain.SchVo;
import net.su.dialog.schedule.domain.ScheduleLog;


public interface ScheService {

   public List<SchVo> selectSche(SchVo schVo) throws Exception;
   
   public void insertSche(SchVo schVo) throws Exception;
   
   public void insertDevSourceFormalModule(SchVo schVo) throws Exception;
   
   public void insertDevSourceFormalModuleExport(SchVo schVo) throws Exception;
   
   public void deleteSche(SchVo schVo) throws Exception;
   
   public SchVo scheduleinfo(SchVo schVo) throws Exception;
   
   public void updateSche(SchVo schVo) throws Exception;

   public void testJobMethod() throws Exception;
   
   public void insertDataCollection(DataCollectionVo dataCollectionVo) throws Exception;
   
   public int selectDataExportManagement(DataRequest dataRequest) throws Exception;
   
   public void insertDataExport(DataExportVo dataExportVo) throws Exception;
   
   public void updataRssExportStatus(int dataExportRequestCode) throws Exception;
   
   public void updataDaumNewsExportStatus(int daumNewsDataCollectRequestCode) throws Exception;
   
   public SchVo selectOverlap(SchVo schVo) throws Exception;
   
   public DevelopSource developSourceInfo(DevelopSource developSource) throws Exception;
   
   public void insertScheCrawling(SchVo schVo) throws Exception;
   
   public void updateDevelopmentSche(DataDevelopSourceVo dataDevelopSourceVo) throws Exception;
   
   public void stopSche(SchVo schVo) throws Exception;
   
   public ScheduleLog selectDevSourceInfo(SchVo schVo) throws Exception;
   
   public void restartSche(SchVo schVo) throws Exception;
   
   public List<ScheduleLog> selectScheduleLog() throws Exception;
   
   public ScheduleLog selectScheErrorLog(SchVo schVo) throws Exception;
   
   public int selectScheRowCount() throws Exception;
   
   public void insertDevSourceFormalModuleDaumExport(SchVo schVo) throws Exception;
   
   public void devFileCusScheUpdate(DataDevelopSourceVo dataDevelopSourceVo) throws Exception;
   
}