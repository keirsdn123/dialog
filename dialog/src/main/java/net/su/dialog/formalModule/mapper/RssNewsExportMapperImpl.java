package net.su.dialog.formalModule.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.domain.NewsExportModule;
import net.su.dialog.formalModule.domain.RssNewsModule;

public class RssNewsExportMapperImpl implements RssNewsExportMapper{
	private JdbcTemplate jdbcTemplate;
	
	public RssNewsExportMapperImpl() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<NewsExportModule> selectRssNewsExportList() throws Exception{
		List<NewsExportModule> info = jdbcTemplate.query(""
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
				+ " AND     export_collect_type = 'RSS뉴스'",
				new RowMapper<NewsExportModule>(){
					public NewsExportModule mapRow(ResultSet rs, int rowNum) throws SQLException {
						NewsExportModule info = new NewsExportModule();
						info.setMemberCode(rs.getInt("member_code"));
						info.setDateExportRequestCode(rs.getInt("data_export_request_code"));
						info.setDataCode(rs.getInt("data_code"));
						info.setExportCollectWord(rs.getString("export_collect_word"));
						info.setExportCollectStartDate(rs.getString("export_collect_start_date"));
						info.setExportCollectEndDate(rs.getString("export_collect_end_date"));
						info.setExportCollectStatus(rs.getString("export_collect_status"));
						info.setExportCollectDate(rs.getString("export_collect_date"));
						info.setRegularDataTableTitle(rs.getString("regular_data_table_title"));
						info.setScheCode(rs.getInt("sche_code"));
						info.setDataExportManagementCode(rs.getInt("data_export_management_code"));
						return info;
					}
				});
		return info;
	}
	
	public List<RssNewsModule> rssNewsData(String tableNmae, String word, String startDate, String endDate) throws Exception{
		List<RssNewsModule> info = jdbcTemplate.query(""
				+ ""
				+ " SELECT 	rss_seq,"
				+ " 		rss_title,"
				+ " 		rss_contents,"
				+ " 		rss_registration_date," 
				+ "  		rss_modification_date," 
				+ "  		rss_author," 
				+ "  		rss_link," 
				+ "  		rss_category" 
//				+ "  		data_code" 
				+ " FROM 	"+tableNmae+""
				+ " WHERE	rss_registration_date BETWEEN'"+ startDate  +"%' AND '" + endDate +"%'"
				+ " AND     (rss_title LIKE'%" +word +"%'"
				+ " OR      rss_contents LIKE'%" +word +"%')",
				new RowMapper<RssNewsModule>(){
					public RssNewsModule mapRow(ResultSet rs, int rowNum) throws SQLException {
						RssNewsModule info = new RssNewsModule();
						info.setRssNewsSeq(rs.getInt("rss_seq"));
						info.setRssNewsTitle(rs.getString("rss_title"));
						info.setRssNewsContents(rs.getString("rss_contents"));
						info.setRssNewsRegistrationDate(rs.getString("rss_registration_date"));
						info.setRssNewsModificationDate(rs.getString("rss_modification_date"));
						info.setRssNewsAuthor(rs.getString("rss_author"));
						info.setRssNewsLink(rs.getString("rss_link"));
						info.setRssNewsCategory(rs.getString("rss_category"));
//						info.setDataCode(rs.getInt("data_code"));
						return info;
					}
				});
		return info;
	}
	
}
