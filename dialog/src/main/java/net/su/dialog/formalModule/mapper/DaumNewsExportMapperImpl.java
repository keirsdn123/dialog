package net.su.dialog.formalModule.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import net.su.dialog.formalModule.domain.DaumNewsData;
import net.su.dialog.formalModule.domain.DaumNewsModule;

public class DaumNewsExportMapperImpl implements DaumNewsExportMapper {

	public DaumNewsExportMapperImpl() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	private JdbcTemplate jdbcTemplate;
	
	public List<DaumNewsModule> selectDaumNewsExportList() throws Exception{
		List<DaumNewsModule> info = jdbcTemplate.query(""
				+ ""
				+ " SELECT 	member_code,"
				+ " 		d.data_export_request_code,"
				+ " 		d.data_code,"
				+ " 		export_collect_word,"
				+ "			export_collect_start_date,"					
				+ "			export_collect_end_date,"
				+ "			export_collect_status,"
				+ "			export_collect_date,"
				+ " 		regular_data_table_title,"
				+ "			m.data_export_management_code,"
				+ "			sche_code"				
				+ " FROM 	data_export_request d, regular_dataset r, data_export_management m,schedule_data_export s"
				+ "	WHERE   d.data_code = r.data_code"
				+ " AND 	d.data_export_request_code = m.data_export_request_code"
				+ " AND     m.data_export_management_code = s.data_export_management_code"
				+ " AND 	export_collect_status IN ('S')"
				+ " AND		d.export_collect_type ='다음뉴스'",
				new RowMapper<DaumNewsModule>(){
					public DaumNewsModule mapRow(ResultSet rs, int rowNum) throws SQLException {
						DaumNewsModule info = new DaumNewsModule();
						info.setMemberCode(rs.getInt("member_code"));
						info.setDataExportRequestCode(rs.getInt("data_export_request_code"));
						info.setDataCode(rs.getInt("data_code"));
						info.setNewsCollectKeyword(rs.getString("export_collect_word"));
						info.setNewsCollectStartDate(rs.getString("export_collect_start_date"));
						info.setNewsCollectEndDate(rs.getString("export_collect_end_date"));
						info.setExportCollectStatus(rs.getString("export_collect_status"));
						info.setExportCollectDate(rs.getString("export_collect_date"));
						info.setRegularDataTableTitle(rs.getString("regular_data_table_title"));
						info.setScheduleCode(rs.getInt("sche_code"));
						info.setDataExportManagementCode(rs.getInt("data_export_management_code"));
						return info;
					}
				});
		return info;
	}
	
	public List<DaumNewsData> daumNewsData(String tableName)throws Exception{
		List<DaumNewsData> info = jdbcTemplate.query(""
				+ ""
				+ " SELECT 	daum_news_collect_module_seq,"
				+ " 		daum_news_collect_module_title,"
				+ " 		daum_news_collect_module_content,"
				+ " 		daum_news_collect_module_date," 
				+ "  		daum_news_collect_module_news_modify_date," 
				+ "  		daum_news_collect_module_writer," 
				+ "  		daum_news_collect_module_link," 
				+ "  		daum_news_collect_module_news_paper" 
//				+ "  		data_code" 
				+ " FROM 	"+tableName,
				new RowMapper<DaumNewsData>(){
					public DaumNewsData mapRow(ResultSet rs, int rowNum) throws SQLException {
						DaumNewsData info = new DaumNewsData();
						info.setDaumNewsCollectModuleSeq(rs.getInt("daum_news_collect_module_seq"));
						info.setDaumNewsCollectModuleTitle(rs.getString("daum_news_collect_module_title"));
						info.setDaumNewsCollectModuleContent(rs.getString("daum_news_collect_module_content"));
						info.setDaumNewsCollectModuleDate(rs.getString("daum_news_collect_module_date"));
						info.setDaumNewsCollectModuleModifyDate(rs.getString("daum_news_collect_module_news_modify_date"));
						info.setDaumNewsCollectModuleWriter(rs.getString("daum_news_collect_module_writer"));
						info.setDaumNewsCollectModuleLink(rs.getString("daum_news_collect_module_link"));
						info.setDaumNewsCollectModuleNewsPaper(rs.getString("daum_news_collect_module_news_paper"));
//						info.setDataCode(rs.getInt("data_code"));
						return info;
					}
				});
		return info;
	}
	
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
	
	public void updateExportRequestStatus(int dataExportRequestCode, int scheCode) throws Exception {
		jdbcTemplate.update("update data_export_request set export_collect_status = '"+ "Y" +"' where data_export_request_code = " + dataExportRequestCode);
		jdbcTemplate.update("update schedules set sche_status_code = '"+ 2 +"' where sche_code = " + scheCode);
	}
}
