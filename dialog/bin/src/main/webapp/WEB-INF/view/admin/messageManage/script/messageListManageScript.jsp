<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script>

   var vm = new Vue({
      el : "#adminMesList",
      data : {
    	  messageList: [],             //메세지 리스트
    	  requestorSeqList: [],        // 체크박스 리스트
    	  requestorSeqAllList: false,  // 체크박스 전체 선객
    	  searchType: 1, // 검색조건
			options: [
				{text: '내용', value: '1'},
				{text: '작성자', value: '2'},
				{text: '수신자', value: '3'},
			], // 검색옵션
			searchContent: '', // 검색어
			pagingInfo: {
                currentPage: 1,
                records: 0,
                perPage: 10,
            },
			


      },
      methods : {
    	  //검색 및 조회
    	  selectMessageAdmin : function() {
            var vm = this;
            $.ajax({
               url : "/selectMessageAdmin",
               data : {
            	   "searchType" : vm.searchType,
					"searchContent" : vm.searchContent,
            	   "currentPage" : vm.pagingInfo.currentPage,
	    			"perPage" : vm.pagingInfo.perPage,
               },
               type : 'post',
               success : function(list){
    			   vm.selectRow();
                   vm.messageList=list;
					vm.requestorSeqList = [];
					//수료증 발급 대상 All Seq
					vm.requestorSeqAllList = [];
                },
                error : function(){
                   alert("오류");
                }
                })
             },
 			mesgInfo : function(seq) {
				window.location.href = "/messageInfoManage?messageSeq="+ seq;

			},

   			// 쪽지함 전체 체크
   			recAllCheck : function () {
   				vm.requestorSeqList = [];
				console.log($("#recAllCheck").prop("checked"));
   	            if ($("#recAllCheck").prop("checked")) {

   	                for (list in vm.messageList) {
   	                	vm.requestorSeqList.push(vm.messageList[list].messageSeq);
   	                }
   	            }

   	               	            	            
   			},

   			//체크박스 선택
   	        select: function() {
   	            vm.requestorSeqAllList = false;
   	        },
   	        //체크박스 선택 후 받은 쪽지함 삭제
            mesgDel : function(seq){
            	var seqList = JSON.stringify(seq);
                
                alert(seqList);
                $.ajax({
                   url : "/adminMessageDel",
                   dataType : "JSON",
                   data : {
                      "messageSeqs" : seqList,
                   },
                   type : "POST",
                   success: function(){
                	   alert("성공")
                 	  window.location.href="/selectMessageManage";
                   },
                   error : function(){
                	   window.location.href="/selectMessageManage";
                   }
                })
                
             },
   		    //페이징에 필요한 쪽지함 총 행수
   		    selectRow: function(){
   		    	var vm = this;
   		    	$.ajax({
   		    		url:'/selectAdminMessageRow',
   		    		data:{
   		    		"searchType" : vm.searchType,
   					"searchContent" : vm.searchContent,
               	    "currentPage" : vm.pagingInfo.currentPage,
   	    			"perPage" : vm.pagingInfo.perPage,
   		    		},
   		    		type:'post',
   		    		success: function(records){
   		    			vm.pagingInfo.records = records;
   		    			console.log(vm.pagingInfo.records);
   		    			console.log(vm.pagingInfo.perPage);
   		    		},
   		    		error: function(){
   	    				alert("selectAdminQuestionRow 에러");
   	    			}
   		    	});
   		    },
   		    //관리자 쪽지 페이징
  		    selectAdminMessagePaging: function(page){
 		    	var vm = this;
 		    	$.ajax({
 		    		url:'/selectMessagePaging',
 		    		data:{
 	            	   "searchType" : vm.searchType,
 						"searchContent" : vm.searchContent,
 		    			"currentPage" : vm.pagingInfo.currentPage,
 		    			"perPage" : vm.pagingInfo.perPage,
 		    		},
 		    		type:'post',
 		    		success: function(data){
 		    			vm.messageList = data;
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
         vm.selectMessageAdmin();
         vm.selectRow();
 		this.$refs.table.$on('change', function(page){
 			if (vm.pagingInfo.currentPage != page) {
 				vm.pagingInfo.currentPage = page;
 				vm.selectAdminMessagePaging();
 			}
 		});
      },
   });
</script>