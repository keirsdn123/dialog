package net.su.dialog.formalModule.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import net.su.dialog.formalModule.domain.RssNewsModule;

public class RssNewsModuleMapperImpl implements RssNewsModuleMapper {
	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert insertActor;

	public RssNewsModuleMapperImpl() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:log4jdbc:mysql://localhost:3306/dialog2?autoReconnect=true&characterEncoding=UTF-8&serverTimezone=UTC&useUnicode=true&useSSL=false");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.insertActor = new SimpleJdbcInsert(dataSource);
	}

	// 세계일보
	public void segyRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_segye");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", rssNewsModule.getRssNewsModificationDate());
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 조선일보
	public void chosunRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_chosun");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", rssNewsModule.getRssNewsModificationDate());
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 국민일보
	public void nationRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_nation");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle()); // 여기
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", rssNewsModule.getRssNewsModificationDate());
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 한국일보
	public void hankookRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_hankook");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 충청일보
	public void ccdailyRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_ccdaily");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 경인종합일보
	public void jonghapRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_jonghap");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", rssNewsModule.getRssNewsModificationDate());
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 신문 RSS -----------------------------------------------------------

	// 한경신문
	public void hankyungRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_hankyung");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", rssNewsModule.getRssNewsModificationDate());
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 서울신문
	public void seoulRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_seoul");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 울산매일신문
	public void iusmRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_iusm");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 대구신문
	public void daeguRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_daegu");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 아시아경제
	public void asiaeRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_asiae");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}

	// 머니투데이
	public void moneyTodayRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		this.insertActor.withTableName("rss_news_moneytoday");
		for (RssNewsModule rssNewsModule : rssNewsList) {
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("rss_title", rssNewsModule.getRssNewsTitle());
			parameters.put("rss_contents", rssNewsModule.getRssNewsContents());
			parameters.put("rss_registration_date", rssNewsModule.getRssNewsRegistrationDate());
			parameters.put("rss_modification_date", "null");
			parameters.put("rss_author", rssNewsModule.getRssNewsAuthor());
			parameters.put("rss_link", rssNewsModule.getRssNewsLink());
			parameters.put("rss_category", rssNewsModule.getRssNewsCategory());
			insertActor.execute(parameters);
		}
	}
}
