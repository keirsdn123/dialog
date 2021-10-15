package net.su.dialog.formalModule.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.schedule.domain.SchVo;

public class DaumNewsModuleMapperImpl implements DaumNewsModuleMapper{

	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertActor;
	
	public DaumNewsModuleMapperImpl () {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("1234");
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.insertActor = new SimpleJdbcInsert(dataSource);
	}
	
	public List<DaumNewsModule> selectDaumNewsList() throws Exception{
		System.out.println("다음뉴스모듈 메퍼임플");
		//다음 뉴스 수집 요청 목록조회
		List<DaumNewsModule> info = jdbcTemplate.query(""
				+ ""
				+ " SELECT 	schedule_code,"
				+ " 		data_code,"
				+ " 		sche_work_title,"
				+ " 		news_collect_keyword,"
				+ "			news_collect_start_date,"					
				+ "			news_collect_end_date,"
				+ "			daum_news_collect_request_code"
				+ " FROM 	news_crawling n, schedules s"
				+ " WHERE	n.schedule_code = s.sche_code"
				+ "	AND		s.sche_type = '" + "다음뉴스" + "'"		
				+ "	AND		s.sche_status_code in(0,5)",
				new RowMapper<DaumNewsModule>(){
					public DaumNewsModule mapRow(ResultSet rs, int rowNum) throws SQLException {
						DaumNewsModule info = new DaumNewsModule();
						info.setScheduleCode(rs.getInt("schedule_code"));
						info.setDataCode(rs.getInt("data_code"));
						info.setScheWorkTitle(rs.getString("sche_work_title"));
						info.setNewsCollectKeyword(rs.getString("news_collect_keyword"));
						info.setNewsCollectStartDate(rs.getString("news_collect_start_date"));
						info.setNewsCollectEndDate(rs.getString("news_collect_end_date"));
						info.setDaumNewsCollectRequestCode(rs.getInt("daum_news_collect_request_code"));
						return info;
					}
				});
		return info;
	}
	public void insertDaumNews(String tableCreate, List<DaumNewsModule> daumNewsList) throws Exception{
		insertActor.withTableName(tableCreate);
		for(int i=0; i<daumNewsList.size(); i++) {
			 Map<String, Object> parameters = new HashMap<String, Object>();
		    parameters.put("daum_news_collect_module_title",  daumNewsList.get(i).getDaumNewsCollectModuleTitle());
		    parameters.put("daum_news_collect_module_content",  daumNewsList.get(i).getDaumNewsCollectModuleContent());
		    parameters.put("daum_news_collect_module_writer", daumNewsList.get(i).getDaumNewsCollectModuleWriter());
		    parameters.put("daum_news_collect_module_news_paper",  daumNewsList.get(i).getDaumNewsCollectModuleNewsPaper());
		    parameters.put("daum_news_collect_module_date",  daumNewsList.get(i).getDaumNewsCollectModuleDate());
		    parameters.put("daum_news_collect_module_news_modify_date", daumNewsList.get(i).getDaumNewsCollectModuleModifyDate());
		    parameters.put("daum_news_collect_module_link", daumNewsList.get(i).getDaumNewsCollectModuleLink());
		    parameters.put("sche_code", daumNewsList.get(i).getScheduleCode());
		    insertActor.execute(parameters);
		}
	}
	
	public void deleteDaumNews(String deleteTableName) throws Exception{
		jdbcTemplate.execute("drop table "+deleteTableName);
		
	}
	public void createDaumNewsTable(String tableCreate) throws Exception{
		jdbcTemplate.execute("create table "+tableCreate+" "
				+ "(daum_news_collect_module_seq int(11) primary key AUTO_INCREMENT, "
				+ " daum_news_collect_module_title varchar(3000), "
				+ " daum_news_collect_module_content varchar(10000), "
				+ " daum_news_collect_module_writer varchar(255), "
				+ " daum_news_collect_module_news_paper varchar(255),"
				+ " daum_news_collect_module_date varchar(255), "
				+ " daum_news_collect_module_news_modify_date varchar(255),"
				+ " daum_news_collect_module_link varchar(500),"
				+ " data_code int(11), sche_code int(11))");
	}
	public void updateStatus(int scheduleCode, int daumNewsCollectRequestCode) throws Exception{
		jdbcTemplate.update("update schedules set sche_status_code = "+2+" where sche_code = "+ scheduleCode);
		jdbcTemplate.update("update daum_news_data_collect_request set daum_news_request_collect_status = '"+ "Y" +"' where daum_news_data_collect_request_code = "+ daumNewsCollectRequestCode);
	}
	//다음뉴스모듈 스케줄리스트 조회 
	public List<DevelopSource> selectDaumNewsSchedule(){
		return null;
	}

}
