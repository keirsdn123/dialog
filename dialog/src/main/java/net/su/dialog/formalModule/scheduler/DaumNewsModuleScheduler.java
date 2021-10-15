package net.su.dialog.formalModule.scheduler;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import net.su.dialog.CommonMethods;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.service.DaumNewsModuleService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.formalModule.webdriver.Crawling;
import net.su.dialog.schedule.domain.ScheduleLog;

public class DaumNewsModuleScheduler {

	private DaumNewsModuleService daumNewsModuleService = new DaumNewsModuleService();

	private SchedulerService schedulerService = new SchedulerService();

	private CommonMethods commonMethods = new CommonMethods();

	public void DaumNewsModuleScheduler() throws Exception {
		System.out.println("다음뉴스모듈");
		List<DaumNewsModule> daumNewsCrawlingList = daumNewsModuleService.selectDaumNewsList();
		insertDaumNews(daumNewsCrawlingList);

	}

	// 프로젝트 경로 반환
	public String getProjectPath() {
		String classPath = this.getClass().getResource("").getPath();
		return classPath.substring(1, classPath.indexOf("/target/classes/"));
	}

	public void insertDaumNews(List<DaumNewsModule> daumNewsCrawlingList) throws Exception {

		ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod(2);
		// 시작 log
		System.out.println("로그시작");
		schedulerService.startInsertLog(scheduleLog);
		try {
			// // for(int count=0; count<tryCount;) {
			for (int i = 0; i < daumNewsCrawlingList.size(); i++) {
				System.out.println(
						"리스트 사이즈@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + daumNewsCrawlingList.size());
				System.out.println("리스트 키워드@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
						+ daumNewsCrawlingList.get(i).getNewsCollectKeyword());
				int index = 1;
				List<DaumNewsModule> daumNewsList = new ArrayList<DaumNewsModule>();
				while (true) {
					if(index==6) {
						break;
					}
					WebDriver driver = new HtmlUnitDriver();
					Crawling crawling = new Crawling();
					
					System.setProperty("webdriver.chrome.driver",
							getProjectPath() + "/src/main/resources/static/basicFile/chromedriver.exe");
					driver = new ChromeDriver();
					driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
					driver.get("https://search.daum.net/search?nil_suggest=btn&w=news&DA=STC&cluster=y" + "&q="
							+ daumNewsCrawlingList.get(i).getNewsCollectKeyword() 
							+ "&p=" + (index++) 
							+ "&sd="+ daumNewsCrawlingList.get(i).getNewsCollectStartDate().replaceAll("-", "")+"000000"
							+ "&ed="+ daumNewsCrawlingList.get(i).getNewsCollectEndDate().replaceAll("-", "")+"235959" 
							+ "&period=u");
					// WebDriverWait wait = new WebDriverWait(driver, 10000); // 드라이버 시간 요소추출 대기시간
					try {
						
						// 다음페이지 버튼이 있으면
						// 다음뉴스 태그가 있는경우
						if (crawling.isElementPresent(driver) == true) {
							int size = driver.findElements(
									By.cssSelector("#clusterResultUL > li > div.wrap_cont > div > span.f_nb.date > a"))
									.size();
							System.out.println("사이즈 체크@@@" + size);
							List<WebElement> element2 = driver.findElements(
									By.cssSelector("#clusterResultUL > li > div.wrap_cont > div > span.f_nb.date > a"));
							int checkLink = element2.size();
							System.out.println("사이즈는 " + checkLink);
							for (int j = 0; j < element2.size(); j++) {
								DaumNewsModule daumNewsModules = new DaumNewsModule();
								String url = element2.get(j).getAttribute("href");
								Document doc = Jsoup.connect(url).timeout(30000).get();
								Elements title = doc.select("h3.tit_view");

								Elements newspaper = doc.select("#cSub > div > em > a > img");
								Elements date1 = doc.select("#cSub > div > span > span:nth-child(2)");
								Elements content1 = doc.select("div.article_view > section > div");
								Elements content2 = doc.select("div.article_view > section > p");
								Elements writer = doc.select("span.info_view > span:nth-child(1)");
								Elements edit_date = doc.select("#cSub > div > span > span:nth-child(3)");

								// 신문사 이미지중 alt속성 추출
								String news = newspaper.attr("alt");
								String content3 = content1.text().concat(content2.text());
								String content = content3.replaceAll("''", "");
								String change = date1.text();
								// replace= 등록날짜
								String replace = change.replace("입력", "");
								String change2 = edit_date.text();
								// replace2= 수정날짜
								String replace2 = change2.replace("수정", "");
								// 등록날짜에 "수정"이 포함되는 경우 replace 를 replace2에 대입 후 , replace는 공백처리
								if (replace.contains("수정") == true) {
									replace2 = replace;
									replace = "";
								}
								// change3 = 작성자
								String[] change3 = writer.text()
										.replace("!\"#[$]%&\\(\\)\\{\\}@`[*]:[+];-.<>,\\^~|'\\[\\]", "").split(" ");

								// 작성자에 "입력"이 포함되는 경우 change3(작성자) 를 replace에 대입 후 , change3는 공백처리
								if (change3[0].contains("입력") == true) {
									replace = change3[0];
									change3[0] = "";
								}
								String Edate = replace2.replace("수정", "");
								String Odate = replace.replace("입력", "");

								System.out.println("제목은 : " + title.text());
								System.out.println("신문사는 :" + news);
								System.out.println("날짜는 : " + Odate);
								System.out.println("수정일 : " + Edate);
								System.out.println("내용은 : " + content);
								System.out.println("등록자 : " + change3[0]);

								daumNewsModules.setDaumNewsCollectModuleTitle(title.text()); // 뉴스 제목
								daumNewsModules.setDaumNewsCollectModuleContent(content); // 뉴스 내용
								daumNewsModules.setDaumNewsCollectModuleWriter(change3[0]); // 뉴스 작성자
								daumNewsModules.setDaumNewsCollectModuleNewsPaper(news); // 뉴스 신문사
								daumNewsModules.setDaumNewsCollectModuleDate(Odate); // 뉴스 등록날짜
								daumNewsModules.setDaumNewsCollectModuleModifyDate(Edate); // 뉴스 수정날짜
								daumNewsModules.setScheduleCode(daumNewsCrawlingList.get(i).getScheduleCode()); // 스케줄
																												// 코드
								daumNewsModules.setDaumNewsCollectModuleLink(url);
								daumNewsList.add(daumNewsModules);
								System.out.println("케이스1");
								
//								driver.quit();
//								driver.close();
							}
							// 마지막페이지면
							if(crawling.isElementPresents(driver)==true) {
								if(driver.findElement(By.cssSelector("#newsColl > div.paging_comm > span > a.ico_comm1.btn_page.btn_next")).getAttribute("href")==null) {
									System.out.println("케이스2");
//									driver.quit();
									driver.close();
									break;
								}
							}else {
								System.out.println("케이스3");
//								driver.quit();
								driver.close();
								break;
							}
						}
						else if (crawling.isElementPresent(driver) == false) {
							if(crawling.isElementPresents(driver)==true) {
								if(driver.findElement(By.cssSelector("#newsColl > div.paging_comm > span > a.ico_comm1.btn_page.btn_next")).getAttribute("href")!=null) {
									System.out.println("케이스4");
									System.out.println("다음페이지로");
									continue;
								}
								else if(driver.findElement(By.cssSelector("#newsColl > div.paging_comm > span > a.ico_comm1.btn_page.btn_next")).getAttribute("href")==null) {
									System.out.println("케이스5");
									System.out.println("작업끝");	
//									driver.quit();
									driver.close();
									break;
								}
							}
							else if(crawling.isElementPresents(driver)==false) {
								System.out.println("케이스6");
//								driver.quit();
								driver.close();
								break;
							}
						}
					} catch (Exception e) {
						System.out.println("오류발생 @@@@@@@@@@ : " + e);
						// 오류 발생시 테이블 삭제
						String deleteTableName = daumNewsCrawlingList.get(i).getScheWorkTitle() + "_"
								+ daumNewsCrawlingList.get(i).getScheduleCode();
						daumNewsModuleService.deleteDaumNews(deleteTableName);
						SchedulerService schedulerService = new SchedulerService();
						schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
								"DaumNewsModuleScheduler(메서드 : insertDaumNews, 다음 뉴스 데이터 수집 중 오류)");
//						driver.quit();
						driver.close();
					}
				}//while end
				// //다음뉴스데이터 체크
				// //다음뉴스데이터 테이블 create
				String tableCreate = daumNewsCrawlingList.get(i).getScheWorkTitle() + "_"+ daumNewsCrawlingList.get(i).getScheduleCode();
				daumNewsModuleService.createDaumNewsTable(tableCreate);
				if (daumNewsList.size() > 0) {
					// 다음뉴스데이터 등록
					daumNewsModuleService.insertDaumNews(tableCreate, daumNewsList);
				}
				// 다음뉴스데이터 실행대기에서 실행완료 update
				daumNewsModuleService.updateStatus(daumNewsCrawlingList.get(i).getScheduleCode(),daumNewsCrawlingList.get(i).getDaumNewsCollectRequestCode());
				// 동작완료 로그
				schedulerService.completeInsertLog(scheduleLog);
			} //for end
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
					"DaumNewsModuleScheduler(메서드 : insertDaumNews, 다음 뉴스 데이터 수집 중 오류)");
		}
	}

	// private String dada="*/1 * * * * ?";
	// private String dadad="*/3 * * * * ?";
	// private ThreadPoolTaskScheduler scheduler;
	// private SchedulerFactory schedulerFactory;
	//
	//// @PostConstruct
	// public void startScheduler() throws SchedulerException {
	// scheduler = new ThreadPoolTaskScheduler();
	//
	//
	// scheduler.initialize();
	// // 스케쥴러가 시작되는 부분
	//// 다음 뉴스 (수집) 요청
	// scheduler.schedule(getRunnable(), new CronTrigger(dada));
	////// rss 뉴스 (반출) 요청
	//// scheduler.schedule(getRunnable(), new CronTrigger(dadad));
	//
	// }
	// //다음 뉴스 (수집) 요청
	// private Runnable getRunnable(){
	// return () -> {
	// try {
	// List<DaumNewsModule> daumNewsCrawlingList =
	// daumNewsModuleService.selectDaumNewsList();
	// daumNewsModuleService.insertDaumNews(daumNewsCrawlingList);
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// System.out.println("다음뉴스 테스트@@@@@@@@@@@@@@@@@@@@@@@@" + dada);
	// };
	// }
	// public CronTrigger getTrigger() {
	// return new CronTrigger(dada);
	// }
	//
	// //rss 뉴스 (반출) 요청
	// private Runnable getRss(){
	// return () -> {
	//
	// try {
	// List<DaumNewsModule> daumNewsCrawlingList =
	// daumNewsModuleService.selectDaumNewsList();
	// daumNewsModuleService.insertDaumNews(daumNewsCrawlingList);
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// System.out.println("rss 테스트@@@@@@@@@@@@@@@@@@@@@@@@" + dada);
	//
	// };
	// }
	// public CronTrigger getrssTrigger() {
	//
	//
	// return new CronTrigger(dadad);
	// }

}
