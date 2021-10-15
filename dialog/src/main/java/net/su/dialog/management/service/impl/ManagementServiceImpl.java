package net.su.dialog.management.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.Menulist;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.management.mapper.ManagementMapper;
import net.su.dialog.management.service.ManagementService;

@Service
public class ManagementServiceImpl implements ManagementService{

	
	@Resource(name="net.su.dialog.management.mapper.ManagementMapper")
	private ManagementMapper managementMapper;
	
	//회원 조회
	public List<User> selectMemberList(User user) throws Exception{
		System.out.println("회원 조회");
		return managementMapper.selectMemberList(user);
	}
	//회원 조회
	public List<Authority> selectAuthorityList() throws Exception{
		System.out.println("권한 조회");
		return managementMapper.selectAuthorityList();
	}
	//회원 권한 변경
	public void updateRatingCodeList(User user) throws Exception{
		System.out.println("회원 권한 변경");
		managementMapper.updateRatingCodeList(user);
	}
	//회원 삭제
	public void deleteMember(User user) throws Exception{
		System.out.println("회원 삭제");
		int MemberSeq[] = user.getMemberSeqList();
		for(int i=0; i<MemberSeq.length; i++){
			int memberCode = MemberSeq[i];
			user.setMemberCode(memberCode);
			managementMapper.deleteMember(user);//회원 삭제
	    }
	}
	//메뉴 관리 조회
	public List<Menulist> SelectManageMenuList() throws Exception{
		System.out.println("메뉴 관리 조회");
		return managementMapper.SelectManageMenuList();
	}
	//메뉴 권한 변경
	public void updateManageRatingCode(Authority authority) throws Exception{
		System.out.println("회원 권한 변경");
		managementMapper.updateManageRatingCode(authority);
	}
}
