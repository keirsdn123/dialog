package net.su.dialog.formalModule.scheduler;

import net.su.dialog.CommonMethods;
import net.su.dialog.formalModule.domain.RssNewsModule;
import net.su.dialog.formalModule.service.DaumNewsModuleService;
import net.su.dialog.formalModule.service.RssNewsModuleService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.schedule.domain.ScheduleLog;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup; //import Jsoup
import org.jsoup.nodes.Document; //import Jsoup
import org.jsoup.nodes.Element; //Jsoup 사용선언
import org.jsoup.select.Elements; //import Jsoup

public class RssNewsModuleScheduler {

	private RssNewsModuleService rssNewsModuleService = new RssNewsModuleService();

	private SchedulerService schedulerService = new SchedulerService();

	private CommonMethods commonMethods = new CommonMethods();

	private int schedulerSuccess = 0;

	public void RssNewsModuleScheduler() throws Exception {
		System.out.println("rss뉴스모듈");

		ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();

		System.out.println("로그시작 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		schedulerService.startInsertLog(scheduleLog);
		
//		nationRssScraping();
		iusmRssScraping();
//		ccdailyRssScraping();
//		 daeguRssScraping();
//		 chosunRssScraping();
//		 asiaeRssScraping();
//		 moneyTodayRssScraping();
		 
		/*
		 * 오류 없이 실행 moneyTodayRssScraping(); //머니투데이 nationRssScraping(); //국민일보
		 * ccdailyRssScraping(); //충청일보 hankyungRssScraping(); //한경신문 iusmRssScraping();
		 * //울산매일신문 daeguRssScraping(); //대구신문 chosunRssScraping(); // 조선일보
		 * 
		 */

		// RSS 마지막 스케줄링 완료 후 성공 로그 등록
		if (schedulerSuccess == 1) {
			
			// 스케줄 완료 로그 
			schedulerService.completeInsertLog(scheduleLog);

			// 스케줄 상태 변경 - 작동완료 -
			schedulerService.rssSchedulerStatus(scheduleLog);

		}

		/*
		 * 코드 수정 필요 segyeRssScraping(); index 오류 hankookRssScraping(); Caused by:
		 * java.lang.StringIndexOutOfBoundsException: begin 3, end 19, length 0
		 * seoulRssScraping();특수문자 오류 jonghapRssCrawling(); 특수문자 오류
		 * 
		 */
	}

	// 머니투데이
	public void moneyTodayRssScraping() throws Exception {
		System.out.println("cc");
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String mk[] = { "http://rss.mt.co.kr/mt_news_stock.xml", "속보", "http://rss.mt.co.kr/mtOnly.xml", "단독기사",
					"http://rss.mt.co.kr/mt_column.xml", "오피니언", };

			for (int i = 0; i < mk.length; i = i + 2) {
				Document doc = Jsoup.connect(mk[i]).get();
				Elements refind = doc.select("item"); 

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements mk_link = a.select("link");
					String str = mk_link.text();

					Document subDoc = Jsoup.connect(str).get();
					Elements kate = subDoc.select("#rightSectionNewsArea > h4");
					Elements newsTitle = subDoc.select("#article > h1"); // 원문 제목
					Elements newsContnets = subDoc.select("#textBody"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select("#article > div.info > div.infobox1 > span.numd");
					Elements newsAuthor = subDoc.select(
							"#gisa_section > table > tbody > tr > td > div > div.writer_profile.mgt17 > div > strong"); // 원문
																														// 기자
					String start = newsRegistrationDate.text();

					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + start.substring(2, 12));
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + newsAuthor.text());
					System.out.println("카테고리 : " + kate.text().replaceAll("뉴스", ""));
					System.out.println("=========================================================================");

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(start.substring(2, 12));
					vo.setRssNewsLink(str);
					vo.setRssNewsAuthor(newsAuthor.text());
					vo.setRssNewsCategory(kate.text().replaceAll("뉴스", ""));
					rssNewsList.add(vo);
				}
			}
			rssNewsModuleService.moneyTodayRssInsert(rssNewsList);
			rssNewsList = null;
			schedulerSuccess = 1;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : chosunRssScraping, 머니투데이 RSS 수집 오류)");
		}
	}

	// 세계일보 rss
	public void segyeRssScraping() throws Exception {

		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String segyeNews[] = { "http://www.segye.com/Articles/RSSList/segye_politic.xml", "정치",
					"http://www.segye.com/Articles/RSSList/segye_economy.xml", "경제",
					"http://www.segye.com/Articles/RSSList/segye_society.xml", "사회",
					"http://www.segye.com/Articles/RSSList/segye_international.xml", "국제",
					"http://www.segye.com/Articles/RSSList/segye_local.xml", "전국",
					"http://www.segye.com/Articles/RSSList/segye_culture.xml", "문화",
					"http://www.segye.com/Articles/RSSList/segye_opinion.xml", "오피니언",
					"http://www.segye.com/Articles/RSSList/segye_entertainment.xml", "연예",
					"http://www.segye.com/Articles/RSSList/segye_sports.xml", "스포츠", };

			for (int i = 0; i < segyeNews.length; i = i + 2) {
				Document doc = Jsoup.connect(segyeNews[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements segye_link = a.select("link");
					String str = segye_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select("h1.headline"); // 원문 제목
					Elements newsContnets = subDoc.select("div.news_text2018"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select("div.data"); // 원문 등록날짜
					Elements newsModificationDate = subDoc.select("div.data"); // 원문 수정날짜
					Elements newsAuthor = subDoc.select("div.news_text2018"); // 기자 이메일주소

					String author = newsAuthor.text().replaceAll("[a-zA-Z]|@", "").replaceAll("", "");
					String[] author2 = author.split("\\.");

					if (author2[author2.length - 1].contains("기자")) {
						System.out.println(author2[author2.length - 1].replaceAll("[^가-힣]|기자", ""));
						vo.setRssNewsAuthor(author2[author2.length - 1].replaceAll("[^가-힣]|기자", ""));
					} else {
						vo.setRssNewsAuthor("");
					}

					String change = newsRegistrationDate.text().toString();
					int change1 = change.length();

					if (change1 > 16) {
						change = change.substring(4, 24);
					}

					int updatedate = newsModificationDate.text().length();
					String date1 = newsModificationDate.text();

					if (updatedate > 16) {
						date1 = date1.substring(updatedate - 19, updatedate);
					}

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(change);
					vo.setRssNewsModificationDate(date1);
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(segyeNews[i + 1]);
					rssNewsList.add(vo);

					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + change);
					System.out.println("수정일 : " + date1);
					System.out.println("링크 : " + str);
					System.out.println("카테고리" + segyeNews[i + 1]);
				}
			}
			rssNewsModuleService.segyRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : segyeRssScraping, 세계일보 RSS 수집 오류)");
		}
	}
	// 아시아경제
	public void asiaeRssScraping() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String mk[] = { "http://www.aktv.co.kr/rss/S1N1.xml", "경제", "http://www.aktv.co.kr/rss/S1N2.xml", "산업",
					"http://www.aktv.co.kr/rss/S1N4.xml", "사람", "http://www.aktv.co.kr/rss/S1N10.xml", "4차산업", };

			for (int i = 0; i < mk.length; i = i + 2) {

				Document doc = Jsoup.connect(mk[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements mk_link = a.select("link");
					String str = mk_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc
							.select("#user-container > div.float-center.max-width-1080 > header > header > div"); // 원문
																													// 제목
					Elements newsContnets = subDoc.select("#article-view-content-div > p"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select(
							"#user-container > div.float-center.max-width-1080 > header > section > div > ul > li:nth-child(2)");
					Elements newsUpdateDate = subDoc.select(
							"#user-container > div.float-center.max-width-1080 > header > section > div > ul > li:nth-child(3)");
					Elements newsAuthor = subDoc.select(
							"#user-container > div.float-center.max-width-1080 > header > section > div > ul > li:nth-child(1)"); // 원문
																																	// 기자

					String start = newsRegistrationDate.text().replaceAll("승인", "");
					String update = newsUpdateDate.text().replaceAll("수정", "");

					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + start.substring(1, start.length()));
					System.out.println("수정일 : " + update.substring(1, update.length()));
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + newsAuthor.text().replaceAll("기자||PD", ""));
					System.out.println("카테고리 : " + mk[i + 1]);
					System.out.println("=========================================================================");

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(start.substring(1, start.length()));
					vo.setRssNewsModificationDate(update.substring(1, update.length()));
					vo.setRssNewsLink(str);
					vo.setRssNewsAuthor(newsAuthor.text().replaceAll("기자||PD", ""));
					vo.setRssNewsCategory(mk[i + 1]);
					rssNewsList.add(vo);
				}
			}
			rssNewsModuleService.asiaeRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : chosunRssScraping, 아시아경제 RSS 수집 오류)");
		}
	}

	// 조선일보 rss
	public void chosunRssScraping() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String chosunNews[] = { "http://www.chosun.com/site/data/rss/politics.xml", "정치",
					"http://www.chosun.com/site/data/rss/national.xml", "사회",
					"http://www.chosun.com/site/data/rss/international.xml", "국제",
					"http://www.chosun.com/site/data/rss/culture.xml", "문화",
					"http://www.chosun.com/site/data/rss/editorials.xml", "오피니언",
					"http://www.chosun.com/site/data/rss/sports.xml", "스포츠",
					"http://www.chosun.com/site/data/rss/ent.xml", "연예",
					"http://danmee.chosun.com/site/data/rss/rss.xml", "생활ㆍ여성",
					"http://health.chosun.com/site/data/rss/rss.xml", "헬스조선",
					"http://review.chosun.com/site/data/rss/rss.xml", "리뷰조선",
					"http://travel.chosun.com/site/data/rss/rss.xml", "트래블조선",
					"http://books.chosun.com/site/data/rss/rss.xml", "북스조선",
					"http://art.chosun.com/site/data/rss/rss.xml", "아트조선",
					"http://english.chosun.com/site/data/rss/rss.xml", "영문 조선" };
			for (int i = 0; i < chosunNews.length; i += 2) {
				Document doc = Jsoup.connect(chosunNews[i]).get();
				Elements tbody = doc.select("item");
				for (Element a : tbody) {
					RssNewsModule vo = new RssNewsModule();
					Elements chosun_link = a.select("link");

					String str = chosun_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select("h1#news_title_text_id"); // 원문 제목
					Elements newsContnets = subDoc.select("div.par"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select("div.news_date"); // 원문 등록날짜
					Elements newsModificationDate = subDoc.select("div.news_date"); // 원문 수정날짜
					Elements newsAuthor = subDoc.select("li#j1"); // 원문 기자

					String change = newsRegistrationDate.text();
					int change2 = change.length();

					if (change2 > 16) {
						change = change.substring(3, 19);
					}

					int updatedate = newsModificationDate.text().length();
					String date1 = newsModificationDate.text();

					if (updatedate > 16) {
						date1 = date1.substring(updatedate - 16, updatedate);
					}
					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + change);
					System.out.println("수정일 : " + date1);
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + newsAuthor.text());
					System.out.println("카테고리 : " + chosunNews[i + 1]);

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(change);
					vo.setRssNewsModificationDate(date1);
					vo.setRssNewsAuthor(newsAuthor.text());
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(chosunNews[i + 1]);
					rssNewsList.add(vo);
				}
			}
			rssNewsModuleService.chosunRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : chosunRssScraping, 조선일보 RSS 수집  오류)");
		}
	}

	// 국민일보
	public void nationRssScraping() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String nationNews[] = { "http://rss.kmib.co.kr/data/kmibPolRss.xml", "정치",
					"http://rss.kmib.co.kr/data/kmibEcoRss.xml", "경제", "http://rss.kmib.co.kr/data/kmibSocRss.xml",
					"사회", "http://rss.kmib.co.kr/data/kmibIntRss.xml", "국제",
					"http://rss.kmib.co.kr/data/kmibSpoRss.xml", "스포츠", "http://rss.kmib.co.kr/data/kmibCulRss.xml",
					"문화", "http://rss.kmib.co.kr/data/kmibLifRss.xml", "생활",
					"http://rss.kmib.co.kr/data/kmibColRss.xml", "사설/칼럼" };

			for (int i = 0; i < nationNews.length; i = i + 2) {
				Document doc = Jsoup.connect(nationNews[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements nation_link = a.select("link");
					String str = nation_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select("#sub > div.sub_header > div.nwsti_inner > div.nwsti > h3"); // 원문
																													// 제목
					Elements newsContnets = subDoc.select("#articleBody"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select(
							"#sub > div.sub_header > div.nwsti_inner > div.nwsti > div > div.date > span:nth-child(2)");
					Elements newsModificationDate = subDoc.select(
							"#sub > div.sub_header > div.nwsti_inner > div.nwsti > div > div.date > span:nth-child(5)");
					Elements newsAuthor = subDoc.select("#articleBody"); // 원문 기자

					String author = newsAuthor.text().replaceAll("[a-zA-Z]|@", "").replaceAll(" ", "");
					String[] author2 = author.split("\\.");

					if (author2[author2.length - 1].contains("기자")) {
						System.out.println(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
						vo.setRssNewsAuthor(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
					}

					String start = newsRegistrationDate.text();
					String update = newsModificationDate.text();

					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + start);
					System.out.println("수정일 : " + update);
					System.out.println("링크 : " + str);
					System.out.println("카테고리 : " + nationNews[i + 1]);

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(start);
					vo.setRssNewsModificationDate(update);
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(nationNews[i + 1]);
					// vo.setNation_author(author);
					rssNewsList.add(vo);

				}
			}
			rssNewsModuleService.nationRssInsert(rssNewsList);
			rssNewsList = null;
			schedulerSuccess =1;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : nationRssScraping, 국민일보 RSS 수집  오류)");
		}
	}

	// 충청 일보
	public void ccdailyRssScraping() throws Exception {
		try {
			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String ccdailyNews[] = { "http://www.ccdailynews.com/rss/S1N1.xml", "정치",
					"http://www.ccdailynews.com/rss/S1N2.xml", "경제", "http://www.ccdailynews.com/rss/S1N3.xml", "사회",
					"http://www.ccdailynews.com/rss/S1N4.xml", "문화", "http://www.ccdailynews.com/rss/S1N5.xml", "충북",
					"http://www.ccdailynews.com/rss/S1N6.xml", "충남", "http://www.ccdailynews.com/rss/S1N7.xml", "대전·세종",
					"http://www.ccdailynews.com/rss/S1N9.xml", "연예", "http://www.ccdailynews.com/rss/S1N10.xml", "핫이슈",
					"http://www.ccdailynews.com/rss/S1N11.xml", "社告", "http://www.ccdailynews.com/rss/S1N12.xml",
					"사람과일", "http://www.ccdailynews.com/rss/S1N13.xml", "우리지역소식",
					"http://www.ccdailynews.com/rss/S1N14.xml", "기획연재", "http://www.ccdailynews.com/rss/S1N16.xml",
					"오피니언", "http://www.ccdailynews.com/rss/S1N18.xml", "CC라이프뉴스",
					"http://www.ccdailynews.com/rss/S1N19.xml", "사업·행사", "http://www.ccdailynews.com/rss/S1N20.xml",
					"충청일보TV", "http://www.ccdailynews.com/rss/S1N21.xml", "비주얼뉴스",
					"http://www.ccdailynews.com/rss/S1N22.xml", "지면보기", "http://www.ccdailynews.com/rss/S1N23.xml",
					"국제뉴스", "http://www.ccdailynews.com/rss/S1N24.xml", "CC온라인뉴스룸",
					"http://www.ccdailynews.com/rss/S1N25.xml", "스포츠", };

			for (int i = 0; i < ccdailyNews.length; i = i + 2) {
				Document doc = Jsoup.connect(ccdailyNews[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements jonghap_link = a.select("link");
					String str = jonghap_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select(
							"#ND_Warp > table > tbody > tr > td:nth-child(1) > table:nth-child(2) > tbody > tr > td > table > tbody > tr:nth-child(2) > td > div.View_Title > strong"); // 원문
																																														// 제목
					Elements newsContnets = subDoc.select("#articleBody"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select(
							"#ND_Warp > table > tbody > tr > td:nth-child(1) > table:nth-child(3) > tbody > tr > td:nth-child(2) > div");
					Elements newsAuthor = subDoc.select(
							"#ND_Warp > table > tbody > tr > td:nth-child(1) > table:nth-child(2) > tbody > tr > td > table > tbody > tr:nth-child(2) > td > div.View_Info"); // 원문
																																												// 기자

					String change = newsRegistrationDate.text();
					int change2 = change.length();

					if (change2 > 16) {
						change = change.substring(3, 20);
						vo.setRssNewsRegistrationDate(change);
					} else {

					}

					String author = newsAuthor.text().replaceAll("[a-zA-Z]|@", "").replaceAll(" ", "");
					String[] author2 = author.split("\\.");

					if (author2[author2.length - 1].contains("기자") || author2[author2.length - 1].contains("(")
							|| author2[author2.length - 1].contains("교수")) {
						System.out.println(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
						vo.setRssNewsAuthor(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
					}

					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + newsRegistrationDate.text());
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + newsAuthor.text());
					System.out.println("카테고리 : " + ccdailyNews[i + 1]);

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(ccdailyNews[i + 1]);
					rssNewsList.add(vo);
				}
			}
			rssNewsModuleService.ccdailyRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : ccdailyRssScraping, 충청일보 RSS 수집  오류)");

		}
	}

	// 경인 종합 일보
	public void jonghapRssCrawling() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String jonghapNews[] = { "http://www.jonghapnews.com/rss/S1N1.xml", "섹션뉴스",
					"http://www.jonghapnews.com/rss/S1N2.xml", "지역종합", "http://www.jonghapnews.com/rss/S1N3.xml",
					"People & People", "http://www.jonghapnews.com/rss/S1N4.xml", "도정",
					"http://www.jonghapnews.com/rss/S1N5.xml", "의정", "http://www.jonghapnews.com/rss/S1N6.xml", "인천시정",
					"http://www.jonghapnews.com/rss/S1N7.xml", "인천의정", };

			for (int i = 0; i < jonghapNews.length; i = i + 2) {

				Document doc = Jsoup.connect(jonghapNews[i]).get();
				Elements refind = doc.select("item");
				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements jonghap_link = a.select("link");
					String str = jonghap_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select("#article-wrap > div.headline.border-box > font.headline-title"); // 원문
					Elements newsContnets = subDoc.select("#articleBody"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select("#head-info > div.info > ul > li.date");
					Elements newsAuthor = subDoc.select("#head-info > div.info > ul > li.name"); // 원문 기자

					String change = newsRegistrationDate.text();
					int change2 = change.length();

					if (change2 > 16) {
						change = change.substring(3, 19);
						vo.setRssNewsRegistrationDate(change);
					} else {

					}
					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					// vo.setJonghap_registrationdate(newsRegistrationDate.text());
					vo.setRssNewsAuthor(newsAuthor.text());
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(jonghapNews[i + 1]);
					rssNewsList.add(vo);
					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + newsRegistrationDate.text());
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + newsAuthor.text());
					System.out.println("카테고리 : " + jonghapNews[i + 1]);
				}
			}
			rssNewsModuleService.jonghapRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : jonghapRssCrawling, 경인종합일보 RSS 수집  오류)");
		}
	}

	// 신문
	// 한경신문
	public void hankyungRssScraping() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String hankyungNews[] = { "http://rss.hankyung.com/new/news_stock.xml", "증권",
					"http://rss.hankyung.com/new/news_economy.xml", "경제/금융",
					"http://rss.hankyung.com/new/news_estate.xml", "부동산",
					"http://rss.hankyung.com/new/news_society.xml", "사회", "http://rss.hankyung.com/new/news_enter.xml",
					"연예", "http://rss.hankyung.com/new/news_industry.xml", "산업/IT" };

			for (int i = 0; i < hankyungNews.length; i = i + 2) {
				Document doc = Jsoup.connect(hankyungNews[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements hankyung_link = a.select("link");
					String str = hankyung_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select("h1.title"); // 원문 제목
					Elements newsContnets = subDoc.select("div.wrap_article"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select(
							"#container > div.wrap_container > div > div.article_info > div.date_info > div.datepublished > span:nth-child(1) > span");

					Elements newsModificationDate = subDoc.select(
							"#container > div.wrap_container > div > div.article_info > div.date_info > div.datepublished > span:nth-child(2) > span");

					Elements newsAuthor = subDoc.select(
							"#container > div.wrap_container > div > div.article_info > div.editor > a > div > span:nth-child(2)"); // 원문
																																	// 기자

					String start = newsRegistrationDate.text();
					String update = newsModificationDate.text();

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(start);
					vo.setRssNewsModificationDate(update);
					vo.setRssNewsAuthor(newsAuthor.text());
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(hankyungNews[i + 1]);
					rssNewsList.add(vo);
					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + start);
					System.out.println("수정일 : " + update);
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + newsAuthor.text());
					System.out.println("카테고리 : " + hankyungNews[i + 1]);

				}
			}
			rssNewsModuleService.hankyungRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : hankyungRssScraping, 한경신문 RSS 수집  오류)");
		}
	}

	// // 서울신문 - 특수문자 시부레
	// public void seoulRssScraping() throws Exception {
	// try {
	//
	// List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
	// String seoulNews[] = { "http://www.storyofseoul.com/rss/S1N2.xml", "정치",
	// "http://www.storyofseoul.com/rss/S1N3.xml", "사회",
	// "http://www.storyofseoul.com/rss/S1N4.xml", "경제",
	// "http://www.storyofseoul.com/rss/S1N10.xml", "칼럼",
	// "http://www.storyofseoul.com/rss/S1N13.xml",
	// "연재소설", "http://www.storyofseoul.com/rss/S1N14.xml", "기획",
	// "http://www.storyofseoul.com/rss/S1N15.xml", "SOS 칼럼",
	// "http://www.storyofseoul.com/rss/S1N5.xml",
	// "문화", "http://www.storyofseoul.com/rss/S1N7.xml", "미디어" };
	//
	// for (int i = 0; i < seoulNews.length; i = i + 2) {
	// Document doc = Jsoup.connect(seoulNews[i]).get();
	// Elements refind = doc.select("item");
	//
	// for (Element a : refind) {
	// RssNewsModule vo = new RssNewsModule();
	// Elements seoul_link = a.select("link");
	// String str = seoul_link.text();
	//
	// Document subDoc = Jsoup.connect(str).get();
	//
	// Elements newsTitle = subDoc.select("#article-wrap > div.headline.border-box >
	// span"); // 원문 제목
	// Elements newsContnets = subDoc.select("#articleBody"); // 원문 내용
	// Elements newsRegistrationDate = subDoc.select("#head-info > div >
	// span:nth-child(4)");
	// Elements newsAuthor = subDoc.select("#head-info > div > strong"); // 원문 기자
	//
	// vo.setRssNewsTitle(newsTitle.text());
	// vo.setRssNewsContents(newsContnets.text());
	// vo.setRssNewsRegistrationDate(newsRegistrationDate.text());
	// vo.setRssNewsAuthor(newsAuthor.text());
	// vo.setRssNewsLink(str);
	// vo.setRssNewsCategory(seoulNews[i + 1]);
	// rssNewsList.add(vo);
	// System.out.println("제목 : " + newsTitle.text());
	// System.out.println("내용 : " + newsContnets.text());
	// System.out.println("등록일 : " + newsRegistrationDate.text());
	// System.out.println("링크 : " + str);
	// System.out.println("기자 : " + newsAuthor.text());
	// System.out.println("카테고리 : " + seoulNews[i + 1]);
	//
	// }
	// }
	// rssNewsModuleService.seoulRssInsert(rssNewsList);
	// rssNewsList = null;
	// } catch (Exception e) {
	// SchedulerService schedulerService = new SchedulerService();
	// schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2),
	// e,"RssNewsModuleScheduler(메서드 : seoulRssScraping, 서울신문 RSS 수집 오류)");
	//
	// }
	// }

	// 울산 매일
	public void iusmRssScraping() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String iusmNews[] = { "http://www.iusm.co.kr/rss/S1N1.xml", "연예", "http://www.iusm.co.kr/rss/S1N3.xml",
					"기획", "http://www.iusm.co.kr/rss/S1N4.xml", "생활정보", "http://www.iusm.co.kr/rss/S1N5.xml", "오피니언",
					"http://www.iusm.co.kr/rss/S1N6.xml", "열린마당", "http://www.iusm.co.kr/rss/S1N7.xml", "정치",
					"http://www.iusm.co.kr/rss/S1N8.xml", "경제", "http://www.iusm.co.kr/rss/S1N9.xml", "사회",
					"http://www.iusm.co.kr/rss/S1N10.xml", "문화", "http://www.iusm.co.kr/rss/S1N11.xml", "스포츠",
					"http://www.iusm.co.kr/rss/S1N12.xml", "사람과삶", "http://www.iusm.co.kr/rss/S1N13.xml", "지방",
					"http://www.iusm.co.kr/rss/S1N14.xml", "뉴스Now", "http://www.iusm.co.kr/rss/S1N15.xml", "외신",
					"http://www.iusm.co.kr/rss/S1N19.xml", "라이프", "http://www.iusm.co.kr/rss/S1N20.xml", "지방선거", };

			for (int i = 0; i < iusmNews.length; i = i + 2) {
				Document doc = Jsoup.connect(iusmNews[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements iusm_link = a.select("link");
					String str = iusm_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc.select("#article-wrap > div.headline.border-box > font"); // 원문 제목
					Elements newsContnets = subDoc.select("#articleBody"); // 원문 내용
					Elements newsRegistrationDate = subDoc.select("#head-info > div > ul > li.date");
					Elements newsAuthor = subDoc.select("#head-info > div > ul > li.name"); // 원문 기자

					String change = newsRegistrationDate.text();
					int change2 = change.length();
					String change3 = newsAuthor.text();

					if (change2 > 16) {
						change = change.substring(3, 19);
					}

					if (change3.contains(".") == true) {
						change3 = "";
					}
					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(change);
					vo.setRssNewsAuthor(change3);
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(iusmNews[i + 1]);
					rssNewsList.add(vo);
					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + change);
					System.out.println("링크 : " + str);
					System.out.println("기자 : " + change3);
					System.out.println("카테고리 : " + iusmNews[i + 1]);

				}
			}
			rssNewsModuleService.iusmRssInsert(rssNewsList);
			rssNewsList = null;
			schedulerSuccess = 1;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : iusmRssScraping, 울산매일신문 RSS 수집  오류)");
		}
	}

	// 대구신문
	public void daeguRssScraping() throws Exception {
		try {

			List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
			String daeguNews[] = { "http://www.idaegu.co.kr/rss/S1N1.xml", "정치", "http://www.idaegu.co.kr/rss/S1N2.xml",
					"경제", "http://www.idaegu.co.kr/rss/S1N3.xml", "사회", "http://www.idaegu.co.kr/rss/S1N4.xml", "경북",
					"http://www.idaegu.co.kr/rss/S1N5.xml", "문화", "http://www.idaegu.co.kr/rss/S1N6.xml", "스포츠",
					"http://www.idaegu.co.kr/rss/S1N7.xml", "오피니언", "http://www.idaegu.co.kr/rss/S1N9.xml", "사람들",
					"http://www.idaegu.co.kr/rss/S1N10.xml", "어린이는 미래다", "http://www.idaegu.co.kr/rss/S1N11.xml",
					"독자마당", "http://www.idaegu.co.kr/rss/S1N12.xml", "기획특집", "http://www.idaegu.co.kr/rss/S1N13.xml",
					"종합", };

			for (int i = 0; i < daeguNews.length; i = i + 2) {
				Document doc = Jsoup.connect(daeguNews[i]).get();
				Elements refind = doc.select("item");

				for (Element a : refind) {
					RssNewsModule vo = new RssNewsModule();
					Elements daegu_link = a.select("link");
					String str = daegu_link.text();

					Document subDoc = Jsoup.connect(str).get();

					Elements newsTitle = subDoc
							.select("#user-container > div.float-center.max-width-1040 > header > header > div"); // 원문
																													// 제목
					Elements newsContnets = subDoc.select("#article-view-content-div > div.news_content > div > font"); // 원문
																														// 내용
					Elements newsRegistrationDate = subDoc.select(
							"#user-container > div.float-center.max-width-1040 > header > section > div > ul > li:nth-child(2)");
					Elements newsAuthor = subDoc.select(
							"#user-container > div.float-center.max-width-1040 > header > section > div > ul > li:nth-child(1)");

					String change = newsRegistrationDate.text();
					int change2 = change.length();

					String change3 = newsAuthor.text();

					if (change2 > 16) {
						change = change.substring(3, 19);
					}
					if (change.contains("댓글")) {
						Elements newsRegistrationDate1 = subDoc.select(
								"#user-container > div.float-center.max-width-1040 > header > section > div > ul > li:nth-child(1)");
						change = newsRegistrationDate1.text();
						change = change.substring(3, 19);
					}
					if (change3.contains("승인") == true) {
						change3 = "";
					}

					vo.setRssNewsTitle(newsTitle.text());
					vo.setRssNewsContents(newsContnets.text());
					vo.setRssNewsRegistrationDate(change);
					vo.setRssNewsLink(str);
					vo.setRssNewsCategory(daeguNews[i + 1]);
					vo.setRssNewsAuthor(change3);
					rssNewsList.add(vo);
					System.out.println("제목 : " + newsTitle.text());
					System.out.println("내용 : " + newsContnets.text());
					System.out.println("등록일 : " + change);
					System.out.println("링크 : " + str);
					System.out.println("카테고리 : " + daeguNews[i + 1]);
					System.out.println("기자 : " + change3);
				}
			}
			rssNewsModuleService.daeguRssInsert(rssNewsList);
			rssNewsList = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"RssNewsModuleScheduler(메서드 : daeguRssScraping, 대구신문 RSS 수집  오류)");
		}
	}

	// 다음 rss
	// public void daumRssScraping() throws Exception {
	// List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
	// Document doc =
	// Jsoup.connect("http://media.daum.net/syndication/today_sisa.rss").get();
	// Elements refind = doc.select("item");
	//
	// for (Element a : refind) {
	// RssNewsModule vo = new RssNewsModule();
	// Elements daum_link = a.select("link");
	// String str = daum_link.text();
	//
	// Document subDoc = Jsoup.connect(str).get();
	//
	// Elements newsTitle = subDoc.select("h3.tit_view"); // 원문 제목
	// Elements newsContnets = subDoc.select("#harmonyContainer > section"); // 원문
	// 내용
	// Elements newsRegistrationDate = subDoc.select("#cSub > div > span >
	// span:nth-child(2)"); // 원문 등록날짜
	// Elements newsModificationDate = subDoc.select("#cSub > div > span >
	// span:nth-child(3)"); // 원문 수정날짜
	// Elements newsAuthor = subDoc.select("#cSub > div > span >
	// span:nth-child(1)"); // 원문 기자
	//
	// String change = newsRegistrationDate.text();
	// String replace = change.replace("입력 ", "");
	//
	// String change2 = newsModificationDate.text();
	// String replace2 = change2.replace("수정 ", "");
	//
	// if (replace.contains("수정") == true) {
	// replace = "";
	// }
	// String change3 = newsAuthor.text();
	// if (change3.contains("입력") == true) {
	// change3 = "";
	// }
	//
	// vo.setRssNewsTitle(newsTitle.text());
	// vo.setRssNewsContents(newsContnets.text());
	// vo.setRssNewsRegistrationDate(replace);
	// vo.setRssNewsModificationDate(replace2);
	// vo.setRssNewsAuthor(change3);
	// vo.setRssNewsLink(str);
	//
	// System.out.println("제목 : " + newsTitle.text());
	// System.out.println("내용 : " + newsContnets.text());
	// System.out.println("등록일 : " + replace);
	// System.out.println("수정일 : " + replace2);
	// System.out.println("링크 : " + str);
	// System.out.println("기자 : " + change3);
	//
	// homedao.daumcrawl(vo);
	// }
	// }

	// // 한국일보
	// public void hankookRssScraping() throws Exception {
	// List<RssNewsModule> rssNewsList = new ArrayList<RssNewsModule>();
	// String hankookNews[] = { "http://rss.hankooki.com/daily/dh_politics.xml",
	// "정치",
	// "http://rss.hankooki.com/daily/dh_economy.xml", "경제",
	// "http://rss.hankooki.com/daily/dh_society.xml",
	// "사회", "http://rss.hankooki.com/daily/dh_world.xml", "국제",
	// "http://rss.hankooki.com/daily/dh_it_tech.xml", "IT·과학",
	// "http://rss.hankooki.com/daily/dh_culture.xml",
	// "문화", "http://rss.hankooki.com/daily/dh_life.xml", "라이프",
	// "http://rss.hankooki.com/daily/dh_column.xml",
	// "칼럼", "http://rss.hankooki.com/daily/dh_biz.xml", "비즈브리핑", };
	//
	// for (int i = 0; i < hankookNews.length; i = i + 2) {
	// Document doc = Jsoup.connect(hankookNews[i]).get();
	// Elements refind = doc.select("item");
	//
	// for (Element a : refind) {
	// RssNewsModule vo = new RssNewsModule();
	// Elements hankook_link = a.select("link");
	// String str = hankook_link.text();
	//
	// Document subDoc = Jsoup.connect(str).get();
	//
	// Elements newsTitle = subDoc.select("#GS_Title"); // 원문 제목
	// Elements newsContnets = subDoc.select("#GS_Content"); // 원문 내용
	// Elements newsRegistrationDate = subDoc.select("#gs-titlegroup > ul >li.report
	// > span:nth-child(4)");
	// Elements newsAuthor = subDoc.select("#gs-titlegroup > ul > li.report
	// >span:nth-child(2)"); // 원문 기자
	//
	// String change = newsRegistrationDate.text();
	// int change2 = change.length();
	// String change3 = newsAuthor.text();
	//
	// if (change2 > 16) {
	// change = change.substring(3, 19);
	// vo.setRssNewsRegistrationDate(change);
	// } else {
	//
	// }
	//
	// String author = newsAuthor.text().replaceAll("[a-zA-Z]|@", "").replaceAll("",
	// "");
	// String[] author2 = author.split("\\.");
	//
	// if (author2[author2.length - 1].contains("기자") || author2[author2.length -
	// 1].contains("(")
	// || author2[author2.length - 1].contains("교수")) {
	// System.out.println(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
	// vo.setRssNewsAuthor(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
	// } else {
	// Elements newsRegistrationDate1 = subDoc.select("#Input_Time > span.txt");
	// String change4 = newsRegistrationDate1.text();
	// change4 = change4.substring(3, 19); //문제
	// vo.setRssNewsRegistrationDate(change4);
	// vo.setRssNewsAuthor(author2[author2.length - 1].replaceAll("[^가-힣]", ""));
	// }
	//
	// System.out.println("제목 : " + newsTitle.text());
	// System.out.println("내용 : " + newsContnets.text());
	// System.out.println("등록일 : " + change);
	// System.out.println("링크 : " + str);
	// System.out.println("카테고리 : " + hankookNews[i + 1]);
	//
	// vo.setRssNewsTitle(newsTitle.text());
	// vo.setRssNewsContents(newsContnets.text());
	// vo.setRssNewsLink(str);
	// vo.setRssNewsCategory(hankookNews[i + 1]);
	// rssNewsList.add(vo);
	// }
	// }
	// rssNewsModuleService.hankookRssInsert(rssNewsList);
	// rssNewsList = null;
	// }

}
