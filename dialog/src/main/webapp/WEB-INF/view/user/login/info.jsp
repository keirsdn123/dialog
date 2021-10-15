<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="resources/css/login.css">	
<div class="full_box wsize_90">		
		<!--내용전체-->
			<div class="page-header" style="max-height:200px;">
				<img src="/resources/img/main/hand-3044387_1280.jpg" style="height:200px; width: 80%; opacity: 0.2;">
		          <div class="wsize_60" style="position: relative;top:-150px;height: 60px;margin:auto;">			
						<img src="/resources/img/logo/JOIN.png" style="height:120px; width: 50%; ">
						
					</div>
		        </div>
<!---------------------------  회원 정보 입력  ---------------------------------->
		  <div class="back">
			<div class="join_info">
				<div class="sub_conts" style="margin-top:10%;margin-left:5%">
					<div class="join_box">
						<form method ="post" id="joinFrm">
							<table class="table table-ddd03">
								<colgroup>
									<col width="150px;" />
									<col width="" />
								</colgroup>
									
									<br>	
								<tr>
									<th class="bg">아이디</th>
									<td>
									<div class="input-group">
										<input class="form-control" style="height:33px;" name="memberId" title="아이디 입력" id="memberId" type="text">
										<span>
											<input class="btn btn-creat mr_2" style="margin-top:-0.5px"  name="login" title="로그인" id="idCheckBtn" type="button" value="중복확인" onclick="javascirpt:idCheck();" style="padding-top:5px; padding-bottom:5px;">
										</span>
                                   </div>
									
												<div id="idCheckDIV"></div>
									</td>
								</tr>
								<tr>
									<th class="bg">비밀번호</th>
									<td ><input class="form-control" style="height:33px;" name="memberPassword" title="비밀번호 입력" id="memberPassword" type="password" onkeypress='pwCheck(event)' onkeyup='pwCheck(event)'/></td>
								</tr>
								<tr>
									<th class="bg">비밀번호 확인</th>
									<td>			
									   <input class="form-control" style="height:33px;" name="memPwConfirm" title="비밀번호확인 입력" id="memPwConfirm" type="password" onkeypress='pwCheck(event)' onkeyup='pwCheck(event)'/>
												<div id="pwCheckDIV"></div>
									</td>
								</tr>
								
								<tr>
									<th class="bg">이름</th>
									<td><input class="form-control" style="height:33px;" name="memberName" title="이름 입력" id="memberName" type="text" style="ime-mode:desativated"></td>
								</tr>		
								
								<tr>						
									<th class="bg" >이메일</th>
									<td >
										<input name="memberEmail1" title="이메일 입력" id="memberEmail1" type="text" style="width:120px; height:37px; margin-right:2px;"/>
													@
										<input name="memberEmail2" title="이메일 입력" id="memberEmail2" type="text" style="width:156px; height:37px; margin-left:2px;"/>
									</td>
									<td>
											 <select id="email" class="form-control" style="width:120px; height:37px; float:left; margin-left:-65%;" onChange="javascript:insertEmail();">
												<option value="직접입력" selected>직접입력</option>					
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>             
												<option value="nate.com">nate.com</option>   				
											</select>
									</td>
								</tr>					
							</table>
						</form>	
				<!---------------------------  버튼  ---------------------------------->
							<div class="buttons mt_15" role="group" aria-label="...">
								<a class="btn btn-creat size_120 fr" onclick="javascript:memInsert()" role="button">회원가입</a>
								<a class="btn btn-cencle size_100 fr mr_5" href="/login"  role="button">취소</a>
							</div>
						
					</div>
		  </div>	
		</div>
	</div>
	  <jsp:include page="/WEB-INF/view/user/login/script/infoScript.jsp"></jsp:include>
</div>