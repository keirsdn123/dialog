package net.su.dialog.schedule.domain;

public class DataExportVo {
	private int scheCode;	//스케줄 코드
	private int dataExportManagementCode; //데이터 반출 관리 요청 seq
	
	public int getScheCode() {
		return scheCode;
	}
	public int getDataExportManagementCode() {
		return dataExportManagementCode;
	}
	public void setDataExportManagementCode(int dataExportManagementCode) {
		this.dataExportManagementCode = dataExportManagementCode;
	}
	public void setScheCode(int scheCode) {
		this.scheCode = scheCode;
	}
	
	
}
