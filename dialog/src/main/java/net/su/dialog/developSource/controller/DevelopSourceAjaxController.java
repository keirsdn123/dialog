package net.su.dialog.developSource.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.developSource.service.DevelopSourceService;

//@ResponseBody 안써도됨
//Ajax만
@RestController
@RequestMapping(value="/developSource")
public class DevelopSourceAjaxController {

	@Autowired
    private DevelopSourceService developSourceService;
	
	//개발 소스 리스트 조회
	@RequestMapping("/selectDevelopSourceList")
	public List<DevelopSource> selectDevelopSourceList(DevelopSource developSource) throws Exception {
		System.out.println("개발 소스 리스트 조회 컨트롤러");
		return developSourceService.selectDevelopSourceList(developSource);
	}
	//게시물 갯수 조회
	@RequestMapping("/selectdevSourceRowCount")
	public int selectdevSourceRowCount(DevelopSource developSource) throws Exception{
		return developSourceService.selectdevSourceRowCount(developSource);
	}
	//수집 개발 소스 조회
	@RequestMapping("/selectDevelopSourceListType")
	public List<DevelopSource> selectDevelopSourceListType(DevelopSource developSource) throws Exception{
		return developSourceService.selectDevelopSourceListType(developSource);
	}
	//수집 개발 소스 갯수 조회
	@RequestMapping("/selectDevelopSourceTypeCount")
	public int selectDevelopSourceTypeCount() throws Exception{
		return developSourceService.selectDevelopSourceTypeCount();
	}
	//개발 소스 등록
	@RequestMapping("/insertDevelopSource")
    public void insertDevelopSource(MultipartHttpServletRequest request, DevelopSource developSource) throws Exception{
		System.out.println("ddddddddd " + developSource.getDevSourceRoot());
		System.out.println("개발 소스 파일 등록 컨트롤러");
		developSourceService.insertDevelopSource(request, developSource);
         
    }
	//개발 소스 상세 조회
	@RequestMapping("/selectDevelopSourceInfo")
    public DevelopSource selectDataSourceInfo(DevelopSource developSource) throws Exception{
		
		System.out.println("개발 소스 파일 상세조회 컨트롤러");
        return developSourceService.selectDataSourceInfo(developSource);
    }
	//개발 소스 파일 상세 조회
	@RequestMapping("/selectDevelopSourceFileInfo")
	public List<DevelopSource> selectDevelopSourceFileInfo(DevelopSource developSource) throws Exception{
		
		System.out.println("개발 소스 파일 상세 조회 컨트롤러");
		return developSourceService.selectDevelopSourceFileInfo(developSource);
	}
	
	//개발 소스 삭제 -게시글 삭제 및 파일 삭제
	@RequestMapping("/developSourceDelete")
	public void developSourceDelete(DevelopSource developSource) throws Exception{
		
		System.out.println("개발 소스 삭제 -게시글 삭제 및 파일 삭제 컨트롤러");
		developSourceService.developSourceDelete(developSource);
	}
	//개발 소스 상세조회 - 파일 다운로드
	@RequestMapping("/developSourceFileDownload")
	public void developSourceFileDownload(HttpServletResponse response, DevelopSource developSource) throws Exception{
		
		System.out.println("개발 소스 상세조회 - 파일 다운로드 컨트롤러");
		developSourceService.developSourceFileDownload(response, developSource);
	}
	//관련 개발 소스 조회
	@RequestMapping("/selectReferenceSource")
	public DevelopSource selectReferenceSource(DevelopSource developSource) throws Exception{
		System.out.println("seq " + developSource.getDevSourceCode());
		System.out.println("type " + developSource.getDevSourceType());
		return developSourceService.selectReferenceSource(developSource);
	}
}
