package net.su.dialog.formalModule.service;

import java.util.List;


import net.su.dialog.formalModule.domain.DaumNewsData;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.mapper.DaumNewsExportMapperImpl;

public class DaumNewsExportService {
	private DaumNewsExportMapperImpl daumNewsExportMapperImpl = new DaumNewsExportMapperImpl();;
	
	public List<DaumNewsModule> selectDaumNewsExportList() throws Exception{
		return daumNewsExportMapperImpl.selectDaumNewsExportList();
	}
	
	public List<DaumNewsData> daumNewsData(String tableName)throws Exception{
		return daumNewsExportMapperImpl.daumNewsData(tableName);
	}
	
	public void insertDataExportFile(String filePath, String fileName, int scheCode) throws Exception{
		daumNewsExportMapperImpl.insertDataExportFile(filePath, fileName, scheCode);
	}
	
	public void updateExportRequestStatus(int dataExportRequestCode, int scheCode) throws Exception {
		daumNewsExportMapperImpl.updateExportRequestStatus(dataExportRequestCode, scheCode);
	}
}
