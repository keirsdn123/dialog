package net.su.dialog.dataSet.excelFileRead;

import java.util.ArrayList;
import java.util.List;


public class excelReadOption {

	/**
     * 엑셀파일의 경로
     */
    private String filePath;
    
    /**
     * 추출할 컬럼 명
     */
    private List<String> outputColumns;
    
    /**
     * 추출을 시작할 행 번호
     */
    private int startRow;
    
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    public List<String> getOutputColumns() {
        
        List<String> temp = new ArrayList<String>();
        temp.addAll(outputColumns);
        
        return temp;
    }
    public void setOutputColumns(List<String> outputColumns) {
        
        List<String> temp = new ArrayList<String>();
        temp.addAll(outputColumns);
        
        this.outputColumns = temp;
    }
    //String...args = String[] args 인수를 전달할 때 배열을 만들 필요가 없으므로 전자를 사용하는 것이 더 쉽다. 전자는 백그라운드에서 문자열 배열로 변환되기 때문에 둘 다 동일한 코드로 컴파일될 것이다.
    public void setOutputColumns(String ... outputColumns) {
        
        if(this.outputColumns == null) {
            this.outputColumns = new ArrayList<String>();
        }
        
        for(String ouputColumn : outputColumns) {
            this.outputColumns.add(ouputColumn);
        } //String a : args = for each String a in args 즉, args에 있는 각각의 String a
    }
    
    public int getStartRow() {
        return startRow;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    
    
    /**
     * 박은애 추가
     * 칼럼 데이터 타입 체크
     */
    public static boolean tryParseInt(String value) {
		try {
			Integer.parseInt(value);
			return true;
		} catch(NumberFormatException e) {
			return false;
		}
	}
	
	public static boolean tryParseDouble(String value) {
		try {
			Double.parseDouble(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		} catch (Exception e) {
			return false;
		}
	}
    

}
