<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
		<div class="full_box wsize_90" id="userManagement">
		    <div class="under_title mb_5 ">
				<p class="fl mt_5"><span>|</span> 회원 관리 </p>
			</div>
			<div class=" mb_gyucheol wsize_50 fr">
				<div>
         			<button type="button" class="btn search-btn wsize_20 fr"  v-on:click="searchSelect()">검색</button>
       			</div>
				<div>
         			<input type="text" class="form-control search_inputbox wsize_60 fr" id="inputPassword" placeholder="검색어 입력" v-model="searchContent">
       			</div>
   				<div>
		      		<select class="form-control class_select wsize_20 fr" v-model="searchType">
								<option v-bind:value="'memName'">이름</option>
								<option v-bind:value="'memId'">아이디</option>
								<option v-bind:value="'memEmail'">이메일</option>
					</select>
				</div>
   		 	</div>
			<table class="table table-board mt_10">
	          	<colgroup>
					<col width="5%;" />
					<col width="5%;" />
					<col width="20%;" />
					<col width="25%;" />
					<col width="25%;" />
					<col width="20%;" />
				</colgroup>
				<tr>
					<th><input type="checkbox"id="allcheck" v-on:click="allcheck" v-bind:checked="memberSeqList.length == selectMemberList.length && selectMemberList.length > 0" ></th>
					<th>NO</th>
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 이메일</th>
					<th>회원 등급</th>
				</tr>
			     <tr v-for="(list, index) in selectMemberList">
			     	 <td><input type="checkbox" id="memberCheck" v-model="memberSeqList" v-bind:value="list.memberCode" ></td>
		             <td>{{index + 1}}</td>
		             <td>{{list.memberId}}</td>
		             <td>{{list.memberName}}</td>
		             <td>{{list.memberEmailAddress}}</td>
		             <td>
		             	<select class="form-control class_select40 fl"  v-model="list.memberRatingCode">
		             		<option v-for="selectAuthority in selectAuthorityList" v-bind:value="selectAuthority.memberRatingCode" v-if="selectAuthority.memberRatingCode != 0">{{selectAuthority.ratingName}}</option>
		             	</select>
		             	<a class="btn btn-cencle size_100 fr " role="button" v-on:click="updateRatingCode(list)">변경</a> 
		             </td>
			     </tr>
            </table>
            		<div class="buttons mt_15" role="group" aria-label="...">
						<a class="btn btn-creat size_120 fr" role="button"	v-on:click="deleteMemberList">회원삭제</a> 
					</div>
            <form id="pageChange" method="post"></form>
		</div>
</div>
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/admin/allManage/script/userManagementScript.jsp"></jsp:include>