<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script>

   var vm = new Vue({
      el : "#queList",
      data : {
    	  currentPage: 1,
    	  perPage:10,
    	  	memberList:{},
			questionList: [],
			noticeCode: '',
    	 	requestorSeqList: [],        // 체크박스 리스트
    	    requestorSeqAllList: false,  // 체크박스 전체 선객
    	    searchType: 1, // 검색조건
			options: [
				{text: '제목', value: '1'},
				{text: '내용', value: '2'},
				{text: '등록자', value: '3'},
			], // 검색옵션
			searchContent: '', // 검색어
			pagingInfo: {
                currentPage: 1,
                records: 0,
                perPage: 10,
            },
            noticeSort: 0,
            selectQuestionRow:[],
				
      },
      methods : {
	  		//검색 옵션
	  		noticeViewSort: function(num){
	  			var vm = this;
	  			vm.noticeSort = num; 
	  			vm.selectQuestionList();
	  		},
    	  
          selectMemberRating : function() {
              var vm = this;
              $.ajax({
                 url : "/selectMemberRating",
                 data : {
                 },
                 type : 'post',
                 success : function(list){
                	 console.log(list);
                     vm.memberList=list;
                     console.log()
                  },
                  error : function(){
                     alert("오류");
                  }
                  })
               },
          //검색 및 조회
           selectQuestionList : function() {
            var vm = this;
            $.ajax({
               url : "/selectQuestionList",
               data : {
            	    "noticeSort": vm.noticeSort,
	    			"currentPage" : vm.pagingInfo.currentPage,
	    			"perPage" : vm.pagingInfo.perPage,
					"searchType" : vm.searchType,
					"searchContent" : vm.searchContent,
               },
               type : 'post',
               success : function(list){
            	   vm.selectRow();
                   vm.questionList=list;
					vm.requestorSeqList = [];
					//수료증 발급 대상 All Seq
					vm.requestorSeqAllList = [];
                },
                error : function(){
                   alert("오류");
                }
                })
             },

 			queInfo : function(seq) {
 				var vm=this;
 				$.ajax({
 					type: "POST",
 					url:"/updateQuestionViews",					
 					data:{
 						'noticeCode' : seq,
 					},
 					success: function(){
 					},
 					error: function(){
 						alert("오류");
 					}			
 				})
 				window.location.href = "/questionInfo?noticeCode="+ seq;

			}, 
   			//체크박스 선택
   	        select: function(seq) {
   	            vm.requestorSeqAllList = false;
   	        },
  			//  전체 체크
   			recAllCheck : function () {
   				vm.requestorSeqList = [];
				console.log($("#recAllCheck").prop("checked"));
   	            if ($("#recAllCheck").prop("checked")) {

   	                for (list in vm.questionList) {
   	                	vm.requestorSeqList.push(vm.questionList[list].noticeCode);
   	                }
   	            }

   	               	            	            
   			},
   	        //체크박스 선택 후 받은 쪽지함 삭제
            QusDel : function(seq){
            	var seqList = JSON.stringify(seq);
                
                alert(seqList);
                $.ajax({
                   url : "/questionDel",
                   dataType : "JSON",
                   data : {
                      "questionObject" : seqList,
                   },
                   type : "POST",
                   success: function(){
                	   alert("성공")
                 	  window.location.href="/question";
                   },
                   error : function(){
                	   window.location.href="/question";
                   }
                })
                
             },
 		    //페이징에 필요한 문의사항 총 행수
 		    selectRow: function(){
 		    	var vm = this;
 		    	$.ajax({
 		    		url:'/selectQuestionRow',
 		    		data:{
						"searchType" : vm.searchType,
						"searchContent" : vm.searchContent,
 		    		},
 		    		type:'post',
 		    		success: function(records){
 		    			vm.pagingInfo.records = records;
 		    			console.log(vm.pagingInfo.records);
 		    			console.log(vm.pagingInfo.perPage);
 		    		},
 		    		error: function(){
 	    				alert("selectQuestionRow 에러");
 	    			}
 		    	});
 		    },
 		    selectQuestionPaging: function(page){
		    	var vm = this;
		    	$.ajax({
		    		url:'/selectQuestionPaging',
		    		data:{
						"searchType" : vm.searchType,
						"searchContent" : vm.searchContent,
		    			"noticeCode" : vm.questionList.noticeCode,
		    			"currentPage" : vm.pagingInfo.currentPage,
		    			"perPage" : vm.pagingInfo.perPage,
		    		},
		    		type:'post',
		    		success: function(data){
		    			vm.questionList = data;
		    		},
		    		error: function(){
	    				alert("selectNormalDatabasePaging 에러");
	    			}
		    	});
		    },
      },

      filters : {

      },
      watch : {

      },
      mounted : function() {
         var vm = this;
         vm.selectQuestionList();
         vm.selectMemberRating();
         vm.selectRow();
		this.$refs.table.$on('change', function(page){
			if (vm.pagingInfo.currentPage != page) {
				vm.pagingInfo.currentPage = page;
				vm.selectQuestionPaging();
			}
		});
      },
   });
</script>