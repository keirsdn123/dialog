<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#datasetList" ,
      data: {
    	  userFlag: ${userFlag},
    	  
    	  selectDatasetList:[],
    	  selectDatasetNewsList:[],
    	  displaySet:0,
    	  selectCategory :[],
    	  categorySeq: 0,
    	  
    	  dataSetSearchWrd:'${dataSetSearchWrd}',
    	  dataSetSearchType:'dataSetTitle',
    	  dataSetList: {
              currentPage: 1,
              records: 0,
              perPage: 10,
          }, 
    	  dataSetNewsList: {
              currentPage: 1,
              records: 0,
              perPage: 10,
          }, 
      },
      methods: {
    	  datasetList : function(){
    		  var vm = this;
    		  
    		  $.ajax({
    			url: "/selectDatasetList", 		
    		  	data :{
    		  		"categorySeq" : vm.categorySeq,
    		  		"dataSetSearchType" : vm.dataSetSearchType,
    		  		"dataSetSearchWrd" : vm.dataSetSearchWrd,
					"currentPage" : vm.dataSetList.currentPage,
	    			"perPage" : vm.dataSetList.perPage,
    		  	},
    		  	type:'post',
    		  	success: function(list){
//     		  		console.log(list);
    		  		vm.selectDatasetList = list.selectDataSetList;
    		  		vm.dataSetList.records = list.dataSetRecords;
    		  	},
    		  	error : function(){
    		  		alert("hhhh");
    		  	}
    		  })
    	  },
		datasetCate: function(seq){
			var vm = this;
			vm.categorySeq = seq;
			vm.dataSetList.currentPage = 1;
			vm.datasetList();
		},
		seletDCategory : function(){
			var vm = this;
			$.ajax({
				url : "/selectDCategory",
				data : {
				},
				type : 'post',
				success : function(list){
					vm.selectCategory = list;
				},
				error : function() {
					alert("hhhh");
				}
			})
		},
		  datasetNewsList : function(){
			  var vm = this;
			  $.ajax({
				url: "/selectDatasetNewsList", 		
			  	data :{
			  		"dataSetSearchType" : vm.dataSetSearchType,
			  		"dataSetSearchWrd" : vm.dataSetSearchWrd,
					"currentPage" : vm.dataSetNewsList.currentPage,
	 				"perPage" : vm.dataSetNewsList.perPage,
			  	},
			  	type:'post',
			  	success: function(list){
			  		vm.selectDatasetNewsList = list.selectDataSetNewsList;
			  		vm.dataSetNewsList.records = list.dataSetNewsRecords;
			  		console.log(vm.dataSetNewsList.records);
			  	},
			  	error : function(){
			  		alert("hhhh");
			  	}
			  })
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
           dataSetInsertView : function(){
			$.ajax({
				url: "/SelectMemberInfo", 		
			  	data :{
			  		
			  	},
			  	type:'post',
			  	success: function(memberInfo){
			  		console.log(memberInfo);
			  		if(memberInfo.memberId==null){
			  			alert("로그인 후 이용해주세요");
			  			window.location.href="/dataSet/dataSetList";
			  		}
			  		if(memberInfo.memberRatingCode==1 || memberInfo.memberRatingCode==2 ){
			  			window.location.href="/dataSet/UserDataSetInsertView";
			  		}
			  		if(memberInfo.memberRatingCode==3 ){
			  			window.location.href="/dataSet/dataSetInsertView";
			  		}
			  	},
			  	error : function(){
			  		alert("hhhh");
			  	}
			  })
          },
          //데이터 셋 검색
          searchSelectDataSet : function(){
        	  var vm = this;
        	  vm.datasetList();
          },
      },
      filters: {
      },
      watch: {
      },
      mounted: function () {
		var vm = this;
		
		vm.datasetList();
		vm.datasetNewsList();
		vm.seletDCategory();
    	  
		this.$refs.dataSetTable.$on('change', function(page){
			if (vm.dataSetList.currentPage != page) {
			   vm.dataSetList.currentPage = page;
			   vm.datasetList(); //조회 메서드
			}
		}); 
		console.log("userFlag="+vm.userFlag);
		if(vm.userFlag == 1){
			this.$refs.dataSetNewsTable.$on('change', function(page){
				if (vm.dataSetNewsList.currentPage != page) {
				   vm.dataSetNewsList.currentPage = page;
				   vm.datasetNewsList(); //조회 메서드
				}
			});
		}
		
      },
   });
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
</script>
