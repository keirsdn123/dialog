<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#rssExportRequestInfo",
	data: {
		infoMyRssExportRequestList : {},	//rss 반출 요청 상세조회
		dataExportRequestCode : ${dataExportRequestCode},	//rss 반출 요청 게시글 SEQ
		exportFile : [],
	},
	methods: {
		//rss 데이터 수집 요청 상세 조회
		infoMyRssExportRequest: function () {
			var vm = this;
			$.ajax({
				url: '/infoMyRssExportRequest',
				data: {
					"dataExportRequestCode" : vm.dataExportRequestCode,
				},
				type: 'post',
				success: function (list) {
					vm.infoMyRssExportRequestList = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//사용자 탭 타입
		exportList : function (type) {
			window.location.href="/myData/listMyCollectList?tabType="+type;
		},
		//관리자 탭 타입
		exportMList : function (type) {
			window.location.href="/myData/dataApprovalManagement?tabType="+type;
		},
		
		selectDataExportFile: function () {
			var vm = this;
			$.ajax({
				url: '/selectDataExportFile',
				data: {
					"dataExportRequestCode" : vm.dataExportRequestCode,
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.exportFile = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},
		exportFileDownload: function () {
			var vm = this;
			$.fileDownload("/exportFileDownload", {
  				httpMethod:"POST",
				aync: false,
				data: {
					"exportFileRoute" : vm.exportFile.exportFileRoute,
					"exportFileTitle" : vm.exportFile.exportFileTitle,
					"exportExtension" : vm.exportFile.exportExtension,
				},
				prepareCallback: function () {
					$("#loading").show();
				},
				successCallback: function(cat){
					$('#loading').hide();
				},
				failCallback: function(){
					console.log("실패적");
					swal({
		                  title: "파일 다운로드 오류",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
					$('#loading').hide();
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
		vm.infoMyRssExportRequest();
		vm.selectDataExportFile();
	},
});
function rssList(type){
	window.location.href="/myData/listMyCollectList?tabType="+type;
	
	alert("bbbbbbbbbbbbbbbb"+type);
}
</script>

