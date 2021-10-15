<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="rssExportRequestInfo">
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
				<tr>
					<th>단어</th>
					<td>{{infoMyRssExportRequestList.exportCollectWord}}</td>
				</tr>
				<tr>
					<th>요청 데이터 셋</th>
					<td>{{infoMyRssExportRequestList.datasetName}}</td>
				</tr>
				<tr>
					<th>요청 날짜</th>
					<td>{{infoMyRssExportRequestList.exportCollectDate}}</td>
				</tr>
				<tr>
					<th>비고란</th>
					<td>{{infoMyRssExportRequestList.exportCollectRemarks}}</td>
				</tr>
				<tr>
					<th>수집 기간</th>
					<td>{{infoMyRssExportRequestList.exportCollectStartDate}} ~ {{infoMyRssExportRequestList.exportCollectEndDate}}</td>
				</tr>
				<tr>
					<th>요청 상태</th>
					<td class="text_red" v-if="infoMyRssExportRequestList.exportCollectStatus == 'N'">반출 대기</td>
					<td class="text_red" v-if="infoMyRssExportRequestList.exportCollectStatus == 'S'">반출 중</td>
					<td class="text_red" v-if="infoMyRssExportRequestList.exportCollectStatus == 'Y'">반출 완료</td>
				</tr>
				<tr>
					<th>첨부파일</th>
						<td style="text-align:left;">
							<a v-on:click="exportFileDownload">{{exportFile.exportFileTitle}}</a>
						</td>
				</tr>
				</tbody>
			</table>
		</div>
		<button class="btn btn-creat fl size_100 mt_20" type="button"  v-on:click = "exportList(${tabType})">목록</button>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/rssExportRequestDataInfoScript.jsp"></jsp:include>
