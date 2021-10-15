package net.su.dialog.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.Menulist;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.management.service.ManagementService;

@RestController
public class ManagementAjaxController {

	@Autowired
    private ManagementService managementService;
	
	//회원 조회
	@RequestMapping("/selectMemberList")
	public List<User> selectMemberList(User user) throws Exception {
		System.out.println("회원 조회");
		System.out.println(user.getSearchContent()+" 검색  내용 ");
		System.out.println(user.getSearchType()+" 검색  타입 ");
		return managementService.selectMemberList(user);
	}
	//권한 조회
	@RequestMapping("/selectAuthorityList")
	public List<Authority> selectAuthorityList() throws Exception {
		System.out.println("권한 조회");
		return managementService.selectAuthorityList();
	}
	//회원 권한 변경
	@RequestMapping("/updateRatingCodeList")
	public void updateRatingCodeList(User user) throws Exception {
		System.out.println("변경 완료");
		managementService.updateRatingCodeList(user);
		
	}
	//회원 삭제 (변경)
	@RequestMapping("/deleteMember")
	public void deleteMember(User user) throws Exception {
		System.out.println("회원 삭제 변경");
		System.out.println("회원 seq 조회"+user.getMemberSeqList());
		managementService.deleteMember(user);
	}
	//메뉴 관리 조회
	@RequestMapping("/SelectManageMenuList")
	public List<Menulist> SelectManageMenuList() throws Exception {
		System.out.println("메뉴 관리 조회");
		return managementService.SelectManageMenuList();
	}
	//메뉴 권한 변경
	@RequestMapping("/updateManageRatingCode")
	public void updateManageRatingCode(Authority authority) throws Exception {
		System.out.println("메뉴 권한 변경");
		managementService.updateManageRatingCode(authority);
	}
}
