package net.su.dialog.formalModule.scheduler;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import net.su.dialog.CommonMethods;
import net.su.dialog.formalModule.domain.NaverShoppingVo;
import net.su.dialog.formalModule.service.NaverCrawlingService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.formalModule.webdriver.Crawling;
import net.su.dialog.schedule.domain.ScheduleLog;

public class NaverCrawling {

	private Crawling crawling = new Crawling();
	
	private NaverCrawlingService naverCrawlingService = new NaverCrawlingService();
	
	private SchedulerService schedulerService = new SchedulerService();
	
	private CommonMethods commonMethods = new CommonMethods();

	public void startWebdriver() {
		System.setProperty("webdriver.chrome.driver", getProjectPath() + "/src/main/resources/static/basicFile/chromedriver.exe"); // 크롬
	}

	// 프로젝트 경로 반환
	public String getProjectPath() {
		String classPath = this.getClass().getResource("").getPath();
		return classPath.substring(1, classPath.indexOf("/target/classes/"));
	}

	// Crwaling 할껀지 말껀지
	public boolean isDoingCrwaling(Element el) {
		return (Integer.parseInt(el.attr("data-expose-rank")) > 0 && el.select("a.btn_compare").size() > 0);
	}

	// 판매처 반환
	public void insertNaverMall(NaverShoppingVo productVo, int seq, String tableName) throws Exception {
		try {
			WebDriver malldriver = new HtmlUnitDriver();
			WebDriverWait wait = new WebDriverWait(malldriver, 100);
			malldriver.get(productVo.getProductUrlAdress());
			By container2 = By.cssSelector("table.tbl.tbl_v > tbody > tr._itemSection");
			wait.until(ExpectedConditions.presenceOfElementLocated(container2));
			String nvMid = malldriver.getCurrentUrl().split("\\?")[1].split("\\&")[0].replaceAll("[nv_mid=]", "");
			malldriver.quit();
			int pageNum = 1;
			while (true) {
				String pgn = String.valueOf(pageNum);
				System.out.println("sssssss " + pageNum);
				Document doc = Jsoup.connect("https://search.shopping.naver.com/detail/price_compare_area.nhn").data("nvMid", nvMid, "page", pgn).timeout(30000).post();
				Elements table = doc.select("table.tbl.tbl_v > tbody > tr._itemSection");
				System.out.println("dddddddddd" + table.size());
				if (table.size() > 0) {
					for (Element a : table) {
						NaverShoppingVo naverShoppingVo = new NaverShoppingVo();
						Elements mall_name = a.select("td:nth-child(1) > a");
						Elements product_description = a.select("td:nth-child(2) > a");
						Elements product_event = a.select("td:nth-child(2) > p > em");
						Elements price = a.select("td.td_price > a > span");
						Elements delivery = a.select("td:nth-child(4) > p");
						Elements etc = a.select("td:nth-child(5) > div > p");
						Elements price_date = a.select("td.td_price > a ");
						Elements jjim = a.select("td:nth-child(2) > div.option > a.sico_zzim_txt._jjim > em._keepCount");
						String link = mall_name.attr("href");
						naverShoppingVo.setMallNme(mall_name.attr("data-mall-name"));
						naverShoppingVo.setMallPriceDate(price_date.attr("data-rcv-date"));
						naverShoppingVo.setProductDescription(product_description.text());
						naverShoppingVo.setMallDiscount(product_event.text());
						naverShoppingVo.setMallPrice(price.text().replace(",", ""));
						naverShoppingVo.setMallDeliveryCost(delivery.text());
						naverShoppingVo.setMallAddition(etc.text());
						naverShoppingVo.setMallGood(jjim.text());
						naverShoppingVo.setMallUrlAddress(link);
						naverShoppingVo.setProductSeq(seq);
						naverCrawlingService.insertNaverMall(naverShoppingVo, seq, tableName); // 판매처 리스트 등록
					}
					pageNum++;
				}
				else {
					break;
				}
			}

		} catch (Exception e) {
			// MainService mainService = new MainService();
			// mainService.errorInsertLog(commonMethods.getClassAndMethod(2), e,
			// "SchedulerTasks(메서드 : getAgency, 판매처 반환 오류)");
		}
	}

