<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="modal fade" id="standar_popPlus" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width:600px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">| �÷� ��ġ��</h5>
			</div>
<!-- �˾��ٵ� -->
			<div class="modal-body" >
<!-- �������� -->
				<div class="po_r" id="style-3" >
					<table class="table table-sss02 wsize_100">
						<tr>
							<th> <span class="red02">��</span>ǥ��ȭ �÷���Ī</th>
							<td class="text-left">
								<input type="text" v-model="standarColumName" id="standarColumName">
							</td>
						</tr>
						<tr>
							<th> <span class="red02">��</span>���õ� �÷�</th>
							<td class="text-left">
								<span v-for="ss in selecColumn">{{ss.columnName}} </span>
							</td>
						</tr>
						<tr id="aa">
							<th> <span class="red02">��</span>��� ����</th>
							<td class="text-left">
								<button type="button" v-on:click="cal(1)">�հ�</button>
								<button type="button" v-on:click="cal(2)">���</button>
								<button type="button" v-on:click="cal(3)">��</button>
								<button type="button" v-on:click="cal(4)">������</button>
							</td>
						</tr>
					</table>
				</div>
<!-- ���� �� �̸����� -->
				<div class="wsize_100 fl po_r bd_d mt_10" id="calQueryT">
					<textarea class="form-control rounded-0" rows="6" style="background-color: white;" readonly>{{calQueryText}}</textarea>
				</div>
				<div class="wsize_100 fl po_r bd_d mt_10" id="concatQueryT">
					<textarea class="form-control rounded-0" rows="6" style="background-color: white;" readonly>{{concatQueryText}}</textarea>
				</div>
				</div>
				<div class="modal-footer" id="calQuery">
					<button type="button" class="btn btn-cencle" v-on:click="cancelPopup(1)">
						�ݱ�
					</button>
					<button type="button" class="btn btn-creat" v-on:click="saveStandar(1)">
						����
					</button>
				</div>
				<div class="modal-footer" id="concatQuery">
					<button type="button" class="btn btn-cencle" v-on:click="cancelPopup(2)">
						�ݱ�
					</button>
					<button type="button" class="btn btn-creat" v-on:click="saveStandar(2)">
						����
					</button>
				</div>
			</div>
		</div>
	</div>