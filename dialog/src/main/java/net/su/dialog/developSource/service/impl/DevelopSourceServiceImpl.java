package net.su.dialog.developSource.service.impl;

import java.io.File;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.developSource.mapper.DevelopSourceMapper;
import net.su.dialog.developSource.service.DevelopSourceService;

@Service
public class DevelopSourceServiceImpl implements DevelopSourceService {

	@Resource(name = "net.su.dialog.developSource.mapper.DevelopSourceMapper")
	private DevelopSourceMapper developSourceMapper;

	// 개발 소스 리스트 조회
	public List<DevelopSource> selectDevelopSourceList(DevelopSource developSource) throws Exception {
		
		return developSourceMapper.selectDevelopSourceList(developSource);
	}
	//개발소스 수집 타입 리스트 조회
	public List<DevelopSource> selectDevelopSourceListType(DevelopSource developSource) throws Exception{
		return developSourceMapper.selectDevelopSourceListType(developSource);
	}
	//개발 소스 총 갯수 조회
	public int selectdevSourceRowCount(DevelopSource developSource) throws Exception{
		return developSourceMapper.selectdevSourceRowCount(developSource);
	}
	//개발 소스 수집 타입 리스트 총 갯수 조회
	public int selectDevelopSourceTypeCount() throws Exception{
		return developSourceMapper.selectDevelopSourceTypeCount();
	}
	// 개발 소스 등록
	public void insertDevelopSource(MultipartHttpServletRequest request, DevelopSource developSource) throws Exception {
		
		try {
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String fileName="";
			String storedFilepath ="";
//			String storedClassFilePath="";
			String baseFilePath = request.getSession().getServletContext().getRealPath("/");
			baseFilePath = baseFilePath.substring(0, baseFilePath.indexOf("webapp"));
			baseFilePath += "resources/static/uploadFiles/developSourceFile/";  //resource경로 만들기
			developSourceMapper.insertDevelopSource(developSource);
			while (iterator.hasNext()) {
				fileName = iterator.next();
				System.out.println("fileName : " + fileName);
				multipartFile = multipartHttpServletRequest.getFile(fileName);
				if(fileName.equals("javaFile")) {
					storedFilepath =baseFilePath+"javaFile/";
					File dir = new File(storedFilepath);
					if(!dir.isDirectory()) { //해당 경로의 폴더가 없다면 폴더를 생성
						dir.mkdirs();
					}
				}else {
					String classPath = this.getClass().getResource("").getPath();
					classPath=classPath.substring(1, classPath.indexOf("net"));
					storedFilepath =classPath;
					File dir = new File(storedFilepath);
					if(!dir.isDirectory()) { //해당 경로의 폴더가 없다면 폴더를 생성
						dir.mkdirs();
					}
				}
				if (multipartFile.isEmpty() == false) {//파일의 내용이 있는지 없는지 체크 빈 파일을 업로드할거면 없어도 됨
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					originalFileName = originalFileName.substring(0, originalFileName.lastIndexOf("."));
					File file = new File(storedFilepath + originalFileName + originalFileExtension);
					multipartFile.transferTo(file);
					developSource.setDevSourceFileTitle(originalFileName);
					developSource.setDevSourcefileRoute(file.getPath());
					developSource.setDevSourceFileExtension(originalFileExtension);
					developSourceMapper.insertDevelopSourceFile(developSource);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 개발 소스 상세 조회
	public DevelopSource selectDataSourceInfo(DevelopSource developSource) throws Exception {

		return developSourceMapper.selectDataSourceInfo(developSource);
	}
	
	//개발 소스 파일 상세 조회
	public List<DevelopSource> selectDevelopSourceFileInfo(DevelopSource developSource) throws Exception{
		
		return developSourceMapper.selectDevelopSourceFileInfo(developSource);
	}

	// 개발 소스 파일 다운로드
	public void developSourceFileDownload(HttpServletResponse response, DevelopSource developSource) throws Exception {

		byte fileByte[] = FileUtils.readFileToByteArray(new File(developSource.getDevSourcefileRoute()));
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(developSource.getDevSourceFileTitle()+developSource.getDevSourceFileExtension(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	// 개발 소스 삭제(게시글 삭제 및 파일 삭제)
	public void developSourceDelete(DevelopSource developSource) throws Exception {
		
		try {
			if(developSource.getDevSourceFileRoutes() != null) {
				for(int i = 0; i<developSource.getDevSourceFileRoutes().size();i++) {
					File file = new File(developSource.getDevSourceFileRoutes().get(i));
					file.delete();
				}
			}
			developSourceMapper.deleteDataSourceInfo(developSource);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//관련 개발소스 조회
	public DevelopSource selectReferenceSource(DevelopSource developSource) throws Exception{
		return developSourceMapper.selectReferenceSource(developSource);
	}
}
