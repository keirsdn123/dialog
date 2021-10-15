<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="actCollectRequestInfo">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 나의 요청 목록 상세조회
			</p>
		</div>
		<div class="cb"></div>
		<!--상세조회 -->
		<div class="photo_write mt_30">
			<table class="table table-ddd01">
				<colgroup>
					<col width="150px" />
					<col width="calc(50% - 150px)" />
					<col width="150px" />
					<col width="calc(50% - 150px)" />
				</colgroup>
				<tbody>
					<tr>
						<th>사이트 명</th>
						<td>{{infoMyActCollectRequestList.actRequestCollectSiteName}}</td>
					</tr>
					<tr>
						<th>수집 URL</th>
						<td>{{infoMyActCollectRequestList.actRequestCollectSiteUrl}}
						</td>
					</tr>
					<tr>
						<th>상세 설명</th>
						<td>{{infoMyActCollectRequestList.actRequestCollectDescription}}</td>
					</tr>

					<tr>
						<th>요청 날짜</th>
						<td>{{infoMyActCollectRequestList.actRequestCollectDate}}</td>
					</tr>
					<tr>
						<th>현재 상태</th>
						<td class="text_red" v-if="infoMyActCollectRequestList.actRequestCollectStatus == 'N'">수집 대기</td>
						<td class="text_red" v-if="infoMyActCollectRequestList.actRequestCollectStatus == 'S'">수집 중</td>
						<td class="text_red" v-if="infoMyActCollectRequestList.actRequestCollectStatus == 'Y'">수집 완료</td>
						<td class="text_red" v-if="infoMyActCollectRequestList.actRequestCollectStatus == 'D'">수집 거부</td>
					</tr>
					<tr v-if="infoMyActCollectRequestList.actRequestCollectStatus == 'D'">
						<th>수집 거부 사유</th>
						<td>{{infoMyActCollectRequestList.rejectReason}}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<button class="btn btn-creat fl size_100 mt_20" type="button" v-on:click = "actList(1)">목록</button>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/actCollectRequestDataInfoScript.jsp"></jsp:include>
