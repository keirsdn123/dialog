package net.su.dialog.report.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.report.mapper.ReportMapper;
import net.su.dialog.report.service.ReportService;
import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataSetListViewVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.PagingVo;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.report.domain.ReportDomain;

@Service
public class ReportServiceImpl implements ReportService{
	
	
	@Resource(name="net.su.dialog.report.mapper.ReportMapper")
	private ReportMapper reportMapper;
	
	public List<Dataset> selectDataList(HttpSession session) throws Exception{
		System.out.println("데이터셋 리스트 불러오기");
		Dataset dvo = new Dataset();
		User userInfo = new User();
		if(session.getAttribute("memInfo") == null) {
			userInfo.setMemberRatingCode(0);
		} else if (session.getAttribute("memInfo")!=null) {
			userInfo = (User) session.getAttribute("memInfo");
			dvo.setMemberRatingCode(userInfo.getMemberRatingCode());
			if(dvo.getMemberRatingCode() == 1) {
				return reportMapper.selectJDataList(dvo);
			} 	
		}
		return reportMapper.selectDataList(dvo);
	}
	//카테고리조회
	public List<CategoryValueObject> selectCategory(HttpSession session) throws Exception{
		System.out.println("보고서 리스트 불러오기");
		User userInfo = new User();
		CategoryValueObject cvo = new CategoryValueObject();
		if(session.getAttribute("memInfo")==null) {
			userInfo.setMemberRatingCode(0);			
		} else if(session.getAttribute("memInfo")!=null) {	
			userInfo = (User) session.getAttribute("memInfo");
			cvo.setMemberRatingCode(userInfo.getMemberRatingCode());
			if(cvo.getMemberRatingCode() == 2 || cvo.getMemberRatingCode() ==  3) {
				return reportMapper.selectJCategory(cvo);
			}
		} else {
			userInfo = (User) session.getAttribute("memInfo");
			cvo.setMemberRatingCode(userInfo.getMemberRatingCode());			
		}
		return reportMapper.selectCategory(cvo);
	}
	//수정: 1차 카테고리
	public List<CategoryValueObject> selectUCategoryList(CategoryValueObject cvo) throws Exception{
		System.out.println();
		return reportMapper.selectUCategoryList(cvo);
	}
	//수정 : 2차 카테고리
	public List<CategoryValueObject> selectUSecCategoryList(CategoryValueObject cvo) throws Exception{
		System.out.println();
		return reportMapper.selectUSecCategoryList(cvo);
	}
	//멤버 레이팅 체크
//	public List<Dataset> selectMemberRating(HttpSession session, Dataset dvo) throws Exception{
//		User userInfo = new User();
//		userInfo = (User) session.getAttribute("memInfo");
//		dvo.setMemberRatingCode(userInfo.getMemberRatingCode());
//		return reportMapper.selectMemberRating(dvo);
//	}
	//보고서 목록 조회
	public List<ReportDomain> selectReportList(ReportDomain rvo, HttpSession session) throws Exception{
		
		System.out.println("보고서 리스트 불러오기");
		User userInfo = new User();
		if(session.getAttribute("memInfo")==null) {
			userInfo.setMemberRatingCode(0);
		}else {
			userInfo = (User) session.getAttribute("memInfo");
			rvo.setMemberRatingCode(userInfo.getMemberRatingCode());
		}
		return reportMapper.selectReportList(rvo);
	}
	
