package net.su.dialog.formalModule.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.domain.NewsExportModule;
import net.su.dialog.formalModule.domain.RssNewsModule;
import net.su.dialog.formalModule.mapper.DaumNewsModuleMapperImpl;
import net.su.dialog.formalModule.mapper.RssNewsExportMapper;
import net.su.dialog.formalModule.mapper.RssNewsExportMapperImpl;
import net.su.dialog.formalModule.mapper.RssNewsModuleMapper;

@Service
public class RssNewsExportService {
	@Resource(name = "net.su.dialog.formalModule.mapper.RssNewsExportMapper")
	private RssNewsExportMapper rssNewsExportMapper;

	public List<NewsExportModule> selectRssNewsExportList() throws Exception {
		rssNewsExportMapper = new RssNewsExportMapperImpl();
		return rssNewsExportMapper.selectRssNewsExportList();
	}
	
	public List<RssNewsModule> rssNewsData(String tableNmae, String word, String startDate, String endDate) throws Exception {
		rssNewsExportMapper = new RssNewsExportMapperImpl();
		return rssNewsExportMapper.rssNewsData(tableNmae, word, startDate, endDate);
	}
	
	
}
