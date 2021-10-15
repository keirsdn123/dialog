<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="normalDataTableCheckLabel" aria-hidden="true" id="developSourceInsertPopup">
	<div class="modal-dialog" role="document" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq">| 개발 소스 파일</h5>
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true"> &times; </span>
				</button>
			</div>
			<div class="modal-body">
				<div id="style-3">
					<table class="table table-gray table-hover">
						<colgroup>
							<col width="10%" />
							<col width="50%" />
							<col width="10%" />
							<col width="30%" />
						</colgroup>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>구분</th>
							<th>등록일</th>
						</tr>
						<tr v-for="dSource in devSourceList" v-bind:class="{trSelect : popupDevSourceCode == dSource.devSourceCode}" v-on:click="selectCode(dSource.devSourceCode, dSource.devSourceTitle)">
							<td>{{dSource.devSourceCode}}</td>
							<td>{{dSource.devSourceTitle}}</td>
							<td>{{dSource.devSourceType}}</td>
							<td>{{dSource.devSourceEnrollmentDate}}</td>
						</tr>
					</table>
					<div class="buttons">
						<nav aria-label="pagination example" class="dis_in">
							<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage" limit="10" v-show="pagingInfo.records > 0"></b-pagination>
						</nav>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-cencle" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-creat ml_10" data-dismiss="modal" v-on:click="chekCode">확인</button>
			</div>
		</div>
	</div>
</div>
