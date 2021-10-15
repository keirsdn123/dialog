package net.su.dialog.report.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataSetListViewVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.PagingVo;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.report.domain.ReportDomain;

@Repository("net.su.dialog.report.mapper.ReportMapper")
public interface ReportMapper {
	
	public List<Dataset> selectDataList(Dataset dvo) throws Exception;
	
	public List<Dataset> selectJDataList(Dataset dvo) throws Exception;
	
	public List<CategoryValueObject> selectUCategoryList(CategoryValueObject cvo) throws Exception;
	
	public List<CategoryValueObject> selectUSecCategoryList(CategoryValueObject cvo) throws Exception;
	
	public List<CategoryValueObject> selectCategory(CategoryValueObject cvo) throws Exception;
	//멤버코드레이팅 비교
	//public List<Dataset> selectMemberRating(Dataset dvo) throws Exception;
	
	public List<CategoryValueObject> selectJCategory(CategoryValueObject cvo) throws Exception;
	//보고서 목록 카테고리
	public List<ReportDomain> selectReportCate(ReportDomain rvo) throws Exception;
	//보고서 목록 카테고리 (정회원, 관리자)
	public List<ReportDomain> selectReportCate2(ReportDomain rvo) throws Exception;
		
	public List<CategoryValueObject> selectDataCate(CategoryValueObject cvo) throws Exception;
	
	public List<CategoryValueObject> selectDataCate2() throws Exception;
	
	public List<Dataset> selectDataSetBox(Dataset dvo) throws Exception;
	
	public List<Dataset> selectUDataSetBox(Dataset dvo) throws Exception;
		
	public void insertReport(ReportDomain report) throws Exception;

	public void insertReportDataset(ReportDomain report) throws Exception;

	public void insertReportFile(ReportDomain report) throws Exception;

	public void insertReportCategory(ReportDomain report) throws Exception;
	
	public void updateReport(ReportDomain report) throws Exception;
	
	public void updateReportFile(ReportDomain report) throws Exception;
	
	public void deleteCateList(ReportDomain report) throws Exception;
	
	public void deleteDatasetList(ReportDomain report) throws Exception;
	
	public void inVisibleReport(ReportDomain report) throws Exception;
	
	public List<Dataset> selectFileType1() throws Exception;
	
	public List<Dataset> selectFileType2() throws Exception;
	
	public List<Dataset> selectMyFile(Dataset dvo) throws Exception;
	
	public List<Dataset> selectDtSearchDataSet(Dataset dvo) throws Exception;
	
	public List<Dataset> selectPDtSearchDataSet(Dataset dvo) throws Exception;
	
	public List<ReportDomain> selectDtSearchReportSet(ReportDomain rvo) throws Exception;
	
	public List<ReportDomain> selectPDtSearchReportSet(ReportDomain rvo) throws Exception;
	
	public List<ReportDomain> selectReportList(ReportDomain rvo) throws Exception;
	
	public int selectReportDataRowCount(ReportDomain rvo) throws Exception;
	
	public List<ReportDomain> selectMyReportList(ReportDomain rvo) throws Exception;
	
	public List<ReportDomain> selectTypePaper(ReportDomain report)throws Exception;
	
	public List<ReportDomain> selectOriginFileNme(ReportDomain report)throws Exception;
	
	public List<Authority> selectRatingList() throws Exception;
	
	public ReportDomain selectReportView(ReportDomain report) throws Exception;
	//보고서 수정부분의 미리작성한 글 불러오기
	public ReportDomain selectReportInfo(ReportDomain report) throws Exception;
	
	public List<ReportDomain> selectReportViewCate(ReportDomain report) throws Exception;
	
	public List<Dataset> selectReferenceDataSetList(Dataset dvo) throws Exception;
	
	public void updateReportViews(int reportCode) throws Exception;
	//내가 등록한 보고서 전체 갯수
	public int selectMyReportRowCount(ReportDomain report) throws Exception;
	
	public String selectDatasetType(int dataCode) throws Exception;
		
}
