<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="daumCollectRequestInfo">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 데이터 승인 관리 상세조회
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
						<th>작성자</th>
						<td class="bold color_b">{{infoMyDaumCollectRequestList.memberId}}</td>
					</tr>
					<tr>
						<th>수집 단어</th>
						<td class="bold color_b">{{infoMyDaumCollectRequestList.daumNewsRequestCollectWord}}</td>
					</tr>
					<tr>
						<th>요청 날짜</th>
						<td>{{infoMyDaumCollectRequestList.daumNewsRequestCollectDate}}</td>
					</tr>
					<tr>
						<th>수집 기간</th>
						<td>{{infoMyDaumCollectRequestList.daumNewsRequestCollectStartDate}} ~ {{infoMyDaumCollectRequestList.daumNewsRequestCollectEndDate}}</td>
					</tr>
					<tr>
						<th>비고란</th>
						<td>{{infoMyDaumCollectRequestList.daumNewsRequestCollectRemarks}}</td>
					</tr>
					<tr>
						<th>현재 상태</th>
						<td class="text_red" v-if="infoMyDaumCollectRequestList.daumNewsRequestCollectStatus == 'N'">수집 대기</td>
						<td class="text_red" v-if="infoMyDaumCollectRequestList.daumNewsRequestCollectStatus == 'S'">수집 중</td>
						<td class="text_red" v-if="infoMyDaumCollectRequestList.daumNewsRequestCollectStatus == 'Y'">수집 완료</td>
					</tr>
				</tbody>
			</table>
		</div>
		<button class="btn btn-creat fl size_100 mt_20" type="button" v-on:click = "daumMList(0)">목록</button>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/daumCollectRequestDataInfoScript.jsp"></jsp:include>