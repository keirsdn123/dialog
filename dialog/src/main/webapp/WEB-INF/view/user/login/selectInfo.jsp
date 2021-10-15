<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="full_box wsize_90" id="selectInfo">

	<div class="under_title mb_5 bd_bd">
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">아이디 찾기</a></li>
			<li data-tab="tab2"><a href="#">비밀번호 찾기</a></li>
		</ul>
<!-- 		<ul class="tab" id="teacher_tab" role="tablist"> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link active show" id="selectId" data-toggle="tab" href="#tab1" role="tab" aria-controls="home" aria-selected="true">받은 쪽지</a> -->
<!-- 			</li> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link" id="selectPw" data-toggle="tab" href="#tab2" role="tab" aria-controls="profile" aria-selected="false">보낸 쪽지</a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
	</div>
	
<!---------------------------  아이디 찾기  ---------------------------------->	
	<div id="tab1" class="tabcontent current" role="tabpanel" aria-labelledby="selectId">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 아이디 찾기
			</p>

		</div>

		<div class="join_box02 mt_30">
			<table class="table table-ddd">
				<colgroup>
					<col width="150px;" />
					<col width="" />
					<col width="100px;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th>이름</th>
						<td>
							<input type="Name" name="memberName" v-model="selId.memberName" class="form-control" aria-describedby="passwordHelpInline">
						</td>

					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="Email" name="memberEmailAddress" v-model="selId.memberEmail" class="form-control"	aria-describedby="passwordHelpInline">
						</td>
					</tr>
				</tbody>
			  </table>
			<div class="cb"></div>

		<!---------------------------  버튼  ---------------------------------->
			<div class="buttons mt_20">
				<a class="btn btn-creat size_150 fr" role="button"	v-on:click="selectId">아이디 찾기</a> 
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/login">되돌아가기</a>
			</div>
		</div>

	</div>
<!---------------------------  비밀번호  ---------------------------------->
	<div id="tab2" class="tabcontent" role="tabpanel" aria-labelledby="selectPw">

		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 비밀번호 찾기
			</p>

		</div>


		<div class="join_box02 mt_30">			
			<table class="table table-ddd">
				<colgroup>
					<col width="150px;" />
					<col width="" />
					<col width="100px;" />
				</colgroup>
				<tbody>
					<tr>
						<th>이름</th>
						<td>
							<input type="Name" name="memberName" v-model="selPw.memberName" class="form-control" aria-describedby="passwordHelpInline">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="Email" name="memberEmailAddress" v-model="selPw.memberEmail" class="form-control"	aria-describedby="passwordHelpInline">
						</td>
					</tr>
					<tr>
						<th>아이디</th>
							<td>
								<input type="id" name="memberId" v-model="selPw.memberId"	class="form-control" aria-describedby="passwordHelpInline">
							</td>
					</tr>	
				</tbody>
			</table>
			<div class="cb"></div>

	<!---------------------------  버튼  ---------------------------------->
			<div class="buttons mt_20">
				<a class="btn btn-creat size_150 fr" role="button"	v-on:click="selectPw">비밀번호 찾기</a> 
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/login">되돌아가기</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/login/script/selectInfoScript.jsp"></jsp:include>