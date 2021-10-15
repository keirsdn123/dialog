package net.su.dialog.developSource.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.developSource.domain.DevelopSource;

@Repository("net.su.dialog.developSource.mapper.DevelopSourceMapper")
public interface DevelopSourceMapper {
	//개발 소스 리스트 조회
	public List<DevelopSource> selectDevelopSourceList(DevelopSource developSource) throws Exception;
	//개발 소스 등록
	public void insertDevelopSource(DevelopSource developSource) throws Exception;
	//개발 소스 상세조회
	public DevelopSource selectDataSourceInfo(DevelopSource developSource) throws Exception;
	//개발 소스 삭제
	public void deleteDataSourceInfo(DevelopSource developSource) throws Exception;
	//개발 소스 파일등록
	public void insertDevelopSourceFile(DevelopSource developSource)throws Exception;
	//개발 소스 파일 상세 조회
	public List<DevelopSource> selectDevelopSourceFileInfo(DevelopSource developSource) throws Exception;
	//개발 소스 수집 타입리스트 조회
	public List<DevelopSource> selectDevelopSourceListType(DevelopSource developSource) throws Exception;
	//관련 개발 소스 조회
	public DevelopSource selectReferenceSource(DevelopSource developSource) throws Exception;
	//개발 소스 총 갯수 조회
	public int selectdevSourceRowCount(DevelopSource developSource) throws Exception;
	//개발 소스 수집타입 리스트 총 갯수 조회
	public int selectDevelopSourceTypeCount() throws Exception;

}
