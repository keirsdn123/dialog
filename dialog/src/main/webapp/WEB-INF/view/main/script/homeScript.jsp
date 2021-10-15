<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
	var vm = new Vue({
		el:"#mainPage",
		data: {
			datasetList: [],
			reportList: [],
			displaySet:0,
			reportDisplaySet:0,
			
			datasetCount: 0,
			reportCount: 0,
			vizCount: 0,
			
			rating: 0,
			
			dataSetSearchWrd: '',
		},
		methods: {
			selectBestDataList: function(){
				var vm = this;
				$.ajax({
					url: '/selectBestDataList',
					data: {
						
					},
					type: 'post',
					success: function(data){
						vm.datasetList =  data;
					},
					error: function(){
						alert("selectBestDataList 에러");
					}
				});
			},
			
			selectBestReportList: function(){
				var vm = this;
				$.ajax({
					url:'/selectBestReportList',
					data:{},
					type:'post',
					success: function(data){
						vm.reportList = data;
					},
					error: function(){
						alert("selectBestReportList 에러");
					}
				});
			},
			
			dataSetListView : function(code, type){
				$("#pageChange").html(
					"<input type='hidden' name='dataCode' value="+code+">"
					+"<input type='hidden' name='displaySet' value="+vm.displaySet+">"
					+"<input type='hidden' name='typeNormalRegularly' value="+type+">"
				);
				$("#pageChange").attr("action","/dataSet/dataSetListView");
				$("#pageChange").submit();
			},
			
			reportListView : function(code){
				$("#pageChange").html(
					"<input type='hidden' name='reportCode' value="+code+">"
					+"<input type='hidden' name='reportDisplaySet' value="+vm.reportDisplaySet+">"
				);
				$("#pageChange").attr("action","/report/reportView?reportDisplaySet="+vm.reportDisplaySet);
				$("#pageChange").submit(); 
			},
			
			selectDatasetList : function(){
				window.location.href="/dataSet/dataSetList";
			},
			
			selectReportList : function(){
				window.location.href="/report/reportList";
			},
			
			selectSearchedData : function(){
				$("#pageChange").html(
					"<input type='hidden' name='dataSetSearchWrd' value="+vm.dataSetSearchWrd+">"
				);
				$("#pageChange").attr("action","/dataSet/dataSetList");
				$("#pageChange").submit();
			},
			selectCount: function(){
				var vm = this;
				$.ajax({
					url:'/selectCount',
					success: function(countMap){
						vm.datasetCount = countMap.datasetCount;
						vm.reportCount = countMap.reportCount;
						vm.vizCount = countMap.vizCount;
						vm.rating = countMap.rating;
					},
					error: function(){
						alert("selectCount 에러");
					}
				});
			},
		},
		filters: {
						
		},
		watch : {
			
		},
		mounted: function(){
			var vm = this;
			vm.selectBestDataList();
			vm.selectBestReportList();
			vm.selectCount();
		},
	});
</script>