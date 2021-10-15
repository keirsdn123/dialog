package net.su.dialog.dataSet.domain;

import java.util.ArrayList;
import java.util.List;

public class DataSetVo {

	

// 수진vo
	// 일시 생성DB
	private int dataCode;
	private String dbDataName;
	private String columnName;
	private String dataType;
	private String colNme;
	private String vizRequests;

	// 일시 표준 리스트
	private int pauseStandarSeq;	//시각화 코드
	private String pauseStandarColumn1;
	private String pauseStandarColumn1Lable;
	private String pauseStandarColumn2;
	private String pauseStandarColumn2Lable;
	private String pauseStandarColumn3;
	private String pauseStandarColumn3Lable;
	private String pauseStandarColumn4;
	private String pauseStandarColumn4Lable;
	private String pauseStandarColumn5;
	private String pauseStandarColumn5Lable;
	private String pauseStandarColumn6;
	private String pauseStandarColumn7;
	private String pauseStandarColumn8;
	private String pauseStandarColumn9;
	private String pauseStandarColumn10;

	// 일시 표준 상세 생성DB
	private int pauseStandarDetailSeq;
	private double pauseStandarColumn1d;
	private double pauseStandarColumn2d;
	private double pauseStandarColumn3d;
	private double pauseStandarColumn4d;
	private double pauseStandarColumn5d;
	private String pauseStandarColumn6d;
	private String pauseStandarColumn7d;
	private String pauseStandarColumn8d;
	private String pauseStandarColumn9d;
	private String pauseStandarColumn10d;
	
	

	private String processList;			//가공 후 추가 선택 컬럼 조회
	
