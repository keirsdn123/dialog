package net.su.dialog.formalModule.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.domain.RssNewsModule;
import net.su.dialog.formalModule.mapper.DaumNewsModuleMapperImpl;
import net.su.dialog.formalModule.mapper.RssNewsModuleMapper;
import net.su.dialog.formalModule.mapper.RssNewsModuleMapperImpl;

@Service
public class RssNewsModuleService {

	@Resource(name = "net.su.dialog.formalModule.mapper.RssNewsModuleMapper")
	private RssNewsModuleMapper rssNewsModuleMapper;

	// Rss 뉴스 데이터 등록 (세계일보)
	public void segyRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.segyRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (조선일보)
	public void chosunRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.chosunRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (국민일보)
	public void nationRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.nationRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (한국일보)
	public void hankookRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.hankookRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (충청일보)
	public void ccdailyRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.ccdailyRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (경인조합일보)
	public void jonghapRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.jonghapRssInsert(rssNewsList);
	}

	// 신문 RSS -----------------------------------------------------------

	// Rss 뉴스 데이터 등록 (한경신문)
	public void hankyungRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.hankyungRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (서울신문)
	public void seoulRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.seoulRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (울산매일신문)
	public void iusmRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.iusmRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (대구신문)
	public void daeguRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.daeguRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (아시아경제)
	public void asiaeRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.asiaeRssInsert(rssNewsList);
	}

	// Rss 뉴스 데이터 등록 (머니투데이)
	public void moneyTodayRssInsert(List<RssNewsModule> rssNewsList) throws Exception {
		rssNewsModuleMapper = new RssNewsModuleMapperImpl();
		rssNewsModuleMapper.moneyTodayRssInsert(rssNewsList);
	}
	
	
}
