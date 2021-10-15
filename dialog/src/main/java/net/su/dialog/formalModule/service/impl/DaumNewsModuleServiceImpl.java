//package net.su.dialog.formalModule.service.impl;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.concurrent.TimeUnit;
//
//import javax.annotation.Resource;
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//import org.openqa.selenium.By;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.htmlunit.HtmlUnitDriver;
//import org.openqa.selenium.support.ui.WebDriverWait;
//import org.springframework.stereotype.Service;
//
//import net.su.dialog.formalModule.domain.DaumNewsModule;
//import net.su.dialog.formalModule.mapper.DaumNewsModuleMapper;
//import net.su.dialog.formalModule.service.DaumNewsModuleService;
//import net.su.dialog.formalModule.webdriver.Crawling;
//import net.su.dialog.schedule.domain.SchVo;
//
//@Service
//public class DaumNewsModuleServiceImpl implements DaumNewsModuleService {
//
//	@Resource(name = "net.su.dialog.formalModule.mapper.DaumNewsModuleMapper")
//	private DaumNewsModuleMapper daumNewsModuleMapper;
//
//	public List<DaumNewsModule> selectDaumNewsList() throws Exception {
//		System.out.println("임플체크");
//		return daumNewsModuleMapper.selectDaumNewsList();
//	}
//
////	int tryCount = 3;
//	public void insertDaumNews(List<DaumNewsModule> daumNewsCrawlingList) throws Exception {
//		// for(int count=0; count<tryCount;) {
//		for (int i = 0; i < daumNewsCrawlingList.size(); i++) {
//			System.out.println("리스트 사이즈@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + daumNewsCrawlingList.size());
//			System.out.println("리스트 키워드@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + daumNewsCrawlingList.get(i).getNewsCollectKeyword());
//			
//			WebDriver driver = new HtmlUnitDriver();
//			Crawling crawling = new Crawling();
//			System.setProperty("webdriver.chrome.driver",
//					"C:\\Users\\jaeho\\Downloads\\chromedriver_win32\\chromedriver.exe");
//			driver = new ChromeDriver();
//			driver.manage().timeouts().implicitlyWait(10000, TimeUnit.SECONDS);
//			driver.get("http://media.daum.net");
//			WebElement element = driver.findElement(By.name("q"));
//			element.sendKeys(daumNewsCrawlingList.get(i).getNewsCollectKeyword());
//			element.submit();
//			element = driver.findElement(By.xpath("//*[@id=\"daumGnb\"]/div/ul/li[2]/a/span/span"));
//			element.click();
//			driver.findElement(
//					By.cssSelector("#newsColl > div.coll_tabopt > div:nth-child(1) > a > span.ico_tabopt.ico_arr"))
//					.click();
//			// 수집 시작일 입력
//			WebElement startDateInput = driver.findElement(By.cssSelector(
//					"#newsColl > div.coll_tabopt > div.menu_opt.opt_open > div > div > div:nth-child(2) > input"));
//			startDateInput.clear();
//			startDateInput.sendKeys(daumNewsCrawlingList.get(i).getNewsCollectStartDate());
//			// 수집 종료일 입력
//			WebElement endDateInput = driver.findElement(By.cssSelector(
//					"#newsColl > div.coll_tabopt > div.menu_opt.opt_open > div > div > div:nth-child(3)> input"));
//			endDateInput.clear();
//			endDateInput.sendKeys(daumNewsCrawlingList.get(i).getNewsCollectEndDate());
//			// 버튼 클릭
//			driver.findElement(
//					By.cssSelector("#newsColl > div.coll_tabopt > div.menu_opt.opt_open > div > div > button")).click();
//			WebDriverWait wait = new WebDriverWait(driver, 10000); // 드라이버 시간 요소추출 대기시간
//			try {
//				
//				List<DaumNewsModule> daumNewsList = new ArrayList<DaumNewsModule>();
//				// 다음페이지 버튼이 있으면
//				
//					// 다음뉴스 태그가 있는경우
//					if (crawling.isElementPresent(driver) == true) {
//
//						int size = driver.findElements(
//								By.cssSelector("#clusterResultUL > li > div.wrap_cont > div > span.f_nb.date > a"))
//								.size();
//						System.out.println("사이즈 체크@@@" + size);
//						List<WebElement> element2 = driver.findElements(
//								By.cssSelector("#clusterResultUL > li > div.wrap_cont > div > span.f_nb.date > a"));
//						int checkLink = element2.size();
//						System.out.println("사이즈는 " + checkLink);
//
//						for (int j = 0; j < element2.size(); j++) {
//							
//							DaumNewsModule daumNewsModules = new DaumNewsModule();
//							String url = element2.get(j).getAttribute("href");
//							Document doc = Jsoup.connect(url).timeout(30000).get();
//							Elements title = doc.select("h3.tit_view");
//
//							Elements newspaper = doc.select("#cSub > div > em > a > img");
//							Elements date1 = doc.select("#cSub > div > span > span:nth-child(2)");
//							Elements content1 = doc.select("div.article_view > section > div");
//							Elements content2 = doc.select("div.article_view > section > p");
//							Elements writer = doc.select("span.info_view > span:nth-child(1)");
//							Elements edit_date = doc.select("#cSub > div > span > span:nth-child(3)");
//
//							// 신문사 이미지중 alt속성 추출
//							String news = newspaper.attr("alt");
//							String content3 = content1.text().concat(content2.text());
//							String content = content3.replaceAll("''", "");
//							String change = date1.text();
//							// replace= 등록날짜
//							String replace = change.replace("입력", "");
//							String change2 = edit_date.text();
//							// replace2= 수정날짜
//							String replace2 = change2.replace("수정", "");
//							// 등록날짜에 "수정"이 포함되는 경우 replace 를 replace2에 대입 후 , replace는 공백처리
//							if (replace.contains("수정") == true) {
//								replace2 = replace;
//								replace = "";
//							}
//							// change3 = 작성자
//							String[] change3 = writer.text()
//									.replace("!\"#[$]%&\\(\\)\\{\\}@`[*]:[+];-.<>,\\^~|'\\[\\]", "").split(" ");
//
//							// 작성자에 "입력"이 포함되는 경우 change3(작성자) 를 replace에 대입 후 , change3는 공백처리
//							if (change3[0].contains("입력") == true) {
//								replace = change3[0];
//								change3[0] = "";
//							}
//							String Edate = replace2.replace("수정", "");
//							String Odate = replace.replace("입력", "");
//
//							System.out.println("제목은 : " + title.text());
//							System.out.println("신문사는 :" + news);
//							System.out.println("날짜는 : " + Odate);
//							System.out.println("수정일 : " + Edate);
//							System.out.println("내용은 : " + content);
//							System.out.println("등록자 : " + change3[0]);
//
//							daumNewsModules.setDaumNewsCollectModuleTitle(title.text()); // 뉴스 제목
//							daumNewsModules.setDaumNewsCollectModuleContent(content); // 뉴스 내용
//							daumNewsModules.setDaumNewsCollectModuleWriter(change3[0]); // 뉴스 작성자
//							daumNewsModules.setDaumNewsCollectModuleNewsPaper(news); // 뉴스 신문사
//							daumNewsModules.setDaumNewsCollectModuleDate(Odate); // 뉴스 등록날짜
//							daumNewsModules.setDaumNewsCollectModuleModifyDate(Edate); // 뉴스 수정날짜
//							daumNewsModules.setScheduleCode(daumNewsCrawlingList.get(i).getScheduleCode());	//스케줄 코드 
//							daumNewsList.add(daumNewsModules);
//						}
//						// 넥스트 버튼 이 있는경우
//						if (crawling.isElementPresents(driver) == true) {
//							driver.findElement(By
//									.cssSelector("#newsColl > div.paging_comm > span > a.ico_comm1.btn_page.btn_next"))
//									.click();
//						}
//						// 다음버튼이 없는 경우
//						else {
//							break;
//						}
//					}
//					// 다음 뉴스 태그가 없는 경우
//					else if (crawling.isElementPresent(driver) == false) {
//						// 넥스트 버튼이 있는경우
//						if (crawling.isElementPresents(driver) == true) {
//							driver.findElement(By
//									.cssSelector("#newsColl > div.paging_comm > span > a.ico_comm1.btn_page.btn_next"))
//									.click();
//						}
//						// 넥스트 버튼이 없는경우
//						else {
//							break;
//						}
//					}
//					//다음뉴스데이터 체크 
//					if(daumNewsList.size() > 0) {
//						
//					//다음뉴스데이터 테이블 create
//					String tableCreate= "CREATE TABLE `" + daumNewsCrawlingList.get(i).getScheWorkTitle() +"_"+ daumNewsCrawlingList.get(i).getScheduleCode() + "`" ;
//						   tableCreate = tableCreate + "(daum_news_collect_module_seq int(11) primary key, daum_news_collect_module_title varchar(3000), daum_news_collect_module_content varchar(10000), daum_news_collect_module_writer varchar(255), daum_news_collect_module_news_paper varchar(255),daum_news_collect_module_date varchar(255), daum_news_collect_module_news_modify_date varchar(255),data_code int(11), sche_code int(11))";
//						   Map <String,String> crmap = new HashMap<String,String>();
//						   					   crmap.put("create_table", tableCreate);
//						   daumNewsModuleMapper.createDaumNewsTable(crmap);
//					String tableName = daumNewsCrawlingList.get(i).getScheWorkTitle() +"_"+ daumNewsCrawlingList.get(i).getScheduleCode();
//					//다음뉴스데이터 테이블 insert
//					Map<String,Object> insertMap = new HashMap<String,Object>();
//									   insertMap.put("tableName", "`"+tableName+"`");
//									   insertMap.put("daumNewsLists", daumNewsList);
//					daumNewsModuleMapper.insertDaumNews(insertMap);
//					//다음뉴스데이터 실행대기에서 실행완료 update
//					daumNewsModuleMapper.updateStatus(daumNewsCrawlingList.get(i).getScheduleCode());
//					
//					}
//				
//			} catch (Exception e) {
//				System.out.println("오류발생 @@@@@@@@@@ : " + e);
//				// 오류 발생시 테이블 삭제
//				Map<String, Object> deleteDaumNewsTable = new HashMap<String, Object>();
//									deleteDaumNewsTable.put("deleteTable", daumNewsCrawlingList.get(i).getScheWorkTitle() +"_"+ daumNewsCrawlingList.get(i).getScheduleCode());
//				daumNewsModuleMapper.deleteDaumNews(deleteDaumNewsTable);
//				
//				e.printStackTrace();
//				// 현재 시도 회수가 최대 시도 횟수보다 많으면 Exception
//				// if(count> maxretry) {
//				// throw e;
//				//
//				// }
//				// 현 시도 횟수 1증가
//				// count++;
//				driver.quit();
//			}
//		}
//	}
//}
