package net.su.dialog.dataSet.excelFileRead;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.util.CellReference;
import org.springframework.expression.ParseException;

public class excelCellRef {

	/**
     * Cell에 해당하는 Column Name을 가젼온다(A,B,C..)
     * 만약 Cell이 Null이라면 int cellIndex의 값으로
     * Column Name을 가져온다.
     * @param cell
     * @param cellIndex
     * @return
     */
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if(cell != null) {
            cellNum = cell.getColumnIndex();
        }
        else {
            cellNum = cellIndex;
        }
        
        return CellReference.convertNumToColString(cellNum);
    }
    
    public static String getValue(Cell cell) throws Exception {
        String value = "";
      //데이터포멧터
//        DataFormatter formatter = new DataFormatter();
        
//        String cell2 = formatter.formatCellValue(cell);
        
        if(cell == null) {
            value = "";
        }
        else {
            if( cell.getCellType() == Cell.CELL_TYPE_FORMULA ) { //수식
                value = cell.getCellFormula();
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_NUMERIC ) { //숫자
            	BigDecimal big = new BigDecimal(cell.getNumericCellValue());
            	BigDecimal fp = big.subtract(new BigDecimal(big.longValue()));
            	if(DateUtil.isCellDateFormatted(cell)) {
            		Date date = cell.getDateCellValue();
            		value = new SimpleDateFormat("yyyy-MM-dd").format(date);
            	}
            	else if(checkDateFormat(cell)) {
            		Date date = cell.getDateCellValue();
            		value = new SimpleDateFormat("yyyy-MM-dd").format(date);
            	}
            	else if(fp.doubleValue()==0.0d) {
            		value=Long.toString(big.longValue());
            	} else {
            		value=cell.getNumericCellValue()+"";
            	}
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_STRING ) { //문자
                value = cell.getStringCellValue();
                
                String szDateOriginal = new String(value);
                value = dateReformated(szDateOriginal);
                
//                if (checkDate(szDateOriginal,"yy.MM.dd")) {
//                	value = reformatDate(szDateOriginal, "yy.MM.dd", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yy.MM")) {
//                	value = reformatDate(szDateOriginal, "yy.MM", "yyyy-MM-dd");
//                }
//                else if(checkDate(szDateOriginal, "yyyy.MM.dd")) {
//                	value = reformatDate(szDateOriginal, "yyyy.MM.dd", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yyyy.MM")) {
//                	value = reformatDate(szDateOriginal, "yyyy.MM", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yy/MM")) {
//                	value = reformatDate(szDateOriginal, "yyyy/MM", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yy/MM/dd")) {
//                	value = reformatDate(szDateOriginal, "yyyy/MM/dd", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yyyy/MM")) {
//                	value = reformatDate(szDateOriginal, "yyyy/MM", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yyyy/MM/dd")) {
//                	value = reformatDate(szDateOriginal, "yyyy/MM/dd", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yy년MM월")) {
//                	value = reformatDate(szDateOriginal, "yy년MM월", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yyyy년MM월")) {
//                	value = reformatDate(szDateOriginal, "yyyy년MM월", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yy년 MM월")) {
//                	value = reformatDate(szDateOriginal, "yy년 MM월", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yyyy년 MM월")) {
//                	value = reformatDate(szDateOriginal, "yyyy년 MM월", "yyyy-MM-dd");
//                }
//                else if (checkDate(szDateOriginal,"yy년")) {
//                	value = reformatDate(szDateOriginal, "yy년", "yyyy");
//                }
//                else if (checkDate(szDateOriginal,"yyyy년")) {
//                	value = reformatDate(szDateOriginal, "yyyy년", "yyyy");
//                }
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_BOOLEAN ) {
                value = cell.getBooleanCellValue() + "";
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_ERROR ) {
                value = cell.getErrorCellValue() + "";
            }
            else if( cell.getCellType() == Cell.CELL_TYPE_BLANK ) {
                value = "";
            }
            else {
                value = cell.getStringCellValue();
            }
        }
        
        return value;
    }
    
    public static boolean checkDateFormat(Cell cell) throws Exception{
//    	String returnValue = null;
//    	SimpleDateFormat formatter = null;
    	
    	try {
    		int formatIndex = cell.getCellStyle().getDataFormat();
    		switch(formatIndex) {
    		case 31: //excel: yyyy년 MM월 dd일
    			return true;
    		}
    	} catch (Exception e) {
    		return false;
    	}
		return false;
    }
    
    public static String reformatDate(String szVictim,String szFormatCur, String szFormatNew) {
    	String szResult = new String("");
        SimpleDateFormat oDateFormat = new SimpleDateFormat();
        Date oDate = new Date();
         
        oDateFormat.applyPattern(szFormatCur);
         
        try {
            oDate = oDateFormat.parse(szVictim);
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        oDateFormat.applyPattern(szFormatNew);
        szResult = oDateFormat.format(oDate);
 
        return szResult;
    }
    
    public static boolean checkDate(String szDate, String szFormat) {
    	
    	
    	
    	try {
    		Date origianlDate = new SimpleDateFormat(szFormat).parse(szDate);
    		szDate = new SimpleDateFormat("yyyy-MM-dd").format(origianlDate);
        	return true;
    	} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			return false;
		}
    	
    }
    
    public static String dateReformated(String szDateOriginal) {
    	String value = szDateOriginal;
    	if (checkDate(szDateOriginal,"yy.MM.dd")) {
        	value = reformatDate(szDateOriginal, "yy.MM.dd", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yy.MM")) {
        	value = reformatDate(szDateOriginal, "yy.MM", "yyyy-MM-dd");
        }
        else if(checkDate(szDateOriginal, "yyyy.MM.dd")) {
        	value = reformatDate(szDateOriginal, "yyyy.MM.dd", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yyyy.MM")) {
        	value = reformatDate(szDateOriginal, "yyyy.MM", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yy/MM")) {
        	value = reformatDate(szDateOriginal, "yyyy/MM", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yy/MM/dd")) {
        	value = reformatDate(szDateOriginal, "yyyy/MM/dd", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yyyy/MM")) {
        	value = reformatDate(szDateOriginal, "yyyy/MM", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yyyy/MM/dd")) {
        	value = reformatDate(szDateOriginal, "yyyy/MM/dd", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yy년MM월")) {
        	value = reformatDate(szDateOriginal, "yy년MM월", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yyyy년MM월")) {
        	value = reformatDate(szDateOriginal, "yyyy년MM월", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yy년 MM월")) {
        	value = reformatDate(szDateOriginal, "yy년 MM월", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yyyy년 MM월")) {
        	value = reformatDate(szDateOriginal, "yyyy년 MM월", "yyyy-MM-dd");
        }
        else if (checkDate(szDateOriginal,"yy년")) {
        	value = reformatDate(szDateOriginal, "yy년", "yyyy");
        }
        else if (checkDate(szDateOriginal,"yyyy년")) {
        	value = reformatDate(szDateOriginal, "yyyy년", "yyyy");
        }
    	return value;
    }
    
    

}
