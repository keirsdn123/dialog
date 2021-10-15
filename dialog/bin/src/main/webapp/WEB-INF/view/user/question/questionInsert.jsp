<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="full_box wsize_90" id="queInsert">

	<div class="under_title mb_5 ">
		<p class="fl mt_5">
			<span>|</span> 문의하기
		</p>
	</div>
<!---------------------------  작성내용 --------------------------->	
	<div class="photo_write">
			<form id="insertQuestionFrm" method="post" enctype="multipart/form-data">
				<table class="table table-ddd02" class="" >
					<colgroup>
						<col width="15%" />
						<col width="10%" />
						<col width="20%" />
						<col width="10%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="4">
								<input type="text"  class="form-control rounded-0" name="noticeTitle" id="noticeTitle"/>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="4">
								<textarea class="form-control rounded-0" name="noticeContent" id="noticeContent" rows="12">
								</textarea>
							</td>
						</tr>
					   	<tr>
	                       <th>첨부파일</th>
	                       <td colspan="4">
								<div class="filebox bs3-primary">
			                     	<input class="upload-name" value="파일업로드" disabled="disabled">
			                     	<label for="fileUpload">파일업로드</label> 
			                 		<input type="file" id="fileUpload" name="fileUpload" class="upload-hidden"> 
			            		</div>
	                       </td>
	                    </tr>
					</tbody>
				</table>
			</form>
	<!---------------------------  버튼  --------------------------->				
		<div class="buttons mt_15" role="group" aria-label="...">
			<a class="btn btn-creat size_120 fr" role="button"	v-on:click="insertQuestion">등록하기</a> 
			<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/question">되돌아가기</a>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/question/script/questionInsertScript.jsp"></jsp:include>