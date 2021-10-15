<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
	
	el:"#approvalRequestList" ,
	data: {
	selectApprovalVizRequestList:[],
	selectApprovalDaumRequestList : [],   //다음뉴스 수집 요청 관리자 리스트
	selectApprovalActRequestList : [],   //기타 수집 요청 관리자 리스트
	selectApprovalDaumNewsRequestList : [],
	selectApprovalRssRequestList : [],   //rss뉴스 반출 요청 관리자 리스트
	selectApprovalShopRequestList : [],   //쇼핑 반출 요청 관리자 리스트
	
	daumSort : 0,   // 다음 검색 정렬
	actSort : 0,   // 기타 검색 정렬
	rssSort : 0,   // rss 검색 정렬
	shopSort : 0,   // 쇼핑 검색 정렬
	vizSort : 0,   //시각화 검색 정렬
	daumExportSort:0,
	
	daumSearchWrd: '', // 다음 검색어
	actSearchWrd: '', // 기타 검색어
	rssSearchWrd: '', // rss 검색어
	shopSearchWrd: '', // 쇼핑 검색어
	vizSearchWrd : '',	//시각화 검색어
	daumExportSearchWrd:'',
	 	
	//rss페이징
	rssReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	    //다음 페이징
	daumReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	    },
	    
	   //기타 페이징
	actReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	    //쇼핑 페이징
	shopReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	    //시각화 페이징
	vizReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	daumExportPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
      
      },
      methods: {
    	//시각화 요청 조회
  		selectApprovalVizRequest: function (searched) {
  			var vm = this;
  			if(searched==1){
  				vm.vizReqPaging.currentPage = 1;
  			}
  			$.ajax({
  				url: '/selectApprovalVizRequest',
  				data: {
  					"vizSort" : vm.vizSort,
					"vizSearchWrd" : vm.vizSearchWrd,
					"currentPage" : vm.vizReqPaging.currentPage,
	    			"perPage" : vm.vizReqPaging.perPage,
  				},
  				type: 'post',
  				success: function (list) {
  					console.log(list); 
  					vm.selectApprovalVizRequestList = list.selectVizRequstList;
  					vm.vizReqPaging.records = list.vizRequestRecords;
  				},
  				error: function () {
  				}
  			})
  		},
  		//시각화 검색 옵션
		vizDataSort: function (num) {
			var vm = this;
			vm.vizSort = num; 
			vm.vizReqPaging.currentPage=1;
			vm.selectApprovalVizRequest(0);
		},
		infoApprovalVizlist:function(code){
    	 	$("#pageChange").html(
             "<input type='hidden' name='dataCode' value="+code+">"
            );
           $("#pageChange").attr("action","/dataSet/infoViewDataSetManagement");
           $("#pageChange").submit();
         },
         
      // 다음 뉴스 데이터 수집 요청 관리자 조회
		selectApprovalDaumRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalDaumRequest',
				data: {
					"daumSort" : vm.daumSort,
					"daumSearchWrd" : vm.daumSearchWrd,
					"currentPage" : vm.daumReqPaging.currentPage,
	    			"perPage" : vm.daumReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.selectApprovalDaumRequestList = list;
					vm.selectApprovalDaumRequestRecords();
				},
				error: function () {
// 					alert("에러");
				}
			})
		},
		//다음 뉴스 수집 상태 검색 옵션
		daumDataSort: function (num) {
			var vm = this;
			vm.daumReqPaging.currentPage=1;
			vm.daumSort = num; 
			vm.selectApprovalDaumRequest();
		},
		// 디음 데이터 수집 요청 게시글 수
		selectApprovalDaumRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalDaumRequestRecords',
	    		data:{
	    			"daumSort" : vm.daumSort,
					"daumSearchWrd" : vm.daumSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.daumReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		// 기타 데이터 수집 요청 관리자 조회
		selectApprovalActRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalActRequest',
				data: {
					"actSort" : vm.actSort,
					"actSearchWrd" : vm.actSearchWrd,
					"currentPage" : vm.actReqPaging.currentPage,
	    			"perPage" : vm.actReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalActRequestList = list;
					vm.selectApprovalActRequestRecords();
				},
				error: function () {
// 					alert("에러");
				}
			})
		},
		//기타 수집 상태 검색 옵션
		actDataSort: function (num) {
			var vm = this;
			vm.actReqPaging.currentPage=1;
			vm.actSort = num; 
			vm.selectApprovalActRequest();
		},
		// 기타 데이터 수집 요청 게시글 수
		selectApprovalActRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalActRequestRecords',
	    		data:{
	    			"actSort" : vm.actSort,
					"actSearchWrd" : vm.actSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.actReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		// rss 데이터 반출 요청 관리자 조회
		selectApprovalRssRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalRssRequest',
				data: {
					"rssSort" : vm.rssSort,
					"rssSearchWrd" : vm.rssSearchWrd,
					"currentPage" : vm.rssReqPaging.currentPage,
	    			"perPage" : vm.rssReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalRssRequestList = list;
					vm.selectApprovalRssRequestRecords();
				},
				error: function () {
// 					alert("에러");
				}
			})
		},
		//rss 반출 상태 검색 옵션
		rssDataSort: function (num) {
			var vm = this;
			vm.rssReqPaging.currentPage=1;
			vm.rssSort = num; 
			vm.selectApprovalRssRequest();
		},
		// rss 데이터 반출 요청 게시글 수
		selectApprovalRssRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalRssRequestRecords',
	    		data:{
	    			"rssSort" : vm.rssSort,
					"rssSearchWrd" : vm.rssSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.rssReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		// 쇼핑 데이터 반출 요청 관리자 조회
		selectApprovalShopRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalShopRequest',
				data: {
					"shopSort" : vm.shopSort,
					"shopSearchWrd" : vm.shopSearchWrd,
					"currentPage" : vm.shopReqPaging.currentPage,
	    			"perPage" : vm.shopReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalShopRequestList = list;
					vm.selectApprovalShopRequestRecords();
				},
				error: function () {
// 					alert("에러");
				}
			})
		},
		//쇼핑 반출 상태 검색 옵션
		shopDataSort: function (num) {
			var vm = this;
			vm.shopReqPaging.currentPage=1;
			vm.shopSort = num; 
			vm.selectApprovalShopRequest();
		},
		// 쇼핑 데이터 반출 요청 게시글 수
		selectApprovalShopRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalShopRequestRecords',
	    		data:{
	    			"shopSort" : vm.shopSort,
					"shopSearchWrd" : vm.shopSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.shopReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		
		//다음 뉴스 데이터 반출 요청 조회
		selectApprovalDaumNewsRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalDaumNewsRequest',
				data: {
					"daumSort" : vm.daumExportSort,
					"daumSearchWrd" : vm.daumExportSearchWrd,
					"currentPage" : vm.daumExportPaging.currentPage,
	    			"perPage" : vm.daumExportPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalDaumNewsRequestList = list;
					vm.selectApprovalDaumNewsRequestRecords();
					$("#loading").hide();
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//다음뉴스 반출 상태 검색 옵션
		daumNewsSort: function (num) {
			var vm = this;
			vm.daumExportPaging.currentPage=1;
			vm.daumExportSort = num; 
			vm.selectApprovalDaumNewsRequest();
		},
		// 다음뉴스 데이터 반출 요청 게시글 수
		selectApprovalDaumNewsRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalDaumNewsRequestRecords',
	    		data:{
	    			"daumSort" : vm.daumExportSort,
					"daumSearchWrd" : vm.daumExportSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.daumExportPaging.records = data;
	    		},
	    		error: function(){
    				alert(" 에러");
    			}
	    	});
		},
		
		// 기타 데이터 게시글 seq
		infoMActList: function (actSeq) {
			window.location.href="/myData/infoViewMCollectActRequest?actDataCollectRequestCode="+actSeq;
		},
		// 다음 뉴스 데이터 데이터 게시글 seq
		infoMDaumList: function (daumSeq) {
			window.location.href="/myData/infoViewMCollectDaumRequest?daumNewsDataCollectRequestCode="+daumSeq;
		},
		// 반출 요청 게시글 seq
		infoMExportList: function (rssSeq,type) {
			window.location.href="/myData/infoViewMExportRequest?dataExportRequestCode="+rssSeq+"&&tabType="+type;
		},
      },
      filters: {
      },
      watch: {
      },
      mounted: function () {
    	  var vm = this;
    	$("#${collectTab}").tab('show');
    	$("#${bigTab}").tab('show');
    	vm.selectApprovalDaumRequest();
    	vm.selectApprovalActRequest();
    	vm.selectApprovalRssRequest();
   		vm.selectApprovalShopRequest();
    	vm.selectApprovalDaumNewsRequest();
    	vm.selectApprovalVizRequest(0);
		this.$refs.vizTable.$on('change', function(page){
			if (vm.vizReqPaging.currentPage != page) {
				vm.vizReqPaging.currentPage = page;
				vm.selectApprovalVizRequest(0);
			}
		});
		this.$refs.shopTable.$on('change', function(page){
			if (vm.shopReqPaging.currentPage != page) {
				vm.shopReqPaging.currentPage = page;
				vm.selectApprovalShopRequest();
			}
		});
		this.$refs.daumTable.$on('change', function(page){
			if (vm.daumReqPaging.currentPage != page) {
				vm.daumReqPaging.currentPage = page;
				vm.selectApprovalDaumRequest();
			}
		});
		this.$refs.actTable.$on('change', function(page){
			if (vm.actReqPaging.currentPage != page) {
				vm.actReqPaging.currentPage = page;
				vm.selectApprovalActRequest();
			}
		});
		this.$refs.rssTable.$on('change', function(page){
			if (vm.rssReqPaging.currentPage != page) {
				vm.rssReqPaging.currentPage = page;
				vm.selectApprovalRssRequest();
			}
		});
		this.$refs.daumNewsTable.$on('change', function(page){
			if (vm.daumExportPaging.currentPage != page) {
				vm.daumExportPaging.currentPage = page;
				vm.selectApprovalDaumNewsRequest();
			}
		});
      },
   });
   
</script>