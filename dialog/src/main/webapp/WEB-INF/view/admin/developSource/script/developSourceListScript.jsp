<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var vm = new Vue({
		el : "#dtsourceList",
		data : {
			DevelopSourceList : [],
			pagingInfo: {
                currentPage: 1,
                records: 0,
                perPage: 10,
            },
		},
		methods : {
			selectDevelopSourceList : function() {
				var vm = this;
				$.ajax({
					url : "/developSource/selectDevelopSourceList",
					data : {
						"perPage" : vm.pagingInfo.perPage,
	    				"currentPage" : vm.pagingInfo.currentPage,
					},
					type : 'post',
					success : function(list) {
						vm.DevelopSourceList = list;
					},
					error : function() {
						alert("hhhh");
					}
				})
			},
			devSourceInfo : function(seq) {
				window.location.href = "/developSource/developSourceInfoView?devSourceCode="+ seq;
			},
			selectdevSourceRowCount : function(){
				var vm = this;
				$.ajax({
		    		url:'/developSource/selectdevSourceRowCount',
		    		data:{
		    		},
		    		type:'post',
		    		success: function(records){
		    			vm.pagingInfo.records = records;
		    		},
		    		error: function(){
	    				alert("selectNormalDataRowCount 에러");
	    			}
		    	});
			},
		},
		filters : {},
		watch : {
		},
		mounted : function() {
			var vm = this;
			vm.selectdevSourceRowCount();
			vm.selectDevelopSourceList();
			this.$refs.table.$on('change', function(page){
				if (vm.pagingInfo.currentPage != page) {
					vm.pagingInfo.currentPage = page;
					vm.selectDevelopSourceList();
				}
			});
		},
	});
</script>