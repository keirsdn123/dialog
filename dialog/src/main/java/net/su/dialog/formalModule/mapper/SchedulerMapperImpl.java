package net.su.dialog.formalModule.mapper;

import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import net.su.dialog.schedule.domain.NextSchedulStatus;
import net.su.dialog.schedule.domain.ScheduleLog;

public class SchedulerMapperImpl implements SchedulerMapper {
	
	private JdbcTemplate jdbcTemplate;
	
	public SchedulerMapperImpl () {
		BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("1234");
        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//스케줄 로그 등록
	public void insertSchedulerLog(ScheduleLog scheduleLog) throws Exception {
		jdbcTemplate.update(""
				+ " INSERT INTO schedule_log (log_title"
				+ "							  , log_contents"
				+ "							  ,	log_meta_contents"						
				+ "							  , log_date"
				+ "							  , log_status"
				+ "							  , sche_code"
				+ "							  , parents_code)"
				+ " VALUES					  (\"" + scheduleLog.getLogTitle() + "\"" 
				+ "							  ,\"" + scheduleLog.getLogContents() + "\""
			    + "	 					      ,\"" + scheduleLog.getLogMeteContents() + "\""
				+ "							  , NOW()"
				+ "							  , " + scheduleLog.getLogStatus()
				+ "							  , " + scheduleLog.getScheduleSeq() + ""
				+ "							  , " + scheduleLog.getParentsSeq() + ")");
	}
	
	//현재날짜의 로그 등록시 등록되야될 로그 상태(시작:0 or 재시작:1)
	public NextSchedulStatus nextSchedulStatus(ScheduleLog scheduleLog) throws Exception {
		System.out.println("스케줄 로그 패키지명" + scheduleLog.getPackageName());
		System.out.println("스케줄 로그 클래스명명" + scheduleLog.getClassName());
		System.out.println("스케줄 로그 메서드명명" + scheduleLog.getMethodName());
		Map<String, Object> result = jdbcTemplate.queryForMap(""
				+ ""
				+ " SELECT 	ifnull(if(log_status = 0, log_seq, null) ,0) as parentsSeq,"
				+ " 		if(COUNT(if(log_status = 0, 1, NULL)) = 0, 0, 1) as nextLogStatus,"
				+ " 		COUNT(if(log_status = 1, 1, NULL)) as reStartCount,"
				+ " 		(SELECT min(sche_code)" 
				+ "  		 FROM 	dev_source_file_formal_module" 
				+ "  		 WHERE 	dev_source_file_package_name = '" + scheduleLog.getPackageName() + "'"
				+ "  		 AND 	dev_source_file_class_name = '" + scheduleLog.getClassName() + "'"
				+ "  		 AND 	dev_source_file_method_name = '" + scheduleLog.getMethodName() + "') as sche_code"
				+ " FROM 	schedule_log sl"
				+ " JOIN	dev_source_file_formal_module sm"
				+ " ON		sl.sche_code = sm.dev_source_code"
				+ " AND 	dev_source_file_package_name = '" + scheduleLog.getPackageName() + "'"
				+ " AND 	dev_source_file_class_name = '" + scheduleLog.getClassName() + "'"
				+ " AND 	dev_source_file_method_name = '" + scheduleLog.getMethodName() + "'"
				+ " WHERE 	DATE_FORMAT(log_date, '%Y-%c-%e') = CURDATE()");
			
		NextSchedulStatus info = new NextSchedulStatus(); 
			
		System.out.println("부모 seq:" + result.get("parentsSeq"));
		System.out.println("부모 seq:" + result.get("parentsSeq"));	
		info.setParentsSeq((long) result.get("parentsSeq"));
		info.setNextLogStatus((int) (long)result.get("nextLogStatus"));
		info.setReStartCount((int) (long) result.get("reStartCount"));
		info.setScheduleSeq((int) result.get("sche_code"));
		
		return info;
			
	}
	
	//스케줄 상태변경 - 오류 -
	public void updateScheStatus(ScheduleLog scheduleLog) throws Exception{
		jdbcTemplate.update("update schedules s, dev_source_file_formal_module d "
				+ "set s.sche_status_code  = "+3+" "
				+ "where s.sche_code = d.sche_code "
				+ "AND 	dev_source_file_package_name = '" + scheduleLog.getPackageName() + "'"
			    + "AND 	dev_source_file_class_name = '" + scheduleLog.getClassName() + "'"
				+ "AND 	dev_source_file_method_name = '" + scheduleLog.getMethodName() + "'");
	}
	
	//RSS 스케줄 상태 변경 - 작동완료 -
	public void rssSchedulerStatus(ScheduleLog scheduleLog) throws Exception{
		jdbcTemplate.update("update schedules s, dev_source_file_formal_module d "
				+ "set s.sche_status_code  = "+2+" "
				+ "where s.sche_code = d.sche_code "
				+ "AND 	dev_source_file_package_name = '" + scheduleLog.getPackageName() + "'"
			    + "AND 	dev_source_file_class_name = '" + scheduleLog.getClassName() + "'"
				+ "AND 	dev_source_file_method_name = '" + scheduleLog.getMethodName() + "'");
	}
	// 데이터 반출 파일 등록
	public void insertDataExportFile(String filePath, String fileName, int scheCode) throws Exception {
		jdbcTemplate.update(""
				+ " INSERT INTO data_export_file (sche_code"
				+ "							  , export_file_title"
				+ "							  , export_file_route"
				+ "							  , export_extension)"
				+ " VALUES					  (" + scheCode + "" 
				+ "							  , '" + fileName + "'"
				+ "							  , '" + filePath + "'"
				+ "					  		  , '.xlsx')");
	}	
	// 데이터 반출 요청 상태값 변경 및 스케줄 상태값 변경
	public void updateExportRequestStatus(int dataExportRequestCode, int scheCode) throws Exception {
		jdbcTemplate.update("update data_export_request set export_collect_status = '"+ "Y" +"' where data_export_request_code = " + dataExportRequestCode);
		jdbcTemplate.update("update schedules set sche_status_code = '"+ 2 +"' where sche_code = " + scheCode);
	}
	
	
}
