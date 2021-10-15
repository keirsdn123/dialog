package net.su.dialog.developSource.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.developSource.domain.DevelopSource;

public interface DevelopSourceService {

	public List<DevelopSource> selectDevelopSourceList(DevelopSource developSource) throws Exception;
	public void insertDevelopSource(MultipartHttpServletRequest request, DevelopSource developSource) throws Exception;
	public DevelopSource selectDataSourceInfo(DevelopSource developSource) throws Exception;
	public void developSourceFileDownload(HttpServletResponse response ,DevelopSource developSource) throws Exception;
	public void developSourceDelete(DevelopSource developSource) throws Exception;
	public List<DevelopSource> selectDevelopSourceFileInfo(DevelopSource developSource) throws Exception;
	public List<DevelopSource> selectDevelopSourceListType(DevelopSource developSource) throws Exception;
	public DevelopSource selectReferenceSource(DevelopSource developSource) throws Exception;
	public int selectdevSourceRowCount(DevelopSource developSource) throws Exception;
	public int selectDevelopSourceTypeCount() throws Exception;
}
