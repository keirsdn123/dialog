<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="full_box wsize_90" id="updatePassword">

	<div id="tab1" class="tabcontent current">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> ��й�ȣ ����
			</p>

		</div>
<!---------------------------  ���� �ۼ�  ---------------------------------->
		<div class="join_box02 mt_30">
			<table class="table table-ddd">
				<colgroup>
					<col width="150px;" />
					<col width="" />
					<col width="100px;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th>�� ��й�ȣ</th>
						<td>
							<input type="password" v-model="searchItem.memberPassword" name="memberPassword" class="form-control" aria-describedby="passwordHelpInline">
						</td>
					</tr>
					<tr>
						<th>��й�ȣ Ȯ��</th>
						<td>
							<input type="password" v-model="searchItem.memberPassword2" class="form-control"	aria-describedby="passwordHelpInline">
						</td>
					</tr>
				</tbody>
			  </table>
			<div class="cb"></div>
<!---------------------------  ��ư  ---------------------------------->
			<div class="buttons mt_20">
				<a class="btn btn-creat size_150 fr" role="button"	v-on:click="updatePw">Ȯ��</a> 
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/login">�ǵ��ư���</a>
			</div>
		</div>

	</div>
</div>
<jsp:include page="/WEB-INF/view/user/login/script/updatePasswordScript.jsp"></jsp:include>