<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90" id="dtsourceList">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 개발 소스 파일 관리
			</p>
		</div>
		<div class="cb"></div>
		<table class="table table-board table-hover mt_10 ">
			<colgroup>
				<col width="80px;" />
				<col width="300px;" />
				<col width="100px;" />
				<col width="80px;" />
				<col width="120px;" />
				<col width="100px;" />
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>구분</th>
				<th>사용유무</th>
				<th>작성자</th>
			</tr>
			<tr v-for="list in DevelopSourceList">
				<td>{{list.devSourceCode}}</td>
				<td class="text-left">
					<a v-on:click="devSourceInfo(list.devSourceCode)">{{list.devSourceTitle}}</a>
				</td>
				<td>{{list.devSourceEnrollmentDate}}</td>
				<td>{{list.devSourceType}}</td>
				<td>{{list.devSourceActStatus}}</td>
				<td>관리자</td>
			</tr>
		</table>
		<div class="buttons mt_15" role="group" aria-label="...">
			<a href="/developSource/developSourceInsertView" class="btn btn-creat size_100 fr" role="button">등록</a>
		</div>
		<div class="cb"></div>
		<div class="buttons">
			<nav aria-label="pagination example" class="dis_in">
				<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage" limit="10" v-show="pagingInfo.records > 0"></b-pagination>
			</nav>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/admin/developSource/script/developSourceListScript.jsp"></jsp:include>