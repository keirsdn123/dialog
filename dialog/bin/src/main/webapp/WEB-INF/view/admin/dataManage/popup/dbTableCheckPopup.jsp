<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시험문제만들기 -->
<div class="modal fade" id="normalDataTableCheck" tabindex="-1" role="dialog" aria-labelledby="normalDataTableCheckLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width:1200px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="normalDataTableCheckLabel">| 일시 데이터 DB 확인</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times; 
					</span>
				</button>
			</div>
			<div class="modal-body" >
				<div class="under_title">
					<p class="fl"><span>|</span> TABLE 명 : {{normalDataTableName}}</p>
				</div>
				<div class="wsize_100 fl mt_15 pr_10 po_r table_sc_x" id="style-3 test">
					<table class="table table-gray wsize_100 ">
						<tr>
							<th v-for="tbColName in normalDatabaseColNameList" nowrap="nowrap">
								{{tbColName}}
							</th>
						</tr>
						<tr v-for="tbRowData in normalDatabaseList">
							<td v-for="tbData in tbRowData">
								{{tbData}}
							</td>
						</tr>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="buttons mt_35">
					<nav aria-label="pagination example" class="dis_in">

						<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage"
									limit="10">
   						</b-pagination>
					</nav>					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-creat ml_10" v-on:click="infoViewMakeStandarData(dataCode, normalDataTableName)">
					표준 데이터 생성
				</button>
			</div>
		</div>
	</div>
</div>