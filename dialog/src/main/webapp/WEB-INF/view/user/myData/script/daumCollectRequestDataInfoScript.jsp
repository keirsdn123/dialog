<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#daumCollectRequestInfo",
	data: {
		infoMyDaumCollectRequestList : {},	//다음 뉴스 수집 요청 상세조회
		daumNewsDataCollectRequestCode : ${daumNewsDataCollectRequestCode},	//다음 뉴스 수집 요청 게시글 SEQ

		
	},
	methods: {
		//다음 뉴스 데이터 수집 요청 상세 조회
		infoMyDaumCollectRequest: function () {
			var vm = this;
			$.ajax({
				url: '/infoMyDaumCollectRequest',
				data: {
					"daumNewsDataCollectRequestCode" : vm.daumNewsDataCollectRequestCode,
				},
				type: 'post',
				success: function (list) {
					vm.infoMyDaumCollectRequestList = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},	
		//사용자 탭 타입
		daumList : function (type) {
			window.location.href="/myData/listMyCollectList?tabType="+type;
		},
		//관리자 탭 타입
		daumMList : function (type) {
			window.location.href="/myData/dataApprovalManagement?tabType="+type;
		},
	},
	filters: {
		
	},
	watch: {
	},
	mounted: function () {
		var vm = this;
		vm.infoMyDaumCollectRequest();
	},
});
</script>

