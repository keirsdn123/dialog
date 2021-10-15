<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" id="requestReject" tabindex="-1" role="dialog" aria-labelledby="career" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="career">| 승인거부사유</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true"> &times; </span>
				</button>
			</div>
			<div class="modal-body">
				<textarea class="form-control rounded-0" id="exampleFormControlTextarea1" rows="10" v-model="rejectReason"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-cencle mr_10" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-creat" data-dismiss = "modal" aria-label = "Close" v-on:click="updateApprovalActRequest(infoMyActCollectRequestList.rejectReason)" >확인</button>
			</div>
		</div>
	</div>
</div>
