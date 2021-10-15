<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="modal fade" id="standar_popPlus" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width:600px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">| 컬럼 합치기</h5>
			</div>
<!-- 팝업바디 -->
			<div class="modal-body" >
<!-- 유형선택 -->
				<div class="po_r" id="style-3" >
					<table class="table table-sss02 wsize_100">
						<tr>
							<th> <span class="red02">＊</span>표준화 컬럼명칭</th>
							<td class="text-left">
								<input type="text" v-model="standarColumName" id="standarColumName">
							</td>
						</tr>
						<tr>
							<th> <span class="red02">＊</span>선택된 컬럼</th>
							<td class="text-left">
								<span v-for="ss in selecColumn">{{ss.columnName}} </span>
							</td>
						</tr>
						<tr id="aa">
							<th> <span class="red02">＊</span>계산 조건</th>
							<td class="text-left">
								<button type="button" v-on:click="cal(1)">합계</button>
								<button type="button" v-on:click="cal(2)">평균</button>
								<button type="button" v-on:click="cal(3)">곱</button>
								<button type="button" v-on:click="cal(4)">나누기</button>
							</td>
						</tr>
					</table>
				</div>
<!-- 쿼리 문 미리보기 -->
				<div class="wsize_100 fl po_r bd_d mt_10" id="calQueryT">
					<textarea class="form-control rounded-0" rows="6" style="background-color: white;" readonly>{{calQueryText}}</textarea>
				</div>
				<div class="wsize_100 fl po_r bd_d mt_10" id="concatQueryT">
					<textarea class="form-control rounded-0" rows="6" style="background-color: white;" readonly>{{concatQueryText}}</textarea>
				</div>
				</div>
				<div class="modal-footer" id="calQuery">
					<button type="button" class="btn btn-cencle" v-on:click="cancelPopup(1)">
						닫기
					</button>
					<button type="button" class="btn btn-creat" v-on:click="saveStandar(1)">
						저장
					</button>
				</div>
				<div class="modal-footer" id="concatQuery">
					<button type="button" class="btn btn-cencle" v-on:click="cancelPopup(2)">
						닫기
					</button>
					<button type="button" class="btn btn-creat" v-on:click="saveStandar(2)">
						저장
					</button>
				</div>
			</div>
		</div>
	</div>