<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#actCollectRequestMInfo",
	data: {
		infoApprovalActRequestList : {},	//기타 수집 요청 상세조회
		actDataCollectRequestCode : ${actDataCollectRequestCode},	//기타 수집요청 게시글 seq
		
		rejectReason : '',	//승인 거부 사유
	},
	methods: {
		//기타 데이터 수집 요청 상세 조회
		infoApprovalActRequest: function () {
			var vm = this;
			$.ajax({
				url: '/infoApprovalActRequest',
				data: {
					"actDataCollectRequestCode" : vm.actDataCollectRequestCode,
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.infoApprovalActRequestList = list;
				},
				error: function () {
// 					alert("에러");
				}
			})
		},	
		
		//기타 데이터 수집 요청 승인 거부
		updateApprovalActRequest : function () {
			var vm = this;
			$.ajax({
				url: '/updateApprovalActRequest',
				data: {
					"actDataCollectRequestCode" : vm.actDataCollectRequestCode,
					"rejectReason" : vm.rejectReason,
				},
				type: 'post',
				success: function () {
					vm.infoApprovalActRequest();
				},
				error: function () {
// 					alert("에러");
				}
			})
		},	
		
	},
	filters: {
		
	},
	watch: {
	},
	mounted: function () {
		var vm = this;
		vm.infoApprovalActRequest();
	},
});
</script>

