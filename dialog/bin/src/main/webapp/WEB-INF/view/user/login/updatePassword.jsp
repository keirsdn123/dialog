<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="full_box wsize_90" id="updatePassword">

	<div id="tab1" class="tabcontent current">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 비밀번호 변경
			</p>

		</div>
<!---------------------------  내용 작성  ---------------------------------->
		<div class="join_box02 mt_30">
			<table class="table table-ddd">
				<colgroup>
					<col width="150px;" />
					<col width="" />
					<col width="100px;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th>새 비밀번호</th>
						<td>
							<input type="password" v-model="searchItem.memberPassword" name="memberPassword" class="form-control" aria-describedby="passwordHelpInline">
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" v-model="searchItem.memberPassword2" class="form-control"	aria-describedby="passwordHelpInline">
						</td>
					</tr>
				</tbody>
			  </table>
			<div class="cb"></div>
<!---------------------------  버튼  ---------------------------------->
			<div class="buttons mt_20">
				<a class="btn btn-creat size_150 fr" role="button"	v-on:click="updatePw">확인</a> 
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/login">되돌아가기</a>
			</div>
		</div>

	</div>
</div>
<jsp:include page="/WEB-INF/view/user/login/script/updatePasswordScript.jsp"></jsp:include>