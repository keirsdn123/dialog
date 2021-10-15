<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="standarData">
	<div class="full_box wsize_90" >
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 데이터 표준화
			</p>
		</div>
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>시각화 요청 설명</li>
		</ul>
		<div class="payment_way2 ta_left">
			<input type="text" class="form-control wsize_100 fl" v-model="vizRequests" readonly>
		</div>
<!-- 데이터 미리보기 테이블 -->
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>데이터 가공</li>
		</ul>
		<div class="payment_way2 fl pr_10 table_sc17" style="height: 600px !important;">
			<table class="table table-gray wsize_100">
				<tr>
					<th v-for="list in dbDatasetCoList" class="bold fon_md">
						<label	class="custom-control custom-checkbox mt_5"> <input type="checkbox" class="custom-control-input" v-bind:value="list" v-model="selecColumn"> 
						<span class="custom-control-indicator"></span> 
						{{list.columnName}}
						</label>
					</th>
				</tr>
				<tr v-for="dbdtlist in dbDatasetList">
					<td v-for="(value) in dbdtlist" class="ta_center">{{value}}</td>
				</tr>
			</table>		
		</div>
		<div class="button_div">
				<button type="button" class="btn btn-creat size_100 fl ml_10 subtn" v-on:click="standardBtn(1)">추가</button>
				<button type="button" class="btn btn-creat size_120 fl ml_10 subtn" data-toggle="modal" data-placement="bottom" v-on:click="standardBtn(2)">값 변경</button>
				<button type="button" class="btn btn-creat size_120 fl ml_10 subtn" data-toggle="modal" data-placement="bottom" v-on:click="standardBtn(3)">컬럼 합치기</button>
				<button type="button" class="btn btn-creat size_120 fl ml_10 subtn" data-toggle="modal" data-placement="bottom" v-on:click="standardBtn(4)">키워드 빈도</button>
				<button type="button" class="btn btn-creat size_120 fr ml_10 subtn" v-on:click="standardCancle()">되돌리기</button>
		</div>
<!-- 가공 컬럼 명 및 레이블 미리보기 테이블-->
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>가공 목록</li>
		</ul>
		<div class="payment_way3">
			<ul class="screat_num ta_left">
				<li><span class="mr_5 re_num" aria-hidden="true"></span>수치 데이터</li>
			</ul>
			<table class="table table-gray">
				<tr>
					<th class="bold fon_md">표준 컬럼명 / 레이블</th>
					<th class="bold fon_md">표준 컬럼명 / 레이블</th>
					<th class="bold fon_md">표준 컬럼명 / 레이블</th>
					<th class="bold fon_md">표준 컬럼명 / 레이블</th>
					<th class="bold fon_md">표준 컬럼명 / 레이블</th>
				</tr>
				<tr>
					<td v-for="toTe in totalObject"  v-if="toTe.stDataType=='int' || toTe.stDataType=='double'">{{toTe.stColNme}} / {{toTe.stLableNme}}</td>
				</tr>
			</table>
			<ul class="screat_num ta_left">
				<li><span class="mr_5 re_num" aria-hidden="true"></span>문자 데이터</li>
			</ul>
			<table class="table table-gray">
				<tr>
					<th class="bold fon_md">표준 컬럼명</th>
					<th class="bold fon_md">표준 컬럼명</th>
					<th class="bold fon_md">표준 컬럼명</th>
					<th class="bold fon_md">표준 컬럼명</th>
					<th class="bold fon_md">표준 컬럼명</th>
				</tr>
				<tr>
					<td v-if="toTe.stDataType =='varchar'" v-for="toTe in totalObject">{{toTe.stColNme}}</td>
				</tr>
			</table>
		</div>
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>쿼리 미리보기</li>
			<li>- 실행될 쿼리 미리보기 입니다. 확인바랍니다.</li>
		</ul>
		<div class="payment_way2">
			<div class="service_box">
				<div class="service_box pdstyle">
					<div class="fl">
						<b>SELECT</b>
					</div>
					<textarea class="form-control rounded-0 suarea" rows="5" v-html="setQuery()" v-bind:readonly="btnFlag"></textarea>				
				</div>
				<div class="fl pttop_10">
					<b>FROM {{normalDataTableTitle}}</b>
				</div>
			</div>
		</div>
		<div class="cb"></div>
		<div class="buttons mt_10">
			<button class="btn btn-creat wsize_10 fr" role="button" v-on:click="insertStandarData()">완료</button>
		</div>
	</div>
	<form id="pageChange" method="post"></form>
	<jsp:include page="/WEB-INF/view/admin/dataManage/popup/standarPlusPopup.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/admin/dataManage/popup/standarProcessPopup.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/admin/dataManage/popup/standarProcessPopup2.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/admin/dataManage/popup/standarKeyPopup.jsp"></jsp:include>
</div>
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/admin/dataManage/script/standarViewScript.jsp"></jsp:include>

