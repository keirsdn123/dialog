<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90" id="developSourceInfo">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 개발 소스 파일 상세조회
			</p>
		</div>
		<div class="cb"></div>
		<!--앨범 관리(등록) -->
		<div class="photo_write">
			<table class="table table-ddd02 mt_10">
				<colgroup>
					<col width="160px" />
					<col width="calc(50% - 150px)" />
					<col width="150px" />
					<col width="calc(50% - 150px)" />
				</colgroup>
					<tr>
						<th>제목</th>
						<td>{{developSourceInfo.devSourceTitle}}</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>{{developSourceInfo.devSourceType}}</td>
					</tr>
					<tr>
						<th>사용 유무</th>
						<td>{{developSourceInfo.devSourceActStatus}}</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>{{developSourceInfo.devSourceEnrollmentDate}}</td>
					</tr>
					<tr>
						<th>설명</th>
						<td colspan="3">
							<textarea class="form-control rounded-0" id="exampleFormControlTextarea1" rows="18" readonly>{{developSourceInfo.devSourceExplanation}}</textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3">
							<div class="fl mr_15" v-for="(list, index) in developSourceFileInfo">
								<a v-on:click="developSourceFileDownload(index)"><span class="fl mr_10 mt_5">{{list.devSourceFileTitle}}{{list.devSourceFileExtension}}</span></a>
								<a class="btn btn-creat size_120 fl text_white" role="button" v-on:click="developSourceFileDownload(index)">다운로드</a>
							</div>
						</td>
					</tr>
					<tr v-if="developSourceInfo.devSourceType =='수집'">
						<th>등록된 표준화파일</th>
						<td colspan="3">
							<font v-if="referenceSourceInfo.devSourceTitle==null">등록된 표준화 파일 없음</font>
							<a v-if="referenceSourceInfo.devSourceTitle!=null" v-on:click="selectDevelopSourceView(referenceSourceInfo.devSourceCode)">{{referenceSourceInfo.devSourceTitle}} 바로가기</a>
						</td>
					</tr>
					<tr v-if="developSourceInfo.devSourceType =='표준'">
						<th>관련 수집파일</th>
						<td colspan="3">
							<a v-on:click="selectDevelopSourceView(referenceSourceInfo.devSourceCode)">{{referenceSourceInfo.devSourceTitle}} 바로가기</a>
						</td>
					</tr>
			</table>
		</div>
		<div class="cb"></div>
		<div class="buttons mt_15" role="group" aria-label="...">
			<a href="/developSource/developSourceListView" class="btn btn-creat size_100 fl" role="button">목록</a> 
			<a class="btn btn-creat size_100 fr" role="button" v-on:click="developSourceDelete">삭제</a> 
<!-- 			<a href="/developSourceUpdate" class="btn btn-creat size_100 fr mr_10" role="button">수정</a> -->
		</div>
		<div class="cb"></div>
	</div>
</div>
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/admin/developSource/script/developSourceInfoScript.jsp"></jsp:include>