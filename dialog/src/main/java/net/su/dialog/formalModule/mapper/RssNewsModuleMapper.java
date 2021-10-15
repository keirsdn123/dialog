package net.su.dialog.formalModule.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.formalModule.domain.RssNewsModule;

@Repository("net.su.dialog.formalModule.mapper.RssNewsModuleMapper")
public interface RssNewsModuleMapper {
	// Rss 뉴스 데이터 등록 (세계일보)
	public void segyRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (조선일보)
	public void chosunRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (국민일보)
	public void nationRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (한국일보)
	public void hankookRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (충청일보)
	public void ccdailyRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (경인종합일보)
	public void jonghapRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// 신문 RSS -----------------------------------------------------------

	// Rss 뉴스 데이터 등록 (한경신문)
	public void hankyungRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (서울신문)
	public void seoulRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (울산매일신문)
	public void iusmRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (대구신문)
	public void daeguRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (아시아경제)
	public void asiaeRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

	// Rss 뉴스 데이터 등록 (머니투데이)
	public void moneyTodayRssInsert(List<RssNewsModule> rssNewsList) throws Exception;

}
