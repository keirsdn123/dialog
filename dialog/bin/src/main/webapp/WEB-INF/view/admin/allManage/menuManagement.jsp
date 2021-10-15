<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90" id="menuManagement">
	    <div class="under_title mb_10">
			<p class="fl mt_5"><span>|</span> 메뉴 관리 </p>
		</div>
			<table class="table table-ddd02 mt_10">
	          	<colgroup>
					<col width="5%;" />
					<col width="65%;" />
					<col width="10%;" />
					<col width="10%;" />
					<col width="10%;" />
				</colgroup>
				<tr>
					<th>NO</th>
					<th>메뉴 명</th>
					<th>사용여부</th>
					<th>메뉴별 권한</th>
					<th>설정</th>
				</tr>
				<tr v-for="(menu,index) in ManageMenuList"  >
					<td>{{index+1}}</td>
					<td v-if="menu.menuRoot == 0"><input style="font-weight:bold" class="form-control insert_text display_inline" type="text"  v-model="menu.menuTitle"style=""></td>
					<td v-else>&gt;&gt;<input type="text" class="form-control insert_text display_inline" v-model="menu.menuTitle"></td>
					<td>
						<select class="form-control class_select100" v-model="menu.menuUse">
							<option v-bind:value="'Y'" :selected="menu.menuUse == 'Y'">사용</option>
							<option v-bind:value="'N'" :selected="menu.menuUse == 'N'">숨김</option>
						</select>
					</td>
					<td>
						<select class="form-control class_select100 " v-model="menu.memberRatingCode">
							<option v-for="selectAuthority in selectAuthorityList" v-bind:value="selectAuthority.memberRatingCode">{{selectAuthority.ratingName}}</option>
						</select>
					</td>
					<td>
						<a class="btn btn-cencle size_100 " role="button"v-on:click="updateRatingCode(menu)">변경</a>
					</td>
				</tr>
           	</table>
    	<form id="pageChange" method="post"></form>
	</div>
</div>
<jsp:include page="/WEB-INF/view/admin/allManage/script/menuManagementScript.jsp"></jsp:include>