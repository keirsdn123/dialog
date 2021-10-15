<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="normalDataTableCheckLabel" aria-hidden="true" id ="developSource">
	<div class="modal-dialog" role="document" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq">| 개발 소스 파일</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"> &times; </span>
				</button>
			</div>
			<div class="modal-body">
				<div id="style-3">
					<table class="table table-gray table-hover">
						<colgroup>
							<col width="70%" />
							<col width="30%" />
						</colgroup>
						<tr>
							<th>제목</th>
							<th>등록일</th>
						</tr>
						<tr v-for="dSource in selectDSourceList" v-bind:class="{trSelect : devSourceCode == dSource.devSourceCode}" v-on:click="backColor(dSource.devSourceCode, dSource.devSourceTitle, dSource.devSourceType)">
							<td>{{dSource.devSourceTitle}}</td>
							<td>{{dSource.devSourceEnrollmentDate}}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-cencle" data-dismiss="modal">
					취소</button>
				<button type="button" class="btn btn-creat ml_10" data-dismiss="modal" v-on:click = "popupCheck()">확인</button>
			</div>
		</div>
	</div>
</div>
