package net.su.dialog.formalModule.domain;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExportExcelVo {
	
	// 헤더 정보 구성 - 제품
	private String excelProductTitle = null;
	
	// 헤더 정보 구성 - 판매처
	private String excelMallTitle = "판매처 식별자, 판매처 이름 , 판매가 , 판매처 좋아요 , 할인정보, 부가정보 , 배송비 , 등록날짜 , 제품설명 , 수집날짜 , 판매처 URL , 제품 식별자";
	
	// 워크 시트 생성 - 제품
	private String downFileProductNm =  "naverShopping_Product";
	
	// 워크 시트 생성 - 판매처 
	private String downFileMallNm = "naverShopping_Mall";
	
	private XSSFWorkbook wb = null;
	
	private XSSFSheet sheet = null;
	
	private String titleArr[] = null;
	
	private String titleArr2[] = null;
	
	private Cell cell = null;
	
	private Row row = null;


	
	public String[] getTitleArr2() {
		return titleArr2;
	}

	public void setTitleArr2(String[] titleArr2) {
		this.titleArr2 = titleArr2;
	}

	public String getDownFileProductNm() {
		return downFileProductNm;
	}

	public void setDownFileProductNm(String downFileProductNm) {
		this.downFileProductNm = downFileProductNm;
	}

	public String getDownFileMallNm() {
		return downFileMallNm;
	}

	public void setDownFileMallNm(String downFileMallNm) {
		this.downFileMallNm = downFileMallNm;
	}

	public String getExcelMallTitle() {
		return excelMallTitle;
	}

	public void setExcelMallTitle(String excelMallTitle) {
		this.excelMallTitle = excelMallTitle;
	}

	public String getExcelProductTitle() {
		return excelProductTitle;
	}

	public void setExcelProductTitle(String excelProductTitle) {
		this.excelProductTitle = excelProductTitle;
	}


	public XSSFWorkbook getWb() {
		return wb;
	}

	public void setWb(XSSFWorkbook wb) {
		this.wb = wb;
	}

	public XSSFSheet getSheet() {
		return sheet;
	}

	public void setSheet(XSSFSheet sheet) {
		this.sheet = sheet;
	}

	public String[] getTitleArr() {
		return titleArr;
	}

	public void setTitleArr(String[] titleArr) {
		this.titleArr = titleArr;
	}

	public Cell getCell() {
		return cell;
	}

	public void setCell(Cell cell) {
		this.cell = cell;
	}

	public Row getRow() {
		return row;
	}

	public void setRow(Row row) {
		this.row = row;
	}
	
	
}
