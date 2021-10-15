package net.su.dialog.dataSet.service.impl;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.dataSet.domain.DataSetListViewVo;
import net.su.dialog.dataSet.excelFileRead.excelCellRef;
import net.su.dialog.dataSet.excelFileRead.excelFileType;
import net.su.dialog.dataSet.excelFileRead.excelReadOption;
import net.su.dialog.dataSet.mapper.DataSetListViewMapper;
import net.su.dialog.dataSet.service.DataSetListViewService;
import net.su.dialog.report.domain.ReportDomain;


@Service
public class DataSetListViewServiceImpl implements DataSetListViewService {
	
	@Resource(name="net.su.dialog.dataSet.mapper.DataSetListViewMapper")
    private DataSetListViewMapper datasetListViewMapper;
	
	
	public Map<String,Object> selectDataListView(DataSetListViewVo dataSetListViewVo) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		DataSetListViewVo detailDataInfos = datasetListViewMapper.selectDataListView(dataSetListViewVo);
		
		List<DataSetListViewVo> dataCateInfos = datasetListViewMapper.selectDataListViewCate(dataSetListViewVo);
		List<String> dataCateInfo = new ArrayList<String>();
		/*카테고리 화면에 보기 좋게 나열하기 위해 배열로 재 정렬*/
		if(dataCateInfos.get(0).getCateTitle2() != null) {
			dataCateInfo.add(dataCateInfos.get(0).getCateTitle1()+" > ");
			for(int i=0; i<dataCateInfos.size()-1; i++) {
				dataCateInfo.add(dataCateInfos.get(i).getCateTitle2()+", ");
			}
			dataCateInfo.add(dataCateInfos.get(dataCateInfos.size()-1).getCateTitle2());
		}
		else {
			dataCateInfo.add(dataCateInfos.get(0).getCateTitle1());
		}
		map.put("dataDetailInfos", detailDataInfos);
		map.put("dataCategoryInfos", dataCateInfo);
		return map;
	}
	
	//데이터셋 -> 파일 다운로드
	public void selectDFileDownload(HttpServletResponse response, DataSetListViewVo dataSetListViewVo) throws Exception {

		byte fileByte[] = FileUtils.readFileToByteArray(new File(dataSetListViewVo.getFilePath()));
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(dataSetListViewVo.getFileOriginalName(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}	

}
