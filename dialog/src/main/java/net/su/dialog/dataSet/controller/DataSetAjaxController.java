package net.su.dialog.dataSet.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.domain.Menulist;
import net.su.dialog.main.domain.User;
import net.su.dialog.dataSet.service.DataSetService;

//@ResponseBody 안써도됨
//Ajax만
@RestController
public class DataSetAjaxController {

	@Autowired
	private DataSetService datasetService;

	// 카테고리 조회
	@RequestMapping("/getCategotyList")
	public List<CategoryValueObject> getCategotyList() throws Exception {
		System.out.println("카테고리 리스트 불러오기");
		return datasetService.getCategotyList();
	}

	// 2차 카테고리 조회
	@RequestMapping(value = "/getCategoryList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<CategoryValueObject> getCategoryList(@RequestParam int inputseq) throws Exception {
		CategoryValueObject cvo = new CategoryValueObject();
		cvo.setCategorySeq(inputseq);
		System.out.println("카테고리 리스트 불러오기" + inputseq);
		System.out.println("카테고리 리스트 불러오기" + inputseq);
		return datasetService.getCategoryList(cvo);
	}

	// 데이터 셋 목록 조회
	@RequestMapping("/selectDatasetList")
	public Map<String, Object> selectDatasetList(HttpSession session, Dataset dataset) throws Exception {
		System.out.println("데이터셋 리스트 불러오기");
		System.out.println("getDataSetSearchType = " + dataset.getDataSetSearchType());
		System.out.println("dataset.getDataSetSearchWrd() = " + dataset.getDataSetSearchWrd());
		return datasetService.selectDatasetList(session, dataset);
	}

	// 데이터셋 목록 카테고리
	@RequestMapping("/selectDCategory")
	public List<CategoryValueObject> selectDCategory() throws Exception {
		System.out.println("데이터셋 목록 카테고리 리스트 불러오기");
		return datasetService.selectDCategory();
	}

	// //카테고리 선택시 조회
	// @RequestMapping("/selectDatasetCate")
	// public List<Dataset> selectCDatasetList(Dataset dvo) throws Exception {
	// System.out.println(dvo.getCategorySeq());
	// System.out.println("카테고리 리스트 불러오기");
	// return datasetService.selectCDatasetList(dvo);
	// }
	// 데이터 셋 (뉴스 카테고리) 목록 조회
	@RequestMapping("/selectDatasetNewsList")
	public Map<String, Object> selectDatasetNewsList(HttpSession session, Dataset dataset) throws Exception {
		System.out.println("데이터셋 뉴스 카테고리 리스트 불러오기");
		return datasetService.selectDatasetNewsList(session, dataset);
	}

	// 데이터 셋 일시 등록(관리자)
	@RequestMapping("/insertDataset")
	public String insertDataset(MultipartHttpServletRequest request, Dataset dataset, HttpSession session)throws Exception {
		System.out.println("데이터셋 등록");
		System.out.println("데이터셋 등록" + dataset.getCateList().length + "카테고리 리스트 가져오나 0이면 ㅗ딘다 ");
		datasetService.insertDataset(request, dataset, session);
		return "등록이 완료되었습니다";
	}

	// 데이터 셋 (사용자) 등록
	@RequestMapping("/insertUserDataset")
	public String insertUserDataset(MultipartHttpServletRequest request, Dataset dataset, HttpSession session)throws Exception {
		System.out.println("데이터셋 등록");
		datasetService.insertUserDataset(request, dataset, session);
		return "등록이 완료되었습니다";
	}

	// 메뉴 조회
	@RequestMapping("/SelectMenuList")
	public List<Menulist> SelectMenuList(HttpSession session) throws Exception {
		System.out.println("메뉴 리스트 불러오기");
		return datasetService.SelectMenuList(session);
	}

	// 나의 데이터 > 내가 등록한 데이터 조회
	@RequestMapping("/selectMydataSetList")
	public Map<String, Object> selectMydataSetList(HttpSession session, Dataset dataset) throws Exception {
		System.out.println("나의 데이터셋 리스트 불러오기");
		return datasetService.selectMydataSetList(session, dataset);
	}

	// 엑셀 파일 유효성 체크
	@RequestMapping("/dataSetFileCheck")
	public int dataSetFileCheck(MultipartHttpServletRequest request) throws Exception {
		System.out.println("파일 유효성 체크");
		return datasetService.dataSetFileCheck(request);
	}

	// 정기 데이터 셋 개발 소스 조회
	@RequestMapping("/selectDSource")
	public List<Dataset> selectDSource(Dataset dataset) throws Exception {
		return datasetService.selectDSource(dataset);
	}

	// 다음 뉴스 수집 요청 목록조회 (재훈)
	@RequestMapping("/selectCollectRequestList")
	public List<DataRequest> selectCollectRequestList() throws Exception {
		System.out.println("도는지 체크 ");
		return datasetService.selectCollectRequestList();
	}

	// 데이터 셋 삭제(상태 변경)
	@RequestMapping("/deleteDataSet")
	public void deleteDataSet(int dataCode) throws Exception {
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%dataCode= " + dataCode);
		datasetService.deleteDataSet(dataCode);
	}

	// //데이터 셋 정기 등록(관리자)
	@RequestMapping("/insertRegularDataset")
	public void insertRegularDataset(Dataset dataset, HttpSession session) throws Exception {
		System.out.println("정기데이터셋 등록");
		if (dataset.getDataSetType().equals("daumNews")) {
			System.out.println(dataset.getCateList().length);
			datasetService.insertRegularDaumNewsDataSet(dataset, session);
		}
	}
}
