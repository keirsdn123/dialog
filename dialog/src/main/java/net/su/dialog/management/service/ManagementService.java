package net.su.dialog.management.service;

import java.util.List;

import net.su.dialog.dataSet.domain.Menulist;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;


public interface ManagementService {

	//회원 조회
	public List<User> selectMemberList(User user) throws Exception;
	//회원 권한 조회
	public List<Authority> selectAuthorityList() throws Exception;
	//회원 권한 변경
	public void updateRatingCodeList(User user) throws Exception;
	//회원 삭제
	public void deleteMember(User user) throws Exception;
	//메뉴 관리 조회
	public List<Menulist> SelectManageMenuList() throws Exception;
	//메뉴 권한 변경
	public void updateManageRatingCode(Authority authority) throws Exception;
	
}
