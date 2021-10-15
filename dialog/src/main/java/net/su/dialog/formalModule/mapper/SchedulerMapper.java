package net.su.dialog.formalModule.mapper;

import org.springframework.stereotype.Repository;

import net.su.dialog.schedule.domain.NextSchedulStatus;
import net.su.dialog.schedule.domain.ScheduleLog;

@Repository("net.su.dialog.formalModule.mapper.SchedulerMapper")
public interface SchedulerMapper {
	//스케줄 로그 등록
	public void insertSchedulerLog(ScheduleLog scheduleLog) throws Exception;

	//현재날짜의 로그 등록시 등록되야될 로그 상태(시작:0 or 재시작:1)
	public NextSchedulStatus nextSchedulStatus(ScheduleLog scheduleLog) throws Exception;
	
	//스케줄 상태변경 - 오류 -
	public void updateScheStatus(ScheduleLog scheduleLog) throws Exception;
	
	//RSS 스케줄 상태 변경 - 작동완료 -
	public void rssSchedulerStatus(ScheduleLog scheduleLog) throws Exception;
	
	// 데이터 반출 파일 등록
	public void insertDataExportFile(String filePath, String fileName, int scheCode) throws Exception;
	
	// 데이터 반출 요청 상태값 변경 및 스케줄 상태값 변경
	public void updateExportRequestStatus(int dataExportRequestCode, int scheCode) throws Exception;
}
