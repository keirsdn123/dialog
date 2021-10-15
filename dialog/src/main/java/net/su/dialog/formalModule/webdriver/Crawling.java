package net.su.dialog.formalModule.webdriver;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;


public class Crawling {
	public boolean isElementPresent(WebDriver driver) {
		boolean present;

		driver.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
		present = driver
				.findElements(By.cssSelector("#clusterResultUL > li > div.wrap_cont > div > span.f_nb.date > a"))
				.size() != 0;
		driver.manage().timeouts().implicitlyWait(1000, TimeUnit.SECONDS);

		return present;
	}

	public boolean isElementPresents(WebDriver driver) {
		boolean present;

		driver.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
		present = driver
				.findElements(By.cssSelector("#newsColl > div.paging_comm > span > a.ico_comm1.btn_page.btn_next"))
				.size() != 0;
		driver.manage().timeouts().implicitlyWait(1000, TimeUnit.SECONDS);

		return present;
	}

	// 요소 존재 체크
	public boolean isElementPresent(WebDriver driver, By by) throws Exception {
		try {
			driver.findElement(by);
			return true;
		} catch (NoSuchElementException e) {
			return false;
		}
	}

	// 판매처 존재 체크
	public boolean isMallPresent(String url) throws Exception {
		try {
			WebDriver mallDriver = new HtmlUnitDriver();
			By mallCheck = By.cssSelector("table.tbl.tbl_v > tbody > tr._itemSection");
			mallDriver.get(url);
			mallDriver.findElement(mallCheck);
			mallDriver.quit();
			return true;
		} catch (NoSuchElementException e) {
			return false;
		} catch (TimeoutException e) {
			return false;
		}
	}

}
