<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="full_box wsize_90" id="selectInfo">

	<div class="under_title mb_5 bd_bd">
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">���̵� ã��</a></li>
			<li data-tab="tab2"><a href="#">��й�ȣ ã��</a></li>
		</ul>
<!-- 		<ul class="tab" id="teacher_tab" role="tablist"> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link active show" id="selectId" data-toggle="tab" href="#tab1" role="tab" aria-controls="home" aria-selected="true">���� ����</a> -->
<!-- 			</li> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link" id="selectPw" data-toggle="tab" href="#tab2" role="tab" aria-controls="profile" aria-selected="false">���� ����</a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
	</div>
	
<!---------------------------  ���̵� ã��  ---------------------------------->	
	<div id="tab1" class="tabcontent current" role="tabpanel" aria-labelledby="selectId">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> ���̵� ã��
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
						<th>�̸�</th>
						<td>
							<input type="Name" name="memberName" v-model="selId.memberName" class="form-control" aria-describedby="passwordHelpInline">
						</td>

					</tr>
					<tr>
						<th>�̸���</th>
						<td>
							<input type="Email" name="memberEmailAddress" v-model="selId.memberEmail" class="form-control"	aria-describedby="passwordHelpInline">
						</td>
					</tr>
				</tbody>
			  </table>
			<div class="cb"></div>

		<!---------------------------  ��ư  ---------------------------------->
			<div class="buttons mt_20">
				<a class="btn btn-creat size_150 fr" role="button"	v-on:click="selectId">���̵� ã��</a> 
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/login">�ǵ��ư���</a>
			</div>
		</div>

	</div>
<!---------------------------  ��й�ȣ  ---------------------------------->
	<div id="tab2" class="tabcontent" role="tabpanel" aria-labelledby="selectPw">

		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> ��й�ȣ ã��
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
						<th>�̸�</th>
						<td>
							<input type="Name" name="memberName" v-model="selPw.memberName" class="form-control" aria-describedby="passwordHelpInline">
						</td>
					</tr>
					<tr>
						<th>�̸���</th>
						<td>
							<input type="Email" name="memberEmailAddress" v-model="selPw.memberEmail" class="form-control"	aria-describedby="passwordHelpInline">
						</td>
					</tr>
					<tr>
						<th>���̵�</th>
							<td>
								<input type="id" name="memberId" v-model="selPw.memberId"	class="form-control" aria-describedby="passwordHelpInline">
							</td>
					</tr>	
				</tbody>
			</table>
			<div class="cb"></div>

	<!---------------------------  ��ư  ---------------------------------->
			<div class="buttons mt_20">
				<a class="btn btn-creat size_150 fr" role="button"	v-on:click="selectPw">��й�ȣ ã��</a> 
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/login">�ǵ��ư���</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/login/script/selectInfoScript.jsp"></jsp:include>