<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90" id="devSourceInsert">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 개발 소스 파일 등록
			</p>
		</div>
		<div class="cb"></div>
		<div class="photo_write">
			<form id="insertDevFrm" method="post" enctype="multipart/form-data">
				<table class="table table-ddd02 mt_10">
					<colgroup>
						<col width="160px" />
						<col width="calc(50% - 150px)" />
						<col width="150px" />
						<col width="calc(50% - 150px)" />
					</colgroup>
						<tr>
							<th>제목</th>
							<td colspan="3">
								<input type="text" class="wsize_100 form-control" name="devSourceTitle" id="devSourceTitle">
							</td>
						</tr>
						<tr>
							<th>구분</th>
							<td colspan="3">
								<label class="custom-control custom-radio fl"> 
									<input id="radio2" name="devSourceType" id="devSourceType" type="radio" class="custom-control-input" value="수집" v-model="devSourceType"> 
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description">수집</span>
								</label> 
								<label class="custom-control custom-radio fl"> 
									<input id="radio2" name="devSourceType" id="devSourceType" type="radio" class="custom-control-input" value="표준" v-model="devSourceType"> 
									<span class="custom-control-indicator"></span> 
									<span class="custom-control-description">표준화</span>
								</label>
							</td>
						</tr>
						<tr v-if="devSourceType=='표준'">
							<th>관련 수집 소스 파일</th>
							<td colspan="3">
								<input type="text" class="form-control size_250 fl" disabled = "disabled" v-model = "devSourceTitle">
								<button type="button" class="btn btn-creat fl ml_1 mt_0" data-toggle="modal" data-target="#developSourceInsertPopup" v-on:click="selectDevelopSourceTypeCount">+</button>
							</td>
						</tr>
						<tr>
							<th>설명</th>
							<td colspan="3">
								<textarea class="form-control rounded-0" rows="18" name="devSourceExplanation" id="devSourceExplanation"></textarea>
							</td>
						</tr>
						<tr>
							<th rowspan="2">첨부파일</th>
							<td colspan="3">
								<div class="filebox bs3-primary">
		                        	<input class="upload-name" value="자바 파일업로드" disabled="disabled">
		                        	<label for="javaFile">파일업로드</label> 
		                       		<input type="file" id="javaFile" ref="javaFile" name="javaFile" class="upload-hidden"> 
                        		</div>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="filebox bs3-primary">
		                            <input class="upload-name" value="클래스 파일업로드" disabled="disabled">
		                            <label for="classFile">파일업로드</label> 
		                          	<input type="file" id="classFile" ref="classFile" name="classFile" class="upload-hidden"> 
                        		</div>
							</td>
						</tr>
				</table>
			</form>
		</div>
		<!--//앨범 카테고리-->
		<div class="cb"></div>
		<!--버튼-->
		<div class="buttons mt_15" role="group" aria-label="...">
			<a class="btn btn-creat fr size_100" role="button" v-on:click="insertDevelopSource">등록</a> 
			<a class="btn btn-cencle fr mr_10 size_100" role="button" v-on:click="developSourceListView">취소</a>
		</div>
		<div class="cb"></div>
		<jsp:include page="/WEB-INF/view/admin/developSource/popup/developSourceInsertPopup.jsp"></jsp:include>
	</div>
</div>
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/admin/developSource/script/developSourceInsertScript.jsp"></jsp:include>