	// 휴대폰
	public void phoneCrwalingTask() throws Exception {
		System.out.println("네이버 쇼핑 수집 모듈 - 휴대폰 - ");
		try {
			
			ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();
			
			//시작 로그 등록
			schedulerService.startInsertLog(scheduleLog);
			
			int errorCount = 0;
			// int noAgencyPageCount = 0;

			startWebdriver();
			WebDriver productdriver = new ChromeDriver();
			WebDriverWait wait = new WebDriverWait(productdriver, 10000);
			int index = 1;
			while (true) {
				String url = "https://search.shopping.naver.com/search/category.nhn?pagingIndex=" 
						+ (index++)
						+ "&pagingSize=40&viewType=list&sort=rel&cat_id=50000204&frm=NVSHCAT";
				
				productdriver.get(url);
				By contatiner = By.cssSelector("#_search_list > div.search_list.basis > ul > li:nth-child(1)> div.img_area > a > img");
				wait.until(ExpectedConditions.presenceOfElementLocated(contatiner));
				By next = By.xpath("//*[@id=\"_result_paging\"]/a[@class='next']");
				Document doc = Jsoup.connect(url).timeout(30000).get();
				Elements refind = doc.select("li._model_list._itemSection");
				// int noAgencyCount = 0;
				for (Element el : refind) {
					if (!isDoingCrwaling(el)) {
						// noAgencyCount++;
						continue;
					}

					String rank = el.attr("data-expose-rank");
					Elements productTitle = el.select("div.info > a.tit");
					Elements detail = el.select("span.detail");
					Elements date = el.select("span.date");
					Elements mallCount = el.select("a.btn_compare");
					Elements kategorie = el.select("span.depth");
					NaverShoppingVo naverShoppingVo = new NaverShoppingVo();
					String[] spec = detail.text().split("[|]");

					for (int j = 0; j < spec.length; j++) {
						if (spec[j].contains("화면크기")) {
							naverShoppingVo.setPhoneScreenSize(spec[j].replaceAll("[a-zA-Z|가-힣]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("해상도")) {
							naverShoppingVo.setPhoneResolution(spec[j].replaceAll("[해상도]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("RAM")) {
							naverShoppingVo.setPhoneRam(spec[j].replaceAll("[^0-9]", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("내장메모리")) {
							naverShoppingVo.setPhoneEmbedMemory(spec[j].replaceAll("[^0-9]", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("외장메모리타입")) {
							naverShoppingVo.setPhoneExternalMemoryType(spec[j].replaceAll("[외장메모리타입]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("운영체제")) {
							naverShoppingVo.setPhoneOperatingSystem(spec[j].replaceAll("[운영체제]|:", "").replaceAll(" ", ""));
						}
					}
					naverShoppingVo.setPhoneAgency(kategorie.text().split(">")[2].replaceAll(" ",""));
					naverShoppingVo.setProductRank(rank);
					naverShoppingVo.setProductTitle(productTitle.text());
					naverShoppingVo.setProductRegisteredDate((date.text()).replace("등록일 ", "") + "01");
					naverShoppingVo.setProductKategorie("네이버 쇼핑 > 디지털/가전 > 휴대폰");
					naverShoppingVo.setProductUrlAdress(productTitle.attr("href"));
					naverShoppingVo.setProductMallCount(mallCount.text().replaceAll("[^0-9]", ""));

					if (crawling.isMallPresent(productTitle.attr("href")) == false || naverCrawlingService.isProductPresent(naverShoppingVo,"phone") > 0) {
						continue;
					} else {
						// 제품 리스트 테이블 등록
						int seq = naverCrawlingService.insertShopList(naverShoppingVo, "phone_product_tb");
						// 제품 날짜 테이블 등록
						naverCrawlingService.insertCrawlingDate(naverShoppingVo, seq, "phone_date_tb");
						// 스펙 테이블 등록
						naverCrawlingService.specInsertPhone(naverShoppingVo, seq);
						// 판매처 등록
						insertNaverMall(naverShoppingVo,seq,"phone_mall_tb");
						
					}

				} // for문 끝
				

				if (!crawling.isElementPresent(productdriver, next)) {
					System.out.println("종료");
//					// 스케줄 완료 로그
//					schedulerService.completeInsertLog(scheduleLog);
//					// 스케줄 상태 변경 - 작동완료 -
//					schedulerService.rssSchedulerStatus(scheduleLog);
//					productdriver.close();
//					productdriver.quit();
//					productdriver = null;
//					wait = null;
					break;
				}
			}
			// 스케줄 완료 로그
			schedulerService.completeInsertLog(scheduleLog);
			// 스케줄 상태 변경 - 작동완료 -
			schedulerService.rssSchedulerStatus(scheduleLog);
			productdriver.close();
			productdriver.quit();
			productdriver = null;
			wait = null;
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(), e,
					"NaverCrawling(메서드 : phoneCrwalingTask, 휴대폰 수집 오류)");
			
		}
		
		
	}

	// 저장장치
	public void storageDeviceCrwalingTask() throws Exception {
		System.out.println("네이버 쇼핑 수집 모듈 - 저장장치 - ");
		try {
			ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();
			//시작 로그 등록
			schedulerService.startInsertLog(scheduleLog);
			
			int errorCount = 0;
			// int noAgencyPageCount = 0;

			startWebdriver();
			WebDriver productdriver = new ChromeDriver();
			WebDriverWait wait = new WebDriverWait(productdriver, 10000);
			int index = 1;
			while (true) {
				String url = "https://search.shopping.naver.com/search/category.nhn?pagingIndex=" 
						+ (index++)
						+ "&pagingSize=40&viewType=list&sort=rel&cat_id=50000096&frm=NVSHPAG";

				productdriver.get(url);
				By contatiner = By.cssSelector("#_search_list > div.search_list.basis > ul > li:nth-child(1)> div.img_area > a > img");
				wait.until(ExpectedConditions.presenceOfElementLocated(contatiner));
				By next = By.xpath("//*[@id=\"_result_paging\"]/a[@class='next']");
				Document doc = Jsoup.connect(url).timeout(30000).get();
				Elements refind = doc.select("li._model_list._itemSection");
				// int noAgencyCount = 0;
				for (Element el : refind) {
					if (!isDoingCrwaling(el)) {
						// noAgencyCount++;
						continue;
					}

					String rank = el.attr("data-expose-rank");
					Elements productTitle = el.select("div.info > a.tit");
					Elements detail = el.select("span.detail");
					Elements date = el.select("span.date");
					Elements mallCount = el.select("a.btn_compare");

					NaverShoppingVo naverShoppingVo = new NaverShoppingVo();
					String[] spec = detail.text().split("[|]");

					for (int j = 0; j < spec.length; j++) {
						if (spec[j].contains("HDD크기 :")) {
							naverShoppingVo.setStorageHddSize(spec[j].replaceAll("[HDD크기]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("HDD방식 :")) {
							naverShoppingVo.setStorageHddWay(spec[j].replaceAll("[HDD방식]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("PC연결방식 :")) {
							naverShoppingVo.setStoragePcConnectWay(spec[j].replaceAll("[PC연결방식]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("부가기능 :")) {
							naverShoppingVo.setStorageAddFunction(spec[j].replaceAll("[부가기능]|:", "").replaceAll(" ", ""));
						}
					}
					naverShoppingVo.setProductRank(rank);
					naverShoppingVo.setProductTitle(productTitle.text());
					naverShoppingVo.setProductRegisteredDate((date.text()).replace("등록일 ", "") + "01");
					naverShoppingVo.setProductKategorie("네이버 쇼핑 > 디지털/가전 > 저장장치");
					naverShoppingVo.setProductUrlAdress(productTitle.attr("href"));
					naverShoppingVo.setProductMallCount(mallCount.text().replaceAll("[^0-9]", ""));

					if (crawling.isMallPresent(productTitle.attr("href")) == false || naverCrawlingService.isProductPresent(naverShoppingVo,"storage_device") > 0) {
						continue;
					} else {
						// 제품 리스트 테이블 등록
						int seq = naverCrawlingService.insertShopList(naverShoppingVo, "storage_device_product_tb");
						// 제품 날짜 테이블 등록
						naverCrawlingService.insertCrawlingDate(naverShoppingVo, seq, "storage_device_date_tb");
						// 스펙 테이블 등록
						naverCrawlingService.specInsertStorageDevice(naverShoppingVo, seq);
						// 판매처 등록
						insertNaverMall(naverShoppingVo,seq,"storage_device_mall_tb");
					}

				} // for문 끝

				if (!crawling.isElementPresent(productdriver, next)) {
					System.out.println("종료");
					productdriver.close();
					productdriver.quit();
					productdriver = null;
					wait = null;
					break;
				}
			}
			
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(), e,
					"NaverCrawling(메서드 : storageDeviceCrwalingTask, 저장장치 수집 오류)");
			
		}
		
		
	}
	//태블릿 pc
	public void tabletPcCrwalingTask() throws Exception {
		System.out.println("네이버 쇼핑 수집 모듈 - 태블릿 PC - ");
		
		try {
			ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();
			//시작 로그 등록
			schedulerService.startInsertLog(scheduleLog);
			
			int errorCount = 0;
			// int noAgencyPageCount = 0;

			startWebdriver();
			WebDriver productdriver = new ChromeDriver();
			WebDriverWait wait = new WebDriverWait(productdriver, 10000);
			int index = 1;
			while (true) {
				String url = "https://search.shopping.naver.com/search/category.nhn?pagingIndex=" 
						+ (index++)
						+ "&pagingSize=40&viewType=list&sort=rel&cat_id=50000152&frm=NVSHPAG";

				productdriver.get(url);
				By contatiner = By.cssSelector("#_search_list > div.search_list.basis > ul > li:nth-child(1)> div.img_area > a > img");
				wait.until(ExpectedConditions.presenceOfElementLocated(contatiner));
				By next = By.xpath("//*[@id=\"_result_paging\"]/a[@class='next']");
				Document doc = Jsoup.connect(url).timeout(30000).get();
				Elements refind = doc.select("li._model_list._itemSection");
				// int noAgencyCount = 0;
				for (Element el : refind) {
					if (!isDoingCrwaling(el)) {
						// noAgencyCount++;
						continue;
					}

					String rank = el.attr("data-expose-rank");
					Elements productTitle = el.select("div.info > a.tit");
					Elements detail = el.select("span.detail");
					Elements date = el.select("span.date");
					Elements mallCount = el.select("a.btn_compare");

					NaverShoppingVo naverShoppingVo = new NaverShoppingVo();
					String[] spec = detail.text().split("[|]");

					for (int j = 0; j < spec.length; j++) {
						if (spec[j].contains("화면크기")) {
							naverShoppingVo.setTabletScreenSize(spec[j].replaceAll("화면크기]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("해상도")) {
							naverShoppingVo.setTabletResolution(spec[j].replaceAll("[해상도]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("칩셋 제조사")) {
							naverShoppingVo.setTabletChipset_maker(spec[j].replaceAll("[칩셋 제조사]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("시리즈")) {
							naverShoppingVo.setTabletSeries(spec[j].replaceAll("[시리즈]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("무선랜")) {
							naverShoppingVo.setTabletWireless_lan(spec[j].replaceAll("[무선랜 :]", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("블루투스")) {
							naverShoppingVo.setTabletBluetooth(spec[j].replaceAll("[블루투스 :]", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("웹카메라")) {
							naverShoppingVo.setTabletWeb_camera(spec[j].replaceAll("[웹카메라]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("무게")) {
							naverShoppingVo.setTabletWeight(spec[j].replaceAll("[무게]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("운영체제")) {
							naverShoppingVo.setTabletOperatingSystem(spec[j].replaceAll("[윤용채재 ]|:", "").replaceAll(" ", ""));
						}
					}
					naverShoppingVo.setProductRank(rank);
					naverShoppingVo.setProductTitle(productTitle.text());
					naverShoppingVo.setProductRegisteredDate((date.text()).replace("등록일 ", "") + "01");
					naverShoppingVo.setProductKategorie("네이버 쇼핑 > 디지털/가전 > 테블릿PC");
					naverShoppingVo.setProductUrlAdress(productTitle.attr("href"));
					naverShoppingVo.setProductMallCount(mallCount.text().replaceAll("[^0-9]", ""));

					if (crawling.isMallPresent(productTitle.attr("href")) == false || naverCrawlingService.isProductPresent(naverShoppingVo,"tablet_pc") > 0) {
						continue;
					} else {
						// 제품 리스트 테이블 등록
						int seq = naverCrawlingService.insertShopList(naverShoppingVo, "tablet_pc_product_tb");
						// 제품 날짜 테이블 등록
						naverCrawlingService.insertCrawlingDate(naverShoppingVo, seq, "tablet_pc_date_tb");
						// 스펙 테이블 등록
						naverCrawlingService.specInsertTabletPc(naverShoppingVo, seq);
						// 판매처 등록
						insertNaverMall(naverShoppingVo,seq,"tablet_pc_mall_tb");
					}

				} // for문 끝

				if (!crawling.isElementPresent(productdriver, next)) {
					System.out.println("종료");
					productdriver.close();
					productdriver.quit();
					productdriver = null;
					wait = null;
					break;
				}
			}
			
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(), e,
					"NaverCrawling(메서드 : tabletPcCrwalingTask, 태블릿 PC 수집 오류)");
			
		}
		
		
	}
	//그래픽 카드
	public void graphicCardCrwalingTask() throws Exception {
		System.out.println("네이버 쇼핑 수집 모듈 - 그래픽카드 - ");
		
		try {
			ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();
			//시작 로그 등록
			schedulerService.startInsertLog(scheduleLog);
			
			int errorCount = 0;
			// int noAgencyPageCount = 0;

			startWebdriver();
			WebDriver productdriver = new ChromeDriver();
			WebDriverWait wait = new WebDriverWait(productdriver, 10000);
			int index = 1;
			while (true) {
				String url = "https://search.shopping.naver.com/search/category.nhn?pagingIndex=" 
						+ (index++)
						+ "&pagingSize=40&viewType=list&sort=rel&cat_id=50001219&frm=NVSHPAG";

				productdriver.get(url);
				By contatiner = By.cssSelector("#_search_list > div.search_list.basis > ul > li:nth-child(1)> div.img_area > a > img");
				wait.until(ExpectedConditions.presenceOfElementLocated(contatiner));
				By next = By.xpath("//*[@id=\"_result_paging\"]/a[@class='next']");
				Document doc = Jsoup.connect(url).timeout(30000).get();
				Elements refind = doc.select("li._model_list._itemSection");
				// int noAgencyCount = 0;
				for (Element el : refind) {
					if (!isDoingCrwaling(el)) {
						// noAgencyCount++;
						continue;
					}

					String rank = el.attr("data-expose-rank");
					Elements productTitle = el.select("div.info > a.tit");
					Elements detail = el.select("span.detail");
					Elements date = el.select("span.date");
					Elements mallCount = el.select("a.btn_compare");

					NaverShoppingVo naverShoppingVo = new NaverShoppingVo();
					String[] spec = detail.text().split("[|]");

					for (int j = 0; j < spec.length; j++) {
						if (spec[j].contains("칩셋")) {
							naverShoppingVo.setGraphiccardChipset(spec[j].replaceAll("[칩셋 ]|:","").replaceAll(" ", ""));
						}
						if (spec[j].contains("메모리 종류")) {
							naverShoppingVo.setGraphiccardMemoryType(spec[j].replaceAll("[메모리 종류]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("메모리 :")) {
							naverShoppingVo.setGraphiccardMemory(spec[j].replaceAll("[메모리 :]|","").replaceAll(" ", ""));
						}
						if (spec[j].contains("메모리 대역폭")) {
							naverShoppingVo.setGraphiccardMemoryBandwidth(spec[j].replaceAll("[메모리 대역폭]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("스트림 프로세서")) {
							naverShoppingVo.setGraphiccardStreamProcess(spec[j].replaceAll("[스트림 프로세서 :]", "").replaceAll(" ", "").replaceAll("[a-zA-Z|가-힣]|:", ""));
						}
						if (spec[j].contains("메모리 클럭")) {
							naverShoppingVo.setGraphiccardMemoryCluck(spec[j].replaceAll("[메모리 클럭 :]", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("쿠다 프로세서")) {
							naverShoppingVo.setGraphiccardProcessor(spec[j].replaceAll("[쿠다 프로세서]|:", "").replaceAll(" ", "").replaceAll("[a-zA-Z|가-힣]|:", ""));
						}
						if (spec[j].contains("인터페이스")) {
							naverShoppingVo.setGraphiccardInterface(spec[j].replaceAll("[인터페이스]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("출력단자")) {
							naverShoppingVo.setGraphiccardOutputJack(spec[j].replaceAll("[출력단자 ]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("GPU 클럭")) {
							naverShoppingVo.setGraphiccardGpuCluck(spec[j].replaceAll("[GPU 클럭 ]|:", "").replaceAll(" ", ""));
						}
					}
					naverShoppingVo.setProductRank(rank);
					naverShoppingVo.setProductTitle(productTitle.text());
					naverShoppingVo.setProductRegisteredDate((date.text()).replace("등록일 ", "") + "01");
					naverShoppingVo.setProductKategorie("네이버 쇼핑 > 디지털/가전 > PC부품 > 그래픽카드");
					naverShoppingVo.setProductUrlAdress(productTitle.attr("href"));
					naverShoppingVo.setProductMallCount(mallCount.text().replaceAll("[^0-9]", ""));

					if (crawling.isMallPresent(productTitle.attr("href")) == false || naverCrawlingService.isProductPresent(naverShoppingVo,"graphic_card") > 0) {
						continue;
					} else {
						// 제품 리스트 테이블 등록
						int seq = naverCrawlingService.insertShopList(naverShoppingVo, "graphic_card_product_tb");
						// 제품 날짜 테이블 등록
						naverCrawlingService.insertCrawlingDate(naverShoppingVo, seq, "graphic_card_date_tb");
						// 스펙 테이블 등록
						naverCrawlingService.specInsertgraphicCard(naverShoppingVo, seq);
						// 판매처 등록
						insertNaverMall(naverShoppingVo,seq,"graphic_card_mall_tb");
					}

				} // for문 끝

				if (!crawling.isElementPresent(productdriver, next)) {
					System.out.println("종료");
					productdriver.close();
					productdriver.quit();
					productdriver = null;
					wait = null;
					break;
				}
			}
			
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(), e,
					"NaverCrawling(메서드 : graphicCardCrwalingTask, 그래픽카드 수집 오류)");
			
		}
		
		
	}
	//TV
	public void tvCrwalingTask() throws Exception {
		System.out.println("네이버 쇼핑 수집 모듈 - TV - ");
		
		try {
			ScheduleLog scheduleLog = new CommonMethods().getClassAndMethod();
			//시작 로그 등록
			schedulerService.startInsertLog(scheduleLog);
			
			int errorCount = 0;
			// int noAgencyPageCount = 0;

			startWebdriver();
			WebDriver productdriver = new ChromeDriver();
			WebDriverWait wait = new WebDriverWait(productdriver, 10000);
			int index = 1;
			while (true) {
				String url = "https://search.shopping.naver.com/search/category.nhn?pagingIndex=" 
						+ (index++)
						+ "&pagingSize=40&viewType=list&sort=rel&cat_id=50001395&frm=NVSHPAG";

				productdriver.get(url);
				By contatiner = By.cssSelector("#_search_list > div.search_list.basis > ul > li:nth-child(1)> div.img_area > a > img");
				wait.until(ExpectedConditions.presenceOfElementLocated(contatiner));
				By next = By.xpath("//*[@id=\"_result_paging\"]/a[@class='next']");
				Document doc = Jsoup.connect(url).timeout(30000).get();
				Elements refind = doc.select("li._model_list._itemSection");
				// int noAgencyCount = 0;
				for (Element el : refind) {
					if (!isDoingCrwaling(el)) {
						// noAgencyCount++;
						continue;
					}

					String rank = el.attr("data-expose-rank");
					Elements productTitle = el.select("div.info > a.tit");
					Elements detail = el.select("span.detail");
					Elements date = el.select("span.date");
					Elements mallCount = el.select("a.btn_compare");

					NaverShoppingVo naverShoppingVo = new NaverShoppingVo();
					String[] spec = detail.text().split("[|]");

					for (int j = 0; j < spec.length; j++) {
						if (spec[j].contains("TV화면크기")) {
							naverShoppingVo.setTvScreenSize(spec[j].replaceAll("[TV화면크기]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("형태")) {
							naverShoppingVo.setTvShape(spec[j].substring(spec[j].indexOf(":") + 1).replaceAll(" ", ""));
						}
						if (spec[j].contains("해상도")) {
							naverShoppingVo.setTvResolution(spec[j].replaceAll("[해상도]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("소비전력")) {
							naverShoppingVo.setTvPowerConsumption(spec[j].replaceAll("[소비전력]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("화면비율")) {
							naverShoppingVo.setTvAspectRatio(spec[j].substring(spec[j].indexOf(":") + 1).replaceAll(" ", ""));
						}
						if (spec[j].contains("종류")) {
							naverShoppingVo.setTvType(spec[j].replaceAll("[종류 :]","").replaceAll(" ", ""));
						}
						if (spec[j].contains("밝기")) {
							naverShoppingVo.setTvBrightness(spec[j].replaceAll("[밝기]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("단자")) {
							naverShoppingVo.setTvTerminal(spec[j].replaceAll("[단자]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("부가기능")) {
							naverShoppingVo.setTvTechnique(spec[j].substring(spec[j].indexOf(":") + 1).replaceAll(" ", ""));
						}
						if (spec[j].contains("에너지효율")) {
							naverShoppingVo.setTvEnergyEfficiency(spec[j].replaceAll("[에너지효율]|:", "").replaceAll(" ", ""));
						}
						if (spec[j].contains("백라이트")) {
							naverShoppingVo.setTvBackLight(spec[j].replaceAll("[백라이트]|:", "").replaceAll(" ", ""));
						}
					}
					naverShoppingVo.setProductRank(rank);
					naverShoppingVo.setProductTitle(productTitle.text());
					naverShoppingVo.setProductRegisteredDate((date.text()).replace("등록일 ", "") + "01");
					naverShoppingVo.setProductKategorie("네이버 쇼핑 > 디지털/가전 > TV");
					naverShoppingVo.setProductUrlAdress(productTitle.attr("href"));
					naverShoppingVo.setProductMallCount(mallCount.text().replaceAll("[^0-9]", ""));

					if (crawling.isMallPresent(productTitle.attr("href")) == false || naverCrawlingService.isProductPresent(naverShoppingVo,"tv") > 0) {
						continue;
					} else {
						// 제품 리스트 테이블 등록
						int seq = naverCrawlingService.insertShopList(naverShoppingVo, "tv_product_tb");
						// 제품 날짜 테이블 등록
						naverCrawlingService.insertCrawlingDate(naverShoppingVo, seq, "tv_date_tb");
						// 스펙 테이블 등록
						naverCrawlingService.specInsertTv(naverShoppingVo, seq);
						// 판매처 등록
						insertNaverMall(naverShoppingVo,seq,"tv_mall_tb");
					}

				} // for문 끝

				if (!crawling.isElementPresent(productdriver, next)) {
					System.out.println("종료");
					productdriver.close();
					productdriver.quit();
					productdriver = null;
					wait = null;
					break;
				}
			}
		} catch (Exception e) {
			SchedulerService schedulerService = new SchedulerService();
			schedulerService.errorInsertLog(commonMethods.getClassAndMethod(), e,
					"NaverCrawling(메서드 : tvCrwalingTask, TV 수집 오류)");
			
		}
		
	}	
}
