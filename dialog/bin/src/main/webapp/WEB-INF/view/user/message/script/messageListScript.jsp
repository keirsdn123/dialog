<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script>

   var vm = new Vue({
      el : "#mesList",
      data : {
    	  messageList: [],
    	  requestorSeqList: [],
    	  requestorSeqAllList: false,
    	  giveMessageList:[],
			pagingInfo: {
                currentPage: 1,
                records: 0,
                perPage: 10,
            },
			pagingInfo2: {
                currentPage: 1,
                records: 0,
                perPage: 10,
            },

      },
      methods : {
    	  selectMessageList : function() {
            var vm = this;
            $.ajax({
               url : "/selectMessageList",
               data : {
            	   "currentPage" : vm.pagingInfo.currentPage,
	    			"perPage" : vm.pagingInfo.perPage,
               },
               type : 'post',
               success : function(list){
    				vm.selectGivenRow();
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
 				var vm=this;
 				$.ajax({
 					type: "POST",
 					url:"/updateMessageViews",					
 					data:{
 						'messageSeq' : seq,
 					},
 					success: function(){
 					},
 					error: function(){
 						alert("오류");
 					}			
 				})
 				window.location.href = "/messageInfoView?messageSeq="+ seq;

			}, 
			//받은쪽지함 행수 
   		    selectGivenRow: function(){
   		    	var vm = this;
   		    	$.ajax({
   		    		url:'/selectGivenMessageRow',
   		    		data:{
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
   		    //받은 쪽지 페이징
  		    selectGivenMessagePg: function(page){
 		    	var vm = this;
 		    	$.ajax({
 		    		url:'/selectGivenMessagePaging',
 		    		data:{
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
   			//받은 쪽지함 전체 체크
   			recAllCheck : function () {
   				vm.requestorSeqList = [];
				console.log($("#recAllCheck").prop("checked"));
   	            if ($("#recAllCheck").prop("checked")) {

   	                for (list in vm.messageList) {
   	                	vm.requestorSeqList.push(vm.messageList[list].messageSeq);
   	                }
   	            }

   	               	            	            
   			},
 		    //보낸 쪽지함 조회
    	  selectGiveMessageList : function() {
              var vm = this;
              $.ajax({
                 url : "/selectGiveMessageList",
                 data : {
              	   "currentPage" : vm.pagingInfo2.currentPage,
	    			"perPage" : vm.pagingInfo2.perPage,
                 },
                 type : 'post',
                 success : function(list){
					vm.selectGiveRow();
                     vm.giveMessageList=list;
 					vm.requestorSeqList = [];
					vm.requestorSeqAllList = [];
                  },
                  error : function(){
                     alert("오류");
                  }
                  })
               },
               
               
   			//보낸쪽지함 행수 
  		    selectGiveRow: function(){
  		    	var vm = this;
  		    	$.ajax({
  		    		url:'/selectGiveMessageRow',
  		    		data:{
  		    		},
  		    		type:'post',
  		    		success: function(records){
  		    			vm.pagingInfo2.records = records;
  		    			console.log(vm.pagingInfo2.records);
  		    			console.log(vm.pagingInfo2.perPage);
  		    		},
  		    		error: function(){
  	    				alert("selectGiveMessageRow 에러");
  	    			}
  		    	});
  		    },
   		    //보낸쪽지함 페이징
  		    selectGiveMessagePg: function(page){
 		    	var vm = this;
 		    	$.ajax({
 		    		url:'/selectGiveMessagePaging',
 		    		data:{
 		    			"currentPage" : vm.pagingInfo2.currentPage,
 		    			"perPage" : vm.pagingInfo2.perPage,
 		    		},
 		    		type:'post',
 		    		success: function(data){
 		    			vm.giveMessageList = data;
 		    		},
 		    		error: function(){
 	    				alert("selectGiveMessagePaging 에러");
 	    			}
 		    	});
 		    },
   			//보낸 쪽지함 전체 체크
   			senAllCheck : function () {
   				vm.requestorSeqList = [];
				console.log($("#senAllCheck").prop("checked"));
   	            if ($("#senAllCheck").prop("checked")) {

   	                for (glist in vm.giveMessageList) {
   	                	vm.requestorSeqList.push(vm.giveMessageList[glist].messageSeq);
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
                   url : "/recMessageDel",
                   dataType : "JSON",
                   data : {
                      "messageSeqs" : seqList,
                   },
                   type : "POST",
                   success: function(){
                	   alert("성공")
                 	  window.location.href="/selectMessage";
                   },
                   error : function(){
                	   window.location.href="/selectMessage";
                   }
                })
                
             },

             //보낸 쪽지함 삭제
             senMessageDel : function(seq){
             	var seqList = JSON.stringify(seq);
                 
                 alert(seqList);
                 $.ajax({
                    url : "/senMessageDel",
                    dataType : "JSON",
                    data : {
                       "messageSeqs" : seqList,
                    },
                    type : "POST",
                    success: function(){
                 	   alert("성공")
                  	  window.location.href="/selectMessage";
                    },
                    error : function(){
                 	   window.location.href="/selectMessage";
                    }
                 })
                 
              },
         
      },

      filters : {

      },
      watch : {

      },
      mounted : function() {
         var vm = this;
         vm.selectMessageList();
         vm.selectGivenRow();
         vm.selectGiveRow();
  		this.$refs.table.$on('change', function(page){
 			if (vm.pagingInfo.currentPage != page) {
 				vm.pagingInfo.currentPage = page;
 				vm.selectGivenMessagePg();
 			}
 		});
  		this.$refs.table2.$on('change', function(page){
 			if (vm.pagingInfo2.currentPage != page) {
 				vm.pagingInfo2.currentPage = page;
 				vm.selectGiveMessagePg();
 			}
 		});
      },
   });
</script>