<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90" id="schList">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 스케줄 관리
			</p>
		</div>
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>스케줄 로그</li>
		</ul>
		<div class="payment_way4 ta_left"></div>
		<div style="width: 100%; height: 250px; overflow: auto">
			<table class="table table-gray table-hover">
				<tr>
					<th>스케줄 번호</th>
					<th>스케줄 로그 정보</th>
					<th>스케줄 로그 제목</th>
					<th>스케줄 로그 내용</th>
					<th>패키지명</th>
					<th>클래스명</th>
					<th>메서드명</th>
				</tr>
				<tr v-for="list in scheLogInfo">
					<td>{{list.scheduleSeq}}</td>
					<td>{{list.explanation}}</td>
					<td>{{list.logTitle}}</td>
					<td v-if="list.logContents=='작동오류'" style="color: red">
						<a v-on:click="scheErrorLog(list.scheduleSeq)" data-toggle="modal" data-placement="bottom" data-target="#scheErrorInfoPopup" style="color: red;"> {{list.logContents}} </a>
					</td>
					<td v-else>{{list.logContents}}</td>
					<td>{{list.packageName}}</td>
					<td>{{list.className}}</td>
					<td>{{list.methodName}}</td>
				</tr>
			</table>
		</div>
		<ul class="screat_num ta_left" style="margin-top: 50px">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>스케줄 목록</li>
		</ul>
		<div class="payment_way4 ta_left"></div>
		<table class="table table-board table-hover mt_10 ">
			<tr>
				<th>번호</th>
				<th>작업 유형</th>
				<th>작업명</th>
				<th>상태</th>
				<th>표현식</th>
				<th>실행주기</th>
				<th>등록자</th>
				<th>등록일</th>
				<th>스케줄 제어</th>
			</tr>
			<tr v-for="(list, index) in getSchList">
				<td>{{list.scheCode}}</td>
				<td>{{list.scheType}}</td>
				<td>
					<a v-on:click="scheduleinfo(list.scheCode)" data-toggle="modal" data-placement="bottom" data-target="#scheduelInfoPopup">
						{{list.scheWorkTitle}}
					</a>
				</td>
				<td>
					<span v-if="list.scheStatusCode==0">작동대기</span> 
					<span v-if="list.scheStatusCode==2" style="color: blue;">작동완료</span> 
					<span v-if="list.scheStatusCode==3"> 
						<a v-on:click="scheErrorLog(list.scheCode)" data-toggle="modal" data-placement="bottom" data-target="#scheErrorInfoPopup"style="color: red;"> 
							작동오류 
						</a>
					</span> 
					<span v-if="list.scheStatusCode==4">작동중지</span> 
					<span v-if="list.scheStatusCode==5">작동수정</span>
				</td>
				<td>{{list.scheCron}}</td>
				<td>{{list.scheWorkCycle}}</td>
				<td>{{list.scheWriter}}</td>
				<td>{{list.scheDate}}</td>
				<td>
					<div style="width: 100%;">
						<button class="btn btn-creat  fr" v-on:click="deleteSche(list.scheCode)">삭제</button>
						<button class="btn btn-creat  fr" v-on:click="scheduleStop(list.scheCode)">중지</button>
						<button class="btn btn-creat  fr" v-on:click="scheduleRestart(list.scheCode)">재시작</button>
						<button class="btn btn-creat  fr" v-on:click="scheduleinfo(list.scheCode)" type="button" data-toggle="modal" data-placement="bottom" data-target="#scheduelInfoPopup" role="button">수정</button>
					</div>
				</td>
			</tr>
		</table>
		<div>
			<button class="btn btn-creat size_100 fr mt_15" type="button"
				data-toggle="modal" data-placement="bottom"
				data-target="#scheduleInsertPopup" role="button">등록
				</button>
		</div>

		<!--//목록-->
		<div class="cb"></div>
		<div class="buttons">
			<nav aria-label="pagination example" class="dis_in">
				<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage" limit="10" v-show="pagingInfo.records > 0"></b-pagination>
			</nav>
		</div>
		<jsp:include page="/WEB-INF/view/admin/scheduleManage/popup/scheduleInfoPopup.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/admin/scheduleManage/popup/scheErrorInfoPopup.jsp"></jsp:include>
	</div>
</div>
<jsp:include page="/WEB-INF/view/admin/scheduleManage/popup/scheduleInsertPopup.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/admin/scheduleManage/script/scheduleListScript.jsp"></jsp:include>


<!--//내용전체-->