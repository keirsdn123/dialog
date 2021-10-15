<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#actCollectRequestInfo",
	data: {
		infoMyActCollectRequestList : {},	//기타 수집 요청 사용자 상세조회
		actDataCollectRequestCode : ${actDataCollectRequestCode},	//기타 수집 요청 게시글 SEQ
		rejectReason : '',	//승인 거부 사유
	},
	methods: {
		//기타 데이터 수집 요청 상세 조회
		infoMyActCollectRequest: function () {
			var vm = this;
			$.ajax({
				url: '/infoMyActCollectRequest',
				data: {
					"actDataCollectRequestCode" : vm.actDataCollectRequestCode,
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.infoMyActCollectRequestList = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},	
		//사용자 탭 타입
		actList : function (type) {
			window.location.href="/myData/listMyCollectList?tabType="+type;
		},//관리자 탭 타입
		actMList : function (type) {
			window.location.href="/myData/dataApprovalManagement?tabType="+type;
		},
		//기타 데이터 수집 요청 관리자 승인 거부
		updateApprovalActRequest : function () {
			var vm = this;
			swal({
				title: "수집 거부 하시겠습니까?",
				text : "한 번 수집 거부 후, 취소할 수 없습니다. 수집 거부하시겠습니까?",
				type: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소',
				confirmButtonClass: 'btn',
				cancelButtonClass: 'btn btn-cencle',
				allowOutsideClick:false, //밖에 클릭해도 안 없어짐
				allowEscapeKey:false, //esc 눌러도 안 없어짐
			}).then(function(isConfirm){
			if(isConfirm){
			$.ajax({
				url: '/updateApprovalActRequest',
				data: {
					"actDataCollectRequestCode" : vm.actDataCollectRequestCode,
					"rejectReason" : vm.rejectReason,
				},
				type: 'post',
				success: function () {
					vm.infoMyActCollectRequest();
				},
				error: function () {
					swal({
						title: "수집 거부 실패",
						type: 'error',
						confirmButtonColor: '#3085d6',
						confirmButtonText: '확인',
						confirmButtonClass: 'btn',
					})
				}
			})
			}
			}).catch(swal.noop);
		}
	},
	filters: {
		
	},
	watch: {
	},
	mounted: function () {
		var vm = this;
		vm.infoMyActCollectRequest();
	},
});
</script>