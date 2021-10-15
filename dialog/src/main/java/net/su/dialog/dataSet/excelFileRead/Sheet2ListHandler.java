package net.su.dialog.dataSet.excelFileRead;

import java.util.ArrayList;
import java.util.List;

//import org.apache.poi.xssf.eventusermodel.XSSFSheetXMLHandler.SheetContentsHandler;
import net.su.dialog.dataSet.excelFileRead.SheetHandler.SheetContentsHandler2;

public class Sheet2ListHandler implements SheetContentsHandler2{
//public class Sheet2ListHandler implements SheetHandler{
	//collection 객체
	private List<List<String>> rows;
	//collection에 추가될 객체 startRow에서 초기화함.
	private List<String> row;
	//collection 내 객체를 String[]로 잡았기 때문에 배열의 길이를 생서시 받도록 설계
//	private int columnCnt;
	//cell 이벤트 처리 시 해당 cell의 데이터가 배열 어디에 저장되야 할지 가리키는 pointer
	private int currColNum = 0;
	
	//외부 collection과 배열 size를 받기 위해 추가한 부분
	public Sheet2ListHandler(List<List<String>> rows/*, int columnsCnt*/) {
		this.rows = rows;
//		this.columnCnt = columnsCnt;
	}
	
	//Row의 시작 부분에서 발생하는 이벤트를 처리하는 method
	public void startRow(int rowNum) {
//		this.row = new String[columnCnt];
		this.row = new ArrayList<String>();
		currColNum = 0;
	}
	
	//Row의 끝에서 발생하는 이벤트를 처리하는 method
	public void endRow() {
		//cell 이벤트에서 담아놓은 row String[]를 collection에 추가
		//데이터가 하나도 없는 row는 collection에 추가하지 않도록 조건 추가
		boolean addFlag = false;
//		System.out.println("row = "+row);
		for(String data : row) {
			if(!data.equals(""))
				addFlag = true;
//			System.out.println("data = "+data);
		}
		
		if(addFlag) rows.add(row);
//		System.out.println("rows = "+rows);
	}
	
	public void cell(String columnNum, String value) {
		//cell 이벤트 발생 시 해당 cell의 주소와 값을 받아옴.
		//입맛에 맞게 처리하면 됨.
//		row[currColNum++] = value == null ? "":value;
		if(value==null) {
			row.add("");
		} else {
			row.add(value);
		}
//		for(int i=0; i<row.size(); i++) {
//			if(value==null) {
//				row.add("");
//			} else {
//				row.add(value);
//			}
//		}
	}
	
	public String overriddenFormat(String cellRef, int formatIndex, String formatString, String value) {
//	public String overriddenFormat(String cellRef, String value) {
//		System.out.println("cellRef = "+cellRef+" || value = "+value+" || formatString = "+formatString);
		if(formatString != null && (formatString.equals("reserved-0x1f")||formatString.equals("m/d/yy")||formatString.equals("yy/mm/dd")
				||formatString.equals("[$-F800]dddd\\,\\ mmmm\\ dd\\,\\ yyyy"))) {
			return "yyyy-mm-dd;@";
		}
//	    if (cellRef.matches("(G|H|I)\\d+")) { //matches all cells in G, H, and I columns
//	        return "yyyy-mm-dd;@"; //this is the hungarian date format in excel
//	    }
	    return null;
	}
	
	public void headerFooter(String paramString1, boolean paramBoolean, String paramString2) {
		//sheet의 첫 row와 마지막 row를 처리하는 method
		//일단 사용은 x
	}
}