	public int selectReportDataRowCount(HttpSession session, ReportDomain rvo) throws Exception{
		User userInfo = new User();
		if(session.getAttribute("memInfo")==null) {
			userInfo.setMemberRatingCode(0);
			rvo.setMemberRatingCode(userInfo.getMemberRatingCode());		
			reportMapper.selectReportDataRowCount(rvo);
		} else 
			userInfo = (User) session.getAttribute("memInfo");		
		    rvo.setMemberRatingCode(userInfo.getMemberRatingCode());			
		return reportMapper.selectReportDataRowCount(rvo);
	}
	//나의 data > 보고서 목록 조회
	public Map<String, Object> selectMyReportList(HttpSession session,ReportDomain report) throws Exception{
		
		System.out.println("나의 데이터 보고서 리스트 불러오기");
		User userInfo = new User();
		
		userInfo = (User) session.getAttribute("memInfo");
		report.setMemberCode(userInfo.getMemberCode());
		
		int MyReportRecords = reportMapper.selectMyReportRowCount(report);
		List<ReportDomain> selectMyReportList = reportMapper.selectMyReportList(report);
		Map<String, Object> MyReportListMap = new HashMap<String, Object>();
		MyReportListMap.put("selectMyReportList", selectMyReportList);
		MyReportListMap.put("MyReportRecords", MyReportRecords);
		
		return MyReportListMap;
	}
	//카테고리별 보고서 조회
	public List<ReportDomain> selectReportCate(ReportDomain rvo, HttpSession session) throws Exception{
		if(rvo.getCategorySeq() == 0) {
			
			User userInfo = new User();
			if(session.getAttribute("memInfo")==null) {
				userInfo.setMemberRatingCode(0);
				rvo.setMemberRatingCode(userInfo.getMemberRatingCode());
				List<ReportDomain> selectReportCate = reportMapper.selectReportCate2(rvo);
				return selectReportCate;
			}else 				
			userInfo = (User) session.getAttribute("memInfo");		
			rvo.setMemberRatingCode(userInfo.getMemberRatingCode());	
			List<ReportDomain> selectReportCate = reportMapper.selectReportCate2(rvo);
			return selectReportCate;
		}  
			User userInfo = new User();
			if(session.getAttribute("memInfo")==null) {
				userInfo.setMemberRatingCode(0);
				rvo.setMemberRatingCode(userInfo.getMemberRatingCode());
				List<ReportDomain> selectReportCate = reportMapper.selectReportCate(rvo);
				return selectReportCate;
			}			
			userInfo = (User) session.getAttribute("memInfo");
			rvo.setMemberRatingCode(userInfo.getMemberRatingCode());
		List<ReportDomain> selectReportCate = reportMapper.selectReportCate(rvo);
			return selectReportCate;
	}
	
