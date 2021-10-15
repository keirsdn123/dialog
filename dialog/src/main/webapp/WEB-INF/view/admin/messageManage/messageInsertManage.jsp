<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="full_box wsize_90" id="adminMesInsert">

	<div class="under_title mb_5 ">
		<p class="fl mt_5">
			<span>|</span> 쪽지 보내기
		</p>
	</div>
<!---------------------------  정보 입력  ---------------------------------->
		<div class="photo_write">
			<table class="table table-ddd">
				<colgroup>
					<col width="15%" />
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="40%" />
				</colgroup>
				<tbody>
					<tr>
						<th>보내는 이</th>
						<td>회원 등급 </td>
							<td>
								<select class="form-control class_select100 fl" v-model="memberRatingCode">
									<option disabled value="">회원 등급</option> 
									<option v-for= "category in getMemberList" v-bind:value="category.memberRatingCode">{{category.ratingName}}</option>
								</select> 
							</td>	
							<td>아이디</td>	
							<td>	
								<treeselect v-model="value" :multiple="true" :options="options" />
							</td>
						
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">
							<textarea class="form-control rounded-0" name="mesContent" v-model="mesContent" rows="18"></textarea></td>				
					</tr>
				</tbody>
			</table>
		</div>
	  <!---------------------------  버튼  ---------------------------------->
		<div class="buttons mt_15" role="group" aria-label="...">
			<a class="btn btn-creat size_100 fr" role="button"	v-on:click="adminInsertMessage">보내기</a> 
			<a class="btn btn-cencle size_100 fr mr_5"  role="button" href="/selectMessageManage">취소</a>
		</div>
</div>
<jsp:include page="/WEB-INF/view/admin/messageManage/script/messageInsertManageScript.jsp"></jsp:include>