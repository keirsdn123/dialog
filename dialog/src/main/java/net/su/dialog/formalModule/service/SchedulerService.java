package net.su.dialog.formalModule.service;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Service;

import net.su.dialog.SchedulingConfig;
import net.su.dialog.formalModule.mapper.RssNewsExportMapperImpl;
import net.su.dialog.formalModule.mapper.SchedulerMapper;
import net.su.dialog.formalModule.mapper.SchedulerMapperImpl;
import net.su.dialog.schedule.domain.NextSchedulStatus;
import net.su.dialog.schedule.domain.ScheduleLog;

@Service
public class SchedulerService {
	@Resource(name = "net.su.dialog.formalModule.mapper.SchedulerMapper")
	private SchedulerMapper schedulerMapper;

	@Autowired
	private SchedulingConfig schedulingConfig;

	static private long scheduleUpdatedSeq = 0;
	static private boolean statusUpdateFlag = false;

	// 스케줄 시작, 재시작, 수정완료 log 저장
	public void startInsertLog(ScheduleLog scheduleLog) throws Exception {
		schedulerMapper = new SchedulerMapperImpl();

		// log 최신 정보 받아오기
		System.out.println("로그상태조회");
		NextSchedulStatus statusInfo = schedulerMapper.nextSchedulStatus(scheduleLog);

		int nextLogStatus = statusInfo.getNextLogStatus();
		long scheduleSeq = statusInfo.getScheduleSeq();
		long parentsSeq = statusInfo.getParentsSeq();

		if (nextLogStatus == 0) {
			scheduleLog.setLogTitle("작동시작");
			scheduleLog.setLogContents("정상작동");
			scheduleLog.setLogStatus(nextLogStatus);
			scheduleLog.setParentsSeq(0);
			scheduleLog.setScheduleSeq(scheduleSeq);
		} else if (nextLogStatus == 1) {
			if (scheduleSeq == this.scheduleUpdatedSeq) {
				if (this.statusUpdateFlag) {
					scheduleLog.setLogTitle("재시작");
					scheduleLog.setLogContents("재시작 횟수 : " + (statusInfo.getReStartCount() + 1) + " 회");
					scheduleLog.setLogStatus(nextLogStatus);
					scheduleLog.setParentsSeq(parentsSeq);
					scheduleLog.setScheduleSeq(scheduleSeq);
				} else {
					scheduleLog.setLogTitle("스케줄 정보 수정");
					scheduleLog.setLogContents("스케줄 정보 수정완료");
					scheduleLog.setLogStatus(5);
					scheduleLog.setParentsSeq(parentsSeq);
					scheduleLog.setScheduleSeq(scheduleSeq);
				}
				this.statusUpdateFlag = false;
				this.scheduleUpdatedSeq = 0;
			}
		}

		if (scheduleLog.getLogTitle() != null && scheduleLog.getLogTitle() != "") {
			System.out.println("작동 상태 : " + scheduleLog.getLogTitle());
			schedulerMapper.insertSchedulerLog(scheduleLog);
		}
	}

	// 스케줄 완료 log 저장
	public void completeInsertLog(ScheduleLog scheduleLog) throws Exception {
		schedulerMapper = new SchedulerMapperImpl();

		// log 최신 정보 받아오기
		NextSchedulStatus statusInfo = schedulerMapper.nextSchedulStatus(scheduleLog);

		scheduleLog.setLogTitle("작동완료");
		scheduleLog.setLogContents("작동완료");
		scheduleLog.setLogStatus(2);
		scheduleLog.setParentsSeq(statusInfo.getParentsSeq());
		scheduleLog.setScheduleSeq(statusInfo.getScheduleSeq());

		System.out.println("작동 상태 : 작동완료");
		schedulerMapper.insertSchedulerLog(scheduleLog);
	}

	// 스케줄 에러 log 저장
	public void errorInsertLog(ScheduleLog scheduleLog, Exception e, String exceptedClassName) throws Exception {
		schedulerMapper = new SchedulerMapperImpl();
		
		schedulerMapper.updateScheStatus(scheduleLog);
		
		// log 최신 정보 받아오기
		NextSchedulStatus statusInfo = schedulerMapper.nextSchedulStatus(scheduleLog);

		scheduleLog.setLogTitle("작동중지");
		scheduleLog.setLogContents("작동오류");
		scheduleLog.setLogMeteContents("오류 발생 Class -> " + exceptedClassName + " : " + getErrorFullText(e));
		scheduleLog.setLogStatus(3);
		scheduleLog.setParentsSeq(statusInfo.getParentsSeq());
		scheduleLog.setScheduleSeq(statusInfo.getScheduleSeq());
		
		
		System.out.println("작동 상태 : 작동오류");
		schedulerMapper.insertSchedulerLog(scheduleLog);
		
		
	}

	// 스케줄 Task 업데이트
	public void scheduleTaskUpdate() throws Exception {
		System.out.println("오긴오나");
		// getter를 통한 taskRegistrar 객체 가지고오기
		System.out.println("업데이트" + schedulingConfig.getTaskRegistrar());
		ScheduledTaskRegistrar taskRegistrar = schedulingConfig.getTaskRegistrar();
		// 스케줄이 잡혀져있는 전체 Task 종료시킴.
		// 특정 스케줄만 중단하는건 할 수 있지만 전체 스케줄러에 문제를 주는 이슈가 있어 알아봐야할 것들이 많음. -> 아직 미흡함.
		taskRegistrar.destroy();
		// Task들을 재 할당함.
		schedulingConfig.configureTasks(taskRegistrar);
		// Task들을 스케줄을 하기위해 처리해주는 메서드 호출
		taskRegistrar.afterPropertiesSet();
	}

	// 스케줄 일시중지 log 저장
	public void stopInsertLog(ScheduleLog scheduleLog) throws Exception {
		schedulerMapper = new SchedulerMapperImpl();

		// log 최신 정보 받아오기
		NextSchedulStatus statusInfo = schedulerMapper.nextSchedulStatus(scheduleLog);

		scheduleLog.setLogTitle("작동중지");
		scheduleLog.setLogContents("작동중지");
		scheduleLog.setLogStatus(4);
		scheduleLog.setParentsSeq(statusInfo.getParentsSeq());
		scheduleLog.setScheduleSeq(statusInfo.getScheduleSeq());

		System.out.println("작동 상태 : 작동중지");
		schedulerMapper.insertSchedulerLog(scheduleLog);
	}

	// 에러 코드 변환
	public String getErrorFullText(Exception e) throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		PrintStream pinrtStream = new PrintStream(out);
		e.printStackTrace(pinrtStream);
		System.out.println(out.toString());
		return out.toString();
	}
	
	//RSS 스케줄 상태 변경 - 작동완료 -
	public void rssSchedulerStatus(ScheduleLog scheduleLog) throws Exception {
		schedulerMapper.rssSchedulerStatus(scheduleLog);
		
	}
	// 데이터 반출 파일 등록 
	public void insertDataExportFile(String filePath, String fileName, int scheCode) throws Exception {
		schedulerMapper = new SchedulerMapperImpl();
		schedulerMapper.insertDataExportFile(filePath, fileName, scheCode);
	}
	
	// 데이터 반출 요청 상태값 변경 및 스케줄 상태값 변경 
	public void updateExportRequestStatus(int dataExportRequestCode, int scheCode) throws Exception {
		schedulerMapper = new SchedulerMapperImpl();
		schedulerMapper.updateExportRequestStatus(dataExportRequestCode, scheCode);
	}
	

}
