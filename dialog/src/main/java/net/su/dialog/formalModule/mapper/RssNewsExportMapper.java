package net.su.dialog.formalModule.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.formalModule.domain.NewsExportModule;
import net.su.dialog.formalModule.domain.RssNewsModule;

@Repository("net.su.dialog.formalModule.mapper.RssNewsExportMapper")
public interface RssNewsExportMapper {
	public List<NewsExportModule> selectRssNewsExportList() throws Exception;
	
	public List<RssNewsModule> rssNewsData(String tableNmae, String word, String startDate, String endDate) throws Exception ;
	
}
