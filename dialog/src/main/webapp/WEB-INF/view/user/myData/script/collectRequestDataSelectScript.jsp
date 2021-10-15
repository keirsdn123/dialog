<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#collectRequestList",
	data: {
		selectMyDaumCollectRequestList : [],	//다음 뉴스 수집 요청 사용자 리스트
		selectMyActCollectRequestList : [],	// 기타 수집 요청 사용자 리스트
		selectMyVizRequestList:[],	//시각화 요청 사용자 리스트
		
		selectMyRssExportRequestList : [],	//rss 뉴스 반출 요청 사용자 리스트
		selectMyShopExportRequestList : [],	//쇼핑 반출 요청 사용자 리스트
		selectMyDaumExportRequestList :[],
		
		daumSort : 0,	// 다음 검색 정렬
		actSort : 0,	// 기타 검색 정렬
		rssSort : 0,	// rss 검색 정렬
		shopSort : 0,	// 쇼핑 검색 정렬
		vizSort : 0, // 시각화 검색 정렬
		daumExportSort:0,
		
		daumSearchWrd: '', // 다음 검색어
		actSearchWrd: '', // 기타 검색어
		rssSearchWrd: '', // rss 검색어
		shopSearchWrd: '', // 쇼핑 검색어
		vizSearchWrd : '',	//시각화 검색어
		daumExportSearchWrd:'',
		displaySet:2,
		
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
        
        //시각화 요청 페이징
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
		//다음 뉴스 데이터 수집 요청 조회
		selectMyDaumCollectRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectMyDaumCollectRequest',
				data: {
					"daumSort" : vm.daumSort,
					"daumSearchWrd" : vm.daumSearchWrd,
					"currentPage" : vm.daumReqPaging.currentPage,
	    			"perPage" : vm.daumReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectMyDaumCollectRequestList = list;
					vm.selectDaumRequestRecords();
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//다음 뉴스 수집 상태 검색 옵션
		daumDataSort: function (num) {
			var vm = this;
			vm.daumReqPaging.currentPage=1;
			vm.daumSort = num; 
			vm.selectMyDaumCollectRequest();
		},
		// 디음 데이터 수집 요청 게시글 수
		selectDaumRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectDaumRequestRecords',
	    		data:{
	    			"daumSort" : vm.daumSort,
					"daumSearchWrd" : vm.daumSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.daumReqPaging.records = data;
	    		},
	    		error: function(){
    				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		//기타 데이터 수집 요청 조회
		selectMyActCollectRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectMyActCollectRequest',
				data: {
					"actSort" : vm.actSort,
					"actSearchWrd" : vm.actSearchWrd,
					"currentPage" : vm.actReqPaging.currentPage,
	    			"perPage" : vm.actReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectMyActCollectRequestList = list;
					vm.selectActRequestRecords();
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//기타 수집 상태 검색 옵션
		actDataSort: function (num) {
			var vm = this;
			vm.actReqPaging.currentPage=1;
			vm.actSort = num; 
			vm.selectMyActCollectRequest();
		},
		// 기타 데이터 수집 요청 게시글 수
		selectActRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectActRequestRecords',
	    		data:{
	    			"actSort" : vm.actSort,
					"actSearchWrd" : vm.actSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.actReqPaging.records = data;
	    		},
	    		error: function(){
    				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		//RSS 뉴스 데이터 반출 요청 조회
		selectMyRssExportRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectMyRssExportRequest',
				data: {
					"rssSort" : vm.rssSort,
					"rssSearchWrd" : vm.rssSearchWrd,
					"currentPage" : vm.rssReqPaging.currentPage,
	    			"perPage" : vm.rssReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectMyRssExportRequestList = list;
					vm.selectRssRequestRecords();
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//rss 반출 상태 검색 옵션
		rssDataSort: function (num) {
			var vm = this;
			vm.rssReqPaging.currentPage=1;
			vm.rssSort = num; 
			vm.selectMyRssExportRequest();
		},
		// rss 데이터 반출 요청 게시글 수
		selectRssRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectRssRequestRecords',
	    		data:{
	    			"rssSort" : vm.rssSort,
					"rssSearchWrd" : vm.rssSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.rssReqPaging.records = data;
	    		},
	    		error: function(){
    				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		//쇼핑 데이터 반출 요청 조회
		selectMyShopExportRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectMyShopExportRequest',
				data: {
					"shopSort" : vm.shopSort,
					"shopSearchWrd" : vm.shopSearchWrd,
					"currentPage" : vm.shopReqPaging.currentPage,
	    			"perPage" : vm.shopReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectMyShopExportRequestList = list;
					vm.selectShopRequestRecords();
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//쇼핑 반출 상태 검색 옵션
		shopDataSort: function (num) {
			var vm = this;
			vm.shopReqPaging.currentPage=1;
			vm.shopSort = num; 
			vm.selectMyShopExportRequest();
		},
		// 쇼핑 데이터 반출 요청 게시글 수
		selectShopRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectShopRequestRecords',
	    		data:{
	    			"shopSort" : vm.shopSort,
					"shopSearchWrd" : vm.shopSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.shopReqPaging.records = data;
	    		},
	    		error: function(){
    				alert("selectNormalDatabasePaging 에러");
    			}
	    	});
		},
		//시각화 검색 옵션
		vizDataSort: function(num){
			var vm = this;
			vm.vizSort = num; 
			vm.selectMyVizRequest();
		},
		
		//시각화 요청 조회
		selectMyVizRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectMyVizRequest',
				data: {
					"vizSort": vm.vizSort,
					"vizSearchWrd" : vm.vizSearchWrd,
					"currentPage" : vm.vizReqPaging.currentPage,
	    			"perPage" : vm.vizReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					console.log(list); 
					vm.selectMyVizRequestList = list;
					vm.selectMyVizRequestRoecords();
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//시각화 요청 제목 검색
		searchMyVizRequest: function(){
			var vm = this;
			vm.vizReqPaging.currentPage= 1;
			vm.selectMyVizRequest();
		},
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
					vm.vizReqPaging.records = records;
				},
				error: function(){
					
				}
			});
		},
		
		// 기타 게시글 seq
		infoActList: function (actSeq) {
			window.location.href="/myData/infoViewMyCollectActRequest?actDataCollectRequestCode="+actSeq;
		},
		// 다음 뉴스 게시글 seq
		infoDaumList: function (daumSeq) {
			window.location.href="/myData/infoViewMyCollectDaumRequest?daumNewsDataCollectRequestCode="+daumSeq;
		},
		// 반출 요청 게시글 seq
		infoExportList: function (rssSeq,type) {
			window.location.href="/myData/infoViewMyCollectRequest?dataExportRequestCode="+rssSeq+"&&tabType="+type;
		},
		// 시각화 상세조회(seq)
		infoVizlist:function(code){
			var vm =this;
			
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
       	
      //다음 뉴스 데이터 반출 요청 조회
		selectMyDaumNewsExportRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectMyDaumNewsExportRequest',
				data: {
					"daumSort" : vm.daumExportSort,
					"daumSearchWrd" : vm.daumExportSearchWrd,
					"currentPage" : vm.daumExportPaging.currentPage,
	    			"perPage" : vm.daumExportPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectMyDaumExportRequestList = list;
					vm.selectDaumNewsRequestRecords();
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
			vm.selectMyDaumNewsExportRequest();
		},
		// 다음뉴스 데이터 반출 요청 게시글 수
		selectDaumNewsRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectMyDaumNewsExportRecords',
	    		data:{
	    			"daumSort" : vm.daumExportSort,
					"daumSearchWrd" : vm.daumExportSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.daumExportPaging.records = data;
	    		},
	    		error: function(){
    				alert("selectNormalDatabasePaging 에러");
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
		$("#${collectTab}").tab('show');
		$("#${bigTab}").tab('show');
		vm.selectMyDaumCollectRequest();
		vm.selectMyActCollectRequest();
		vm.selectMyVizRequest();
		vm.selectMyRssExportRequest();
		vm.selectMyShopExportRequest();
		vm.selectMyDaumNewsExportRequest();
	  
		this.$refs.shopTable.$on('change', function(page){
			if (vm.shopReqPaging.currentPage != page) {
				vm.shopReqPaging.currentPage = page;
				vm.selectMyShopExportRequest();
			}
		});
		this.$refs.daumTable.$on('change', function(page){
			if (vm.daumReqPaging.currentPage != page) {
				vm.daumReqPaging.currentPage = page;
				vm.selectMyDaumCollectRequest();
			}
		});
		this.$refs.actTable.$on('change', function(page){
			if (vm.actReqPaging.currentPage != page) {
				vm.actReqPaging.currentPage = page;
				vm.selectMyActCollectRequest();
			}
		});
		this.$refs.rssTable.$on('change', function(page){
			if (vm.rssReqPaging.currentPage != page) {
				vm.rssReqPaging.currentPage = page;
				vm.selectMyRssExportRequest();
			}
		});
		this.$refs.vizTable.$on('change', function(page){
			if (vm.vizReqPaging.currentPage != page) {
				vm.vizReqPaging.currentPage = page;
				vm.selectMyVizRequest();
			}
		});
		this.$refs.daumNewsTable.$on('change', function(page){
			if (vm.daumExportPaging.currentPage != page) {
				vm.daumExportPaging.currentPage = page;
				vm.selectMyDaumNewsExportRequest();
			}
		});
		
	},
});
</script>
