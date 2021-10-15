<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="full_box wsize_90" id="mesInsert">

	<div class="under_title mb_5 ">
		<p class="fl mt_5">
			<span>|</span> 쪽지 보내기
		</p>
	</div>

		<div class="photo_write" v-if="msIn.memberId == null">
			<table class="table table-ddd">
				
				<tbody>
					<tr>
						<th>받는 이(아이디)</th>
						<td>
						
							<div id="idCheckDIV" style="margin-top:5px"></div>
						</td>
						
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea class="form-control rounded-0" name="mesContent" v-model="msIn.mesContent" rows="18"></textarea></td>				
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="photo_write" v-else-if="msIn.memberId != null">
			<table class="table table-ddd">
				
				<tbody>
					<tr>
						<th>받는 이</th>
						<td>
						<input title="아이디 입력" type="text"	name="msIn.memberId" class="wsize_85 form-control" id="memberId" v-model="msIn.memberId"	style="float:left"> 
						<input class="btn btn-creat mr_2" title="중복"  id="idCheck" type="button" value="확인"	v-on:click="idCheck()" style="margin-left:1%; margin-top:1px;" />
						
							<div id="idCheckDIV" style="margin-top:5px"></div>
						</td>
						
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea class="form-control rounded-0" name="mesContent" v-model="msIn.mesContent" rows="18"></textarea></td>				
					</tr>
				</tbody>
			</table>
		</div>
	
		<div class="buttons mt_15" role="group" aria-label="...">
			<a class="btn btn-creat size_100 fr" role="button"	v-on:click="insertMessage">보내기</a> 
			<a class="btn btn-cencle size_100 fr mr_5"  role="button" href="/selectMessage">취소</a>
		</div>
</div>
<jsp:include page="/WEB-INF/view/user/message/script/messageInsertScript.jsp"></jsp:include>