package net.su.dialog.formalModule.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.formalModule.mapper.DaumNewsModuleMapper;
import net.su.dialog.formalModule.mapper.DaumNewsModuleMapperImpl;
@Service
public class FormalModuleService {
	
	@Resource(name="net.su.dialog.formalModule.mapper.DaumNewsModuleMapper")
    private DaumNewsModuleMapper daumNewsModuleMapper;
	
	public void errorInsertLog() throws Exception {
//		//log 최신 정보 받아오기
//		NextSchedulStatus statusInfo = formalModuleMapper.nextSchedulStatus(scheduleLog);
//		
//		scheduleLog.setLogTitle("작동오류");
//		scheduleLog.setLogContents("오류 발생 Class -> " + exceptedClassName + " : " + getErrorFullText(e));
//		scheduleLog.setLogStatus(3);
//		scheduleLog.setParentsSeq(statusInfo.getParentsSeq());
//		scheduleLog.setScheduleSeq(statusInfo.getScheduleSeq());
//		
//		System.out.println("작동 상태 : 작동오류");
//		mainMapper.insertSchedulerLog(scheduleLog);
	}
	
}
