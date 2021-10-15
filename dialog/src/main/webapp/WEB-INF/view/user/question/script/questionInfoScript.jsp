<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
   var vm = new Vue({
      el : "#questionView",
      data : {
    	 	noticeInfo:{},					//문의사항 정보
    	 	noticeFileInfo:[],
    	    noticeCode:${noticeCode},       //문의사항 번호
    		memberCode:${memberCode},       //회원 번호
    		memberRatingCode:${memberRatingCode}, //회원 등급 번호
    		reList:[],                      //답변 리스트
    		noticeReContent:'',
    		noticeReCode:'',
      },
      methods : {
    	  selectQuestionInfo: function() {
              var vm = this;  
              $.ajax({
                 url : '/selectQuestionInfo',
                 data : {
                    "noticeCode" : vm.noticeCode,
                    "memberCode" : vm.memberCode,
                 },
                 type : 'post',
                 success: function(list){
              	   console.log(list)
                    vm.noticeInfo=list;

                 },
                 error : function(){
                    alert("에러");
                 }
              })
           },
           //파일 조회
           selectQuestionFile: function() {
               var vm = this;  
               $.ajax({
                  url : '/selectQuestionFile',
                  data : {
                     "noticeCode" : vm.noticeCode,
                  },
                  type : 'post',
                  success: function(list){
               	   console.log(list);
                     vm.noticeFileInfo=list;

                  },
                  error : function(){
                     alert("에러");
                  }
               })
            },
 
           selectReList: function() {
              var vm = this;  
              $.ajax({
                 url : '/reList',
                 data : {
                    "noticeCode" : vm.noticeCode,
                 },
                 type : 'post',
                 success: function(list){
              	   console.log(list);
                    vm.reList=list;

                 },
                 error : function(){
                    alert("에러");
                 }
              })
           },
           noticeDel : function(seq){
               var vm = this; 
               $.ajax({
                  url : "/delNotice",
                  data : {
                     "noticeCode" : seq,
                  },
                  type : "POST",
                  success: function(){
                	  window.location.href="/question";
                  },
                  error : function(){
                     alert("에러");
                  }
               })
               
            },
      	  //관리자 답글 작성
      	  insertReNotice: function() {
			var vm=this;
                $.ajax({
              	  type : "POST",
                   url : '/insertReNotice',
                   data : {
                  	 "noticeCode" : vm.noticeCode,
                  	 "noticeReContent": vm.noticeReContent,
                   },
                   success: function(){
                      window.location.href="/questionInfo?noticeCode="+vm.noticeCode;

                   },
                   error : function(){
                      alert("에러");
                   }
                })
             },    
//              관리자 답글 삭제
             deleteNoticeRe : function(seq){
                 var vm = this; 
                 $.ajax({
                    url : "/deleteNoticeRe",
                    data : {
                       "noticeReCode" : seq,
                    },
                    type : "POST",
                    success: function(){
    					$("#loading").hide();
    					swal({
    		                  title: "답변이 삭제 되었습니다.",
    	                      type: 'success',
    	                      confirmButtonColor: '#3085d6',
    	                      confirmButtonText: '확인',
    	                      confirmButtonClass: 'btn',
    	                      allowOutsideClick:false,
    	  			          allowEscapeKey:false,
    					}).then(function(isConfirm){
    						if(isConfirm){
    							window.location.href='/question';
    						}
    					}).catch(swal.noop);
    				 },
                    error : function(){
                       alert("에러");
                    }
                 })
                 
              },
             //파일 다운로드
     	  	noticeFileDownload : function(index){
      			var vm = this;
      			console.log("원본 파일 " + vm.noticeFileInfo[index].noticeFileRoute);
      			console.log("파일 경로" + vm.noticeFileInfo.noticeFileRoute);
      			console.log("저장 이름 " + vm.noticeFileInfo.noticeFileOriginalTitle);
      			$.fileDownload("noticeFileDownload", {
      				httpMethod:"POST",
    				aync: false,
    				data: {
    					"noticeFileRoute" : vm.noticeFileInfo[index].noticeFileRoute,
    					"noticeFileTitle" : vm.noticeFileInfo[index].noticeFileTitle,
    					"noticeFileExtension" : vm.noticeFileInfo[index].noticeFileExtension,
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

      filters : {

      },
      watch : {

      },
      mounted : function() {
         var vm = this;
         vm.selectQuestionInfo();
         vm.selectReList();
      	 vm.selectQuestionFile();
   		},
   });
</script>