	//팝업창 카테고리별 데이터셋 조회
	public List<CategoryValueObject> selectDataCate(CategoryValueObject cvo) throws Exception{
		if(cvo.getCategorySeq() == 0) {
		List<CategoryValueObject> selectDataCate = reportMapper.selectDataCate2();
			return selectDataCate;
		} 
		List<CategoryValueObject> selectDataCate = reportMapper.selectDataCate(cvo);
			return selectDataCate;
	}
	//데이터셋 제목 클릭시 보고서의 데이터셋 참조에 값이 넘어간다.
	public List<Dataset> selectDataSetBox(Dataset dvo) throws Exception{
		ReportDomain rvo = new ReportDomain();
		return reportMapper.selectDataSetBox(dvo);
	}
	//보고서 수정시 참조 데이터 불러오기
	public List<Dataset> selectUDataSetBox(Dataset dvo) throws Exception{		
		return reportMapper.selectUDataSetBox(dvo);
	}
	//보고서 수정 (일반보고서 / 논문)
	public List<ReportDomain> selectTypePaper(ReportDomain report) throws Exception{
		return reportMapper.selectTypePaper(report);
	}
	//보고서 수정(파일 불러오기)
	public List<ReportDomain> selectOriginFileNme(ReportDomain report) throws Exception{
		return reportMapper.selectOriginFileNme(report);
	}
	//일시데이터 클릭
	public List<Dataset> selectFileType1() throws Exception{		
		return reportMapper.selectFileType1();
	}
	//정기적데이터 클릭
	public List<Dataset> selectFileType2() throws Exception{		
		return reportMapper.selectFileType2();
	}
	//나만의 데이터 클릭
	public List<Dataset> selectMyFile(Dataset dvo, HttpSession session) throws Exception{
		User userInfo = (User) session.getAttribute("memInfo");
		dvo.setMemberCode(userInfo.getMemberCode());
		System.out.println("sdfsdaf"+dvo.getMemberCode());
		List<Dataset> myData = reportMapper.selectMyFile(dvo);
		return myData;
	}
	//팝업창 데이터셋 검색
	public List<Dataset> selectDtSearchDataSet(Dataset dvo) throws Exception {		
		if(dvo.getMemberRatingCode() == 1) {
			System.out.println("검색시 맴버레이팅코드 팡팡팡"+dvo.getMemberRatingCode());
			return reportMapper.selectPDtSearchDataSet(dvo);
		}  if(dvo.getMemberRatingCode()== 2 || dvo.getMemberRatingCode() == 3)
			System.out.println("검색시 맴버레이팅코드dddd 팡팡팡"+dvo.getMemberRatingCode());
			return reportMapper.selectDtSearchDataSet (dvo);		
	}
	//검색
	public List<ReportDomain> selectDtSearchReportSet(ReportDomain rvo) throws Exception {		
		if(rvo.getMemberRatingCode() == 1) {
			System.out.println("검색시 맴버레이팅코드 팡팡팡"+rvo.getMemberRatingCode());
			return reportMapper.selectDtSearchReportSet(rvo);			
		}
		if(rvo.getMemberRatingCode() == 0) {
			System.out.println("검색시 맴버레이팅코드 손님 팡팡팡"+rvo.getMemberRatingCode());
			return reportMapper.selectDtSearchReportSet(rvo);	
		}
		if(rvo.getMemberRatingCode()== 2 || rvo.getMemberRatingCode() == 3)
			System.out.println("검색시 맴버레이팅코드dddd 팡팡팡"+rvo.getMemberRatingCode());
			return reportMapper.selectPDtSearchReportSet (rvo);		
	}
	//권한 조회
	public List<Authority> selectRatingList() throws Exception{
		System.out.println("권한 조회");
		return reportMapper.selectRatingList();
	}
	
