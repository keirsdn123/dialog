<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
   var idFlag = 0;  //아이디 확인
   var vm = new Vue({
      el : "#adminMesInsert",
      data : {
    	  memberCode: '',
    	  memberRatingCode: '',
    	  getMemberList:[],
    	  mesContent: '',
    	  options: [], 
 	   	 value:[],

	     
	     id:'',
	     label:'',
	     array:{},
    	  
    		flag : 'insert',
      },
      methods : {
    	  // 중복확인, 아이디체크
    	 idCheck: function() {
  		if(idFlag == 1){
  			$("#idCheck").attr("readonly", false);
  			idFlag = 0;
  		$('#idCheck').attr("value","중복확인");
  		$("#idCheckDIV").html("<font color='red'>아이디 중복 체크를 해주세요.</font>");
  		}

  		
  		else{

  		
  	 		var memberId = $("#memberId").val();
  		
  			$.ajax({
  				type:"POST",
  				url: "/selectMemIdCheck", // id 중복확인
  				data:{
  					   "memberId":$("#memberId").val()},
  				success:function(check){
  					alert("체크는 "+check);
  					if(check == ""){
  						$("#idCheckDIV").html("<font color='red'>아이디가 없습니다.</font>");
  						idFlag = 0;
  					}
  					else{
  						$("#idCheckDIV").html("<font color='blue'>가능한 아이디입니다.</font>");
  						idFlag = 1;
  						$('#memberId').attr("readonly",true);
  						$('#idCheck').attr("value","취소");
  					}
  				},
  			    error:function(xhr,status,error)
  			    { //ajax 오류인경우  
  			    	alert("잘못된 입력입니다.");
  		            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
  		   		}
  			});
  		}
  	},
  	
  	//
	 	selectMember : function(){
	   		  var vm = this;
	   		
	   		  $.ajax({
	   			url: "/selectMember",
	   		  	data :{
	   		  	},
	   		  	type:'post',
	   		  	success: function(list){
	   		  		vm.getMemberList = list;
	   		  	},
	   		  	error : function(){
	   		  	}
	   		  })
	   		},
         				
    	  //쪽지 보내기
    	  adminInsertMessage: function() {
    			var vm = this;
  	  		 if(vm.mesContent == ''){
  				swal({
  	                title: "쪽지 내용을 입력하세요",
  	                type: 'warning',
  	                confirmButtonColor: '#3085d6',
  	                confirmButtonText: '확인',
  	                confirmButtonClass: 'btn',
  	                allowOutsideClick:false,
  			          allowEscapeKey:false,
  				})
  	  		}
  	  		else{
 		
 			var List=JSON.stringify(vm.value)
              $.ajax({
            	  type : "POST",
                 url : '/adminInsertMessage',
                 data : {
                	
                	 "mesContent" : vm.mesContent,
                	 "memberList" : List,
                 },
                 
   				 success : function() {
    					$("#loading").hide();
    					swal({
    		                  title: "관리자 쪽지 등록 완료",
    	                      type: 'success',
    	                      confirmButtonColor: '#3085d6',
    	                      confirmButtonText: '확인',
    	                      confirmButtonClass: 'btn',
    	                      allowOutsideClick:false,
    	  			          allowEscapeKey:false,
    					}).then(function(isConfirm){
    						if(isConfirm){
    							window.location.href='/selectMessageManage';
    						}
    					}).catch(swal.noop);
    				 },
    				error : function(xhr, status, error) {
    					$("#loading").hide();
    					swal({
    		                  title: "쪽지 등록 오류",
    	                      type: 'warning',
    	                      confirmButtonColor: '#3085d6',
    	                      confirmButtonText: '확인',
    	                      confirmButtonClass: 'btn',
    					});
    				}
              })
  	  		 }

           },

      },

      filters : {

      },
      watch : {
//     	  2차 아이디 조회
    	  memberRatingCode : function(seq) {
              var vm = this;
              var memberRatingCode = seq;
              console.log(memberRatingCode);
              vm.value=null;
              $.ajax({
                 url : "/getMemberList",
                 data : {
                	 inputseq:memberRatingCode
                 },
                 type : 'GET',
                 success : function(list){
                	 vm.options=[];
                	 vm.arrary={};
                	 $.each(list,function(i, e){
		                    vm.id = e.memberCode;
		                    vm.label = e.memberId;
		                    array = {
			                    	id:vm.id,
			                   		label:vm.label
	                    		};
	                   		vm.options.push(array)
							})	

                  },
                  error : function(){
                     alert("오류");
                  }
                  })
               },


      },
      mounted : function() {
         var vm = this;
			vm.selectMember();
      
   		},
   });
</script>