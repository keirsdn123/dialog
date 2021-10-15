package net.su.dialog.dataSet.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.service.DataSetListViewService;
import net.su.dialog.report.domain.ReportDomain;
import net.su.dialog.dataSet.domain.DataSetListViewVo;

//@ResponseBody 안써도됨
//Ajax만

@RestController
public class DataSetListViewController {

	@Autowired
    private DataSetListViewService	dataSetListViewService;
	
	//데이터목록 -> 데이터상세조회
		@RequestMapping("/selectDataListView")
		public Map<String,Object> selectDataListView(DataSetListViewVo dataSetListViewVo) throws Exception {
			return dataSetListViewService.selectDataListView(dataSetListViewVo);
		}
	//데이터상세조회 -> 파일 다운로드
		@RequestMapping("/selectDFileDownload")
		public void selectDFileDownload(HttpServletResponse response, DataSetListViewVo dataSetListViewVo) throws Exception{
			System.out.println("데이터셋  상세조회 - 파일 다운로드 컨트롤러");
			dataSetListViewService.selectDFileDownload(response, dataSetListViewVo);
		}
	
}
