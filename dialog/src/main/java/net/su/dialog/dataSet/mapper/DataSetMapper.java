package net.su.dialog.dataSet.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.domain.MenuRatingInfo;
import net.su.dialog.dataSet.domain.Menulist;
import net.su.dialog.main.domain.User;

@Repository("net.su.dialog.dataSet.mapper.DataSetMapper")
public interface DataSetMapper {
	//1차 카테고리
	public List<CategoryValueObject> getCategotyList() throws Exception;
	//2차
	public List<CategoryValueObject> getCategoryList(CategoryValueObject cvo) throws Exception;
//	//데이터셋 목록 카테고리 선택시 조회
//	public List<Dataset> selectCDatasetList(Dataset dvo) throws Exception;
//	
//	public List<Dataset> selectACDatasetList(Dataset dvo) throws Exception;
	//데이터셋 목록 카테고리
	public List<CategoryValueObject> selectDCategory() throws Exception;
	//메뉴 리스트
	public List<Menulist> SelectMenuList(MenuRatingInfo menuRatingInfo) throws Exception;
//	//메뉴 3뎁스 리스트
//	public List<Menulist> SelectMenuListDetail(MenuRatingInfo menuRatingInfo) throws Exception;
	//데이터 셋 리스트 조회
	public List<Dataset> selectDatasetList(Dataset dataset) throws Exception;
	
	//데이터 셋 뉴스 카테고리 리스트 조회
	public List<Dataset> selectDatasetNewsList(Dataset dataset) throws Exception;
	//데이터 셋 일시 등록 (관리자)
	public void insertDataset(Dataset dataset) throws Exception;
	//데이터 셋 정기 등록 (관리자)
	public void insertRDataset(Dataset dataset) throws Exception;
	//데이터 셋 정기tb 등록 
	public void insertDatasetRegular(Dataset dataset) throws Exception;
	//데이터 셋 등록 (사용자)
	public void insertUserDataset(Dataset dataset) throws Exception;
	//데이터 셋 일시 등록 
	public void insertDatasetNormal(Dataset dataset) throws Exception;
	//데이터 셋 일시 파일 등록
	public void insertDatasetFilelist(Dataset dataset) throws Exception;
	//데이터 셋 일시 카테고리 등록
	public void insertDatasetCategory(Dataset dataset) throws Exception;
	//나의 데이터 셋 리스트 조회
	public List<Dataset> selectMydataSetList(Dataset dataset) throws Exception;
	//정기 데이터 셋 개발 소스 조회
	public List<Dataset> selectDSource(Dataset dataset) throws Exception;
	//데이터 셋 일반(카테고리) 갯수 조회
	public int selectDataSetRowCount(Dataset dataset) throws Exception;
	//뉴스 데이터 셋 목록 갯수 조회
	public int selectDataSetNewsRowCount(Dataset dataset) throws Exception;
	//나의 데이터 셋 갯수 조회
	public int selectMyDataSetRowCount(Dataset dataset) throws Exception;
	//데이터 셋 조회수 업데이트
	public void updateDatasetViews(int dataCode) throws Exception;
	//데이터 셋 삭제 (상태 변경)
	public void deleteDataSet(int dataCode) throws Exception;
	//뉴스크롤링tb 업데이트
	public void updateNewsCrawlingDatacode(Dataset dataset) throws Exception;
	//다음뉴스 데이터셋 목록 조회
	public List<DataRequest> selectCollectRequestList() throws Exception;
}
