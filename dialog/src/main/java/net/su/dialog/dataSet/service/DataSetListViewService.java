package net.su.dialog.dataSet.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.su.dialog.dataSet.domain.DataSetListViewVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;

public interface DataSetListViewService {

	public Map<String,Object> selectDataListView(DataSetListViewVo dataSetListViewVo) throws Exception;
	
	public void selectDFileDownload(HttpServletResponse response , DataSetListViewVo dataSetListViewVo) throws Exception;
}
