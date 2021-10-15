
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<div class="full_box wsize_100" id="login">
	<div class="full_box wsize_100 back">
		<div class="container">
			<div class="top">
				<h1 id="title" class="hidden">
<!-- 					<span id="logo">DIALOG</span> -->
						<img src="/resources/login/LOGIN2.png" width="300" height="100" style="top:30px">
				</h1>
			</div>

			<div class="login-box">
				<section id="content">
							<div class="boxEdge">
								<div class="boxStyle2">

									<form name="loginForm" id="loginForm" method="post">
										<dl>
											<dd>
												<input type="text" class="form-control"	v-model="user.memberId" name="memberId" id="memberID" placeholder="userId" v-on:keyup.enter="memLogin">
											</dd>
											<dd>
												<input type="password" class="form-control"	v-model="user.memberPassword" name="memberPassword"	id="member_password" placeholder="password" v-on:keyup.enter="memLogin">
												<ul id="loginUl">
													<!-- 												<li>ID / PW를 확인해주세요.</li> -->
												</ul>
											</dd>
					<!-- ------------------------  버튼  -------------------------------- -->
											<dd>
												<a v-on:click="memLogin" name="memberLogin"	class="btn btn-login wsize_100 mt_5 fl" role="button" style="padding: .65rem 1.3rem;">
													login
												</a> 
												<a href="/info" role="button" class="btn btn-login02 size_120 fl mr_5 mt_5 mb_15">
													회원가입	
												</a>
											</dd>
											<dd>
												<a href="/selectInfo" role="button"	class="btn btn-login02 size_230 fl mr_5 mt_5 mb_15"	style="float: right; margin-right: 0px;"> 
													아이디/비밀번호 찾기 
												</a>
											</dd>
										</dl>

									</form>
								</div>
							</div>

				</section>	
			</div>			
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/login/script/loginScript.jsp"></jsp:include>