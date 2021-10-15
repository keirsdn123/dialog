package net.su.dialog.main.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.report.domain.ReportDomain;

@Repository("net.su.dialog.main.mapper.MainMapperPea")
public interface MainMapperPea {

	public List<Dataset> selectBestDataList(Dataset dataset) throws Exception;
	
	public List<ReportDomain> selectBestReportList(ReportDomain reportDomain) throws Exception;
	
	public int datasetCount() throws Exception;
	
	public int reportCount() throws Exception;
	
	public int vizCount() throws Exception;
	
}
