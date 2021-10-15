<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#dataSetVizRequest" ,
      data: {
    	  selectMyVizRequestList:[],
    	  displaySet:2,
    	  vizSort : 0, // 시각화 검색 정렬
    	  vizSearchWrd : '',	//시각화 검색어
    	  
    	  myVizRequest: {
              currentPage: 1,
              records: 0,
              perPage: 10,
          },
      },
      methods: {
    	  selectMyVizRequest: function () {
  			var vm = this;
  			$.ajax({
  				url: '/selectMyVizRequest',
  				data: {
  					"vizSort":vm.vizSort,
  					"vizSearchWrd":vm.vizSearchWrd,
					"currentPage" : vm.myVizRequest.currentPage,
	    			"perPage" : vm.myVizRequest.perPage
  				},
  				type: 'post',
  				success: function (list) {
  					vm.selectMyVizRequestList = list;
  					vm.selectMyVizRequestRoecords();
  				},
  				error: function () {
  					alert("에러");
  				}
  			})
  		},
// 		//시각화 요청 제목 검색
// 		searchMyVizRequest: function(){
// 			var vm = this;
// 			vm.vizReqPaging.currentPage= 1;
// 			vm.selectMyVizRequest();
// 		},
		//시각화 요청 게시글 수
		selectMyVizRequestRoecords: function(){
			var vm = this;
			$.ajax({
				url:'/selectMyVizRequestRoecords',
				data:{
					"vizSort": vm.vizSort,
					"vizSearchWrd" : vm.vizSearchWrd,
				},
				success: function(records){
					vm.myVizRequest.records = records;
				},
				error: function(){
					
				}
			});
		},
		vizDataSort: function(num){
			var vm = this;
			vm.vizSort = num; 
			vm.selectMyVizRequest();
		},
		infoVizlist:function(code){
			var vm = this;
			
    		$.ajax({
    			url:"/selectDatasetType",
    			data:{
    				"dataCode" : code,
    			},
    			type:'post',
    			success: function(type){
    				$("#pageChange").html(
   			            "<input type='hidden' name='dataCode' value="+code+">"
   			            +"<input type='hidden' name='displaySet' value="+vm.displaySet+">"
   			         	+"<input type='hidden' name='typeNormalRegularly' value="+type+">"
   		          	 );
   		       	 	$("#pageChange").attr("action","/dataSet/dataSetListView");
   		   		 	$("#pageChange").submit();
    			},
    			error: function(){
    				
    			}
    		});
			
	   	 	
      	},
      },
      filters: {
      },
      watch: {
      },
      mounted: function () {
    	  var vm = this;
    	  vm.selectMyVizRequest();
    	  
    	  
		this.$refs.myVizRequest.$on('change', function(page){
			if (vm.myVizRequest.currentPage != page) {
				vm.myVizRequest.currentPage = page;
				vm.selectMyVizRequest();
			}
		});
      },
   });
   
</script>