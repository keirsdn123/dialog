package net.su.dialog.management.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.CateManage;
import net.su.dialog.management.service.CateManageService;

//@ResponseBody 안써도됨
//Ajax만
@RestController
@RequestMapping("/cateManage")
public class CateManageAjaxController {
	
	@Autowired
	private CateManageService cateManageService;
	
	//카테고리조회
	@RequestMapping("/selectCate")
	public Map<String, Object> selectCate() throws Exception{
		return cateManageService.selectCate();
	}
	
	//상위카테고리등록
	@RequestMapping("/insertCate")
	public void insertCate(CateManage cateManage, HttpSession session) throws Exception{
		cateManage.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		cateManageService.insertCate(cateManage);
	}
	
	//하위카테고리등록
	@RequestMapping("/insertCate2")
	public void insertCate2(CateManage cateManage, HttpSession session) throws Exception{
		cateManage.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		cateManageService.insertCate2(cateManage);
	}
	
	//하위카테고리조회
	@RequestMapping("/selectChild")
	public List<CateManage> selectChild(CateManage cateManage) throws Exception{
		return cateManageService.selectChild(cateManage);
	}
	
	//카테고리수정
	@RequestMapping("/updateCate")
	public void updateCate(CateManage cateManage, HttpSession session) throws Exception{
		cateManage.setMemberCode(((User)session.getAttribute("memInfo")).getMemberCode());
		cateManageService.updateCate(cateManage);
	}
	
	//카테고리삭제
	@RequestMapping("/deleteCate")
	public void deleteCate(CateManage cateManage) throws Exception{
		cateManageService.deleteCate(cateManage);
	}
}