	//보고서 셋 등록
		public void insertReport(MultipartHttpServletRequest request, ReportDomain report, HttpSession session) throws Exception {
			
			User userInfo = (User) session.getAttribute("memInfo");
			report.setMemberCode(userInfo.getMemberCode());
			System.out.println("asdfsadfasdfsadfsadf"+request.getSession().getServletContext().getRealPath("/"));
			try {
				MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
				Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
				MultipartFile multipartFile = null;
				String originalFileName = null;
				String originalFileExtension = null;
				String storedFileName="";
				String fileName="";
				String filePath = request.getSession().getServletContext().getRealPath("/");
				filePath = filePath.substring(0, filePath.indexOf("webapp"));
				filePath += "resources/static/uploadFiles/reportFile/";  //resource경로 만들기
				File dir = new File(filePath);
				if(!dir.isDirectory()) { //해당 경로의 폴더가 없다면 폴더를 생성
					dir.mkdirs();
				}
				while (iterator.hasNext()) {
					fileName = iterator.next();
					System.out.println("fileName : " + fileName);
					multipartFile = multipartHttpServletRequest.getFile(fileName);
					System.out.println("비었냐?? : " + multipartFile.isEmpty());
					if (multipartFile.isEmpty() == false) {//파일의 내용이 있는지 없는지 체크 빈 파일을 업로드할거면 없어도 됨
						originalFileName = multipartFile.getOriginalFilename();
						originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					//	long fileSize =multipartFile.getSize();
						
						System.out.println("원본 파일이름 : " + originalFileName);
						System.out.println("원본 파일 확장자 명 : " + originalFileExtension);
						System.out.println("파일 사이즈 : "  + multipartFile.getSize());
						Random rnd = new Random();
						for (int i = 0; i < 15; i++) { //15자리 랜덤 파일명 생성
							int rIndex = rnd.nextInt(3);
							switch (rIndex) {
							case 0:
								// a-z
								storedFileName += (char) ((int) (rnd.nextInt(26)) + 97);
								break;
							case 1:
								// A-Z
								storedFileName += (char) ((int) (rnd.nextInt(26)) + 65);
								break;
							case 2:
								// 0-9
								storedFileName += rnd.nextInt(10);
								break;
							}
						}
						
						storedFileName += originalFileExtension;
						File file = new File(filePath+ storedFileName);
						multipartFile.transferTo(file);
						report.setOriginFileTitle(originalFileName);
						report.setFileTitle(storedFileName);
						report.setFileRoute(file.getPath());
						

						System.out.println("데이터코드SEQ: "  + report.getDataCodeList());
						reportMapper.insertReport(report); // 보고서 등록		
						reportMapper.insertReportFile(report); // 보고서  파일 등록
						int dataCodeList[] = report.getDataCodeList();
						for(int i = 0; i<dataCodeList.length; i++) {
							int dataCode = dataCodeList[i];
							report.setDataCode(dataCode);
							reportMapper.insertReportDataset(report); //보고서 데이터셋
						}	
							
						int cateList[] = report.getCateList();
						for(int i=0; i<cateList.length; i++){
							int cateCode2 = cateList[i];
							report.setCateCode2(cateCode2);
							reportMapper.insertReportCategory(report); //보고 카테고리 등록
					    }
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//보고서 수정
		public void updateReport(MultipartHttpServletRequest request, ReportDomain report, HttpSession session) throws Exception {
		
		User userInfo = (User) session.getAttribute("memInfo");
		System.out.println();
		report.setMemberCode(userInfo.getMemberCode());
		reportMapper.deleteCateList(report);
		reportMapper.deleteDatasetList(report);
		System.out.println("수정수정수정수정"+request.getSession().getServletContext().getRealPath("/"));	
			try {
				MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
				Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
				MultipartFile multipartFile = null;
				String originalFileName = null;
				String originalFileExtension = null;
				String storedFileName="";
				String fileName="";
				String filePath = request.getSession().getServletContext().getRealPath("/");
				filePath = filePath.substring(0, filePath.indexOf("webapp"));
				filePath += "resources/static/uploadFiles/reportFile/";  //resource경로 만들기
				File dir = new File(filePath);
				if(!dir.isDirectory()) { //해당 경로의 폴더가 없다면 폴더를 생성
					dir.mkdirs();
				}
				while (iterator.hasNext()) {
					fileName = iterator.next();
					System.out.println("fileName : " + fileName);
					multipartFile = multipartHttpServletRequest.getFile(fileName);
					System.out.println("비었냐?? : " + multipartFile.isEmpty());
					if (multipartFile.isEmpty() == false) {//파일의 내용이 있는지 없는지 체크 빈 파일을 업로드할거면 없어도 됨
						originalFileName = multipartFile.getOriginalFilename();
						originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					//	long fileSize =multipartFile.getSize();
						
						System.out.println("원본 파일이름 : " + originalFileName);
						System.out.println("원본 파일 확장자 명 : " + originalFileExtension);
						System.out.println("파일 사이즈 : "  + multipartFile.getSize());
						Random rnd = new Random();
						for (int i = 0; i < 15; i++) { //15자리 랜덤 파일명 생성
							int rIndex = rnd.nextInt(3);
							switch (rIndex) {
							case 0:
								// a-z
								storedFileName += (char) ((int) (rnd.nextInt(26)) + 97);
								break;
							case 1:
								// A-Z
								storedFileName += (char) ((int) (rnd.nextInt(26)) + 65);
								break;
							case 2:
								// 0-9
								storedFileName += rnd.nextInt(10);
								break;
							}
						}
						
						storedFileName += originalFileExtension;
						File file = new File(filePath+ storedFileName);
						multipartFile.transferTo(file);
						report.setOriginFileTitle(originalFileName);
						report.setFileTitle(storedFileName);
						report.setFileRoute(file.getPath());
						
	
						System.out.println("데이터코드SEQ: "  + report.getDataCodeList());
						System.out.println("데이터코드SEQttqtqtqtqtqtqtqtqt");
						reportMapper.updateReport(report); // 보고서 수정		
						reportMapper.updateReportFile(report); // 보고서  파일 등록
						int dataCodeList[] = report.getDataCodeList();
						for(int i = 0; i<dataCodeList.length; i++) {
							int dataCode = dataCodeList[i];
							report.setDataCode(dataCode);
							reportMapper.insertReportDataset(report); //보고서 데이터셋
						}	
							
						int cateList[] = report.getCateList();
						for(int i=0; i<cateList.length; i++){
							int cateCode2 = cateList[i];
							report.setCateCode2(cateCode2);
							reportMapper.insertReportCategory(report); //보고 카테고리 등록
					    }
					} else {
						reportMapper.updateReport(report); // 보고서 수정		
						//reportMapper.updateReportFile(report); // 보고서  파일 등록
						int dataCodeList[] = report.getDataCodeList();
						for(int i = 0; i<dataCodeList.length; i++) {
							int dataCode = dataCodeList[i];
							report.setDataCode(dataCode);
							reportMapper.insertReportDataset(report); //보고서 데이터셋
						}	
							
						int cateList[] = report.getCateList();
						for(int i=0; i<cateList.length; i++){
							int cateCode2 = cateList[i];
							report.setCateCode2(cateCode2);
							reportMapper.insertReportCategory(report); //보고 카테고리 등록
					    }
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//보고서 -> 보고서 상세조회
		public Map<String,Object> selectReportView(ReportDomain report) throws Exception{
			   ReportDomain detailReportInfo = reportMapper.selectReportView(report);
		         List<ReportDomain> reportCateInfo = reportMapper.selectReportViewCate(report);
		         List<String> reportCateInfos = new ArrayList<String>();
		         if(reportCateInfo.get(0).getCateTitle2() != null) {
		            reportCateInfos.add(reportCateInfo.get(0).getCateTitle()+">");
		             for(int i = 0; i<reportCateInfo.size()-1; i++) {
		                reportCateInfos.add(reportCateInfo.get(i).getCateTitle2()+",");
		             }
		             reportCateInfos.add(reportCateInfo.get(reportCateInfo.size()-1).getCateTitle2());
		         } 
		         else {
		            reportCateInfos.add(reportCateInfo.get(0).getCateTitle());
		         }
		         
		         Map<String,Object> map = new HashMap<String,Object>();
		         map.put("detailReportInfo", detailReportInfo);
		         map.put("reportCateInfo", reportCateInfos);
		         return map;
		}
		//보고서수정 (이전에 작성한 내용 보기)
				public Map<String,Object> selectReportInfo(ReportDomain report) throws Exception{
					ReportDomain detailUReportInfo = reportMapper.selectReportInfo(report);
			//		List<ReportDomain> reportCateInfo = reportMapper.selectReportViewCate(report);
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("detailUReportInfo", detailUReportInfo);
			//		map.put("reportCateInfo", reportCateInfo);
					return map;
				}
		
		//보고서 -> 파일 다운로드
		public void selectRFileDownload(HttpServletResponse response, ReportDomain report) throws Exception {

			byte fileByte[] = FileUtils.readFileToByteArray(new File(report.getFileRoute()));
			response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(report.getOriginFileTitle(), "UTF-8") + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
		//보고서 삭제
		public void inVisibleReport(ReportDomain report) throws Exception {
			reportMapper.inVisibleReport(report);
		}
		
		//보고서 -> 연관데이터셋
		public List<Dataset> selectReferenceDataSetList(Dataset dvo) throws Exception{
			return reportMapper.selectReferenceDataSetList(dvo);
		}
		
		public void updateReportViews(int reportCode) throws Exception{
			reportMapper.updateReportViews(reportCode);
			
		}
		
		public String selectDatasetType(int dataCode) throws Exception{
			return reportMapper.selectDatasetType(dataCode);
		}
}