	//표준화데이터 관련
	private String stColNme;
	private String stLableNme;
	private String stDataType;
	private String stQryList;
	private String standarTbTitle;
	
	
	public int getDataCode() {
		return dataCode;
	}
	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}
	public String getDbDataName() {
		return dbDataName;
	}
	public void setDbDataName(String dbDataName) {
		this.dbDataName = dbDataName;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getColNme() {
		return colNme;
	}
	public void setColNme(String colNme) {
		this.colNme = colNme;
	}
	public String getVizRequests() {
		return vizRequests;
	}
	public void setVizRequests(String vizRequests) {
		this.vizRequests = vizRequests;
	}
	public int getPauseStandarSeq() {
		return pauseStandarSeq;
	}
	public void setPauseStandarSeq(int pauseStandarSeq) {
		this.pauseStandarSeq = pauseStandarSeq;
	}
	public String getPauseStandarColumn1() {
		return pauseStandarColumn1;
	}
	public void setPauseStandarColumn1(String pauseStandarColumn1) {
		this.pauseStandarColumn1 = pauseStandarColumn1;
	}
	public String getPauseStandarColumn1Lable() {
		return pauseStandarColumn1Lable;
	}
	public void setPauseStandarColumn1Lable(String pauseStandarColumn1Lable) {
		this.pauseStandarColumn1Lable = pauseStandarColumn1Lable;
	}
	public String getPauseStandarColumn2() {
		return pauseStandarColumn2;
	}
	public void setPauseStandarColumn2(String pauseStandarColumn2) {
		this.pauseStandarColumn2 = pauseStandarColumn2;
	}
	public String getPauseStandarColumn2Lable() {
		return pauseStandarColumn2Lable;
	}
	public void setPauseStandarColumn2Lable(String pauseStandarColumn2Lable) {
		this.pauseStandarColumn2Lable = pauseStandarColumn2Lable;
	}
	public String getPauseStandarColumn3() {
		return pauseStandarColumn3;
	}
	public void setPauseStandarColumn3(String pauseStandarColumn3) {
		this.pauseStandarColumn3 = pauseStandarColumn3;
	}
	public String getPauseStandarColumn3Lable() {
		return pauseStandarColumn3Lable;
	}
	public void setPauseStandarColumn3Lable(String pauseStandarColumn3Lable) {
		this.pauseStandarColumn3Lable = pauseStandarColumn3Lable;
	}
	public String getPauseStandarColumn4() {
		return pauseStandarColumn4;
	}
	public void setPauseStandarColumn4(String pauseStandarColumn4) {
		this.pauseStandarColumn4 = pauseStandarColumn4;
	}
	public String getPauseStandarColumn4Lable() {
		return pauseStandarColumn4Lable;
	}
	public void setPauseStandarColumn4Lable(String pauseStandarColumn4Lable) {
		this.pauseStandarColumn4Lable = pauseStandarColumn4Lable;
	}
	public String getPauseStandarColumn5() {
		return pauseStandarColumn5;
	}
	public void setPauseStandarColumn5(String pauseStandarColumn5) {
		this.pauseStandarColumn5 = pauseStandarColumn5;
	}
	public String getPauseStandarColumn5Lable() {
		return pauseStandarColumn5Lable;
	}
	public void setPauseStandarColumn5Lable(String pauseStandarColumn5Lable) {
		this.pauseStandarColumn5Lable = pauseStandarColumn5Lable;
	}
	public String getPauseStandarColumn6() {
		return pauseStandarColumn6;
	}
	public void setPauseStandarColumn6(String pauseStandarColumn6) {
		this.pauseStandarColumn6 = pauseStandarColumn6;
	}
	public String getPauseStandarColumn7() {
		return pauseStandarColumn7;
	}
	public void setPauseStandarColumn7(String pauseStandarColumn7) {
		this.pauseStandarColumn7 = pauseStandarColumn7;
	}
	public String getPauseStandarColumn8() {
		return pauseStandarColumn8;
	}
	public void setPauseStandarColumn8(String pauseStandarColumn8) {
		this.pauseStandarColumn8 = pauseStandarColumn8;
	}
	public String getPauseStandarColumn9() {
		return pauseStandarColumn9;
	}
	public void setPauseStandarColumn9(String pauseStandarColumn9) {
		this.pauseStandarColumn9 = pauseStandarColumn9;
	}
	public String getPauseStandarColumn10() {
		return pauseStandarColumn10;
	}
	public void setPauseStandarColumn10(String pauseStandarColumn10) {
		this.pauseStandarColumn10 = pauseStandarColumn10;
	}
	public int getPauseStandarDetailSeq() {
		return pauseStandarDetailSeq;
	}
	public void setPauseStandarDetailSeq(int pauseStandarDetailSeq) {
		this.pauseStandarDetailSeq = pauseStandarDetailSeq;
	}
	public double getPauseStandarColumn1d() {
		return pauseStandarColumn1d;
	}
	public void setPauseStandarColumn1d(double pauseStandarColumn1d) {
		this.pauseStandarColumn1d = pauseStandarColumn1d;
	}
	public double getPauseStandarColumn2d() {
		return pauseStandarColumn2d;
	}
	public void setPauseStandarColumn2d(double pauseStandarColumn2d) {
		this.pauseStandarColumn2d = pauseStandarColumn2d;
	}
	public double getPauseStandarColumn3d() {
		return pauseStandarColumn3d;
	}
	public void setPauseStandarColumn3d(double pauseStandarColumn3d) {
		this.pauseStandarColumn3d = pauseStandarColumn3d;
	}
	public double getPauseStandarColumn4d() {
		return pauseStandarColumn4d;
	}
	public void setPauseStandarColumn4d(double pauseStandarColumn4d) {
		this.pauseStandarColumn4d = pauseStandarColumn4d;
	}
	public double getPauseStandarColumn5d() {
		return pauseStandarColumn5d;
	}
	public void setPauseStandarColumn5d(double pauseStandarColumn5d) {
		this.pauseStandarColumn5d = pauseStandarColumn5d;
	}
	public String getPauseStandarColumn6d() {
		return pauseStandarColumn6d;
	}
	public void setPauseStandarColumn6d(String pauseStandarColumn6d) {
		this.pauseStandarColumn6d = pauseStandarColumn6d;
	}
	public String getPauseStandarColumn7d() {
		return pauseStandarColumn7d;
	}
	public void setPauseStandarColumn7d(String pauseStandarColumn7d) {
		this.pauseStandarColumn7d = pauseStandarColumn7d;
	}
	public String getPauseStandarColumn8d() {
		return pauseStandarColumn8d;
	}
	public void setPauseStandarColumn8d(String pauseStandarColumn8d) {
		this.pauseStandarColumn8d = pauseStandarColumn8d;
	}
	public String getPauseStandarColumn9d() {
		return pauseStandarColumn9d;
	}
	public void setPauseStandarColumn9d(String pauseStandarColumn9d) {
		this.pauseStandarColumn9d = pauseStandarColumn9d;
	}
	public String getPauseStandarColumn10d() {
		return pauseStandarColumn10d;
	}
	public void setPauseStandarColumn10d(String pauseStandarColumn10d) {
		this.pauseStandarColumn10d = pauseStandarColumn10d;
	}
	public String getProcessList() {
		return processList;
	}
	public void setProcessList(String processList) {
		this.processList = processList;
	}
	public String getStColNme() {
		return stColNme;
	}
	public void setStColNme(String stColNme) {
		this.stColNme = stColNme;
	}
	public String getStLableNme() {
		return stLableNme;
	}
	public void setStLableNme(String stLableNme) {
		this.stLableNme = stLableNme;
	}
	public String getStDataType() {
		return stDataType;
	}
	public void setStDataType(String stDataType) {
		this.stDataType = stDataType;
	}
	public String getStQryList() {
		return stQryList;
	}
	public void setStQryList(String stQryList) {
		this.stQryList = stQryList;
	}
	public String getStandarTbTitle() {
		return standarTbTitle;
	}
	public void setStandarTbTitle(String standarTbTitle) {
		this.standarTbTitle = standarTbTitle;
	}
}
