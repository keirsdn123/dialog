<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="modal fade" id="standar_popkey" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width:450px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">| 키워드 빈도</h5>
			</div>
			<div class="modal-body" >
				<div class="po_r" id="style-3" >
					<table class="table table-sss02 wsize_100">
						<tr>
							<th> <span class="red02">＊</span>표준화 유형</th>
							<td class="text-left">
								<span>수치데이터</span>
							</td>
						</tr>
						<tr>
							<th> <span class="red02">＊</span>선택된 컬럼</th>
							<td class="text-left">
								<span v-for="ss in selecColumn">{{ss.columnName}}</span>
							</td>
						</tr>
					</table>
					<input class="fl wsize_100" placeholder=" count할 키워드를  입력하세요." v-model="keyword" id="keywordText" v-on:keyup.enter="saveStandar(5)">
				</div>
			</div>
			<div class="modal-footer" id="concatQuery">
				<button type="button" class="btn btn-cencle" v-on:click="cancelPopup(5)">
					닫기
				</button>
				<button type="button" class="btn btn-creat" v-on:click="saveStandar(5)">
					저장
				</button>
			</div>
		</div>
	</div>
</div>