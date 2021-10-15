<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

   var idFlag = 0;  //아이디 확인
   var vm = new Vue({
      el : "#mesInsert",
      data : {
    	  memberCode: '',
    	  msIn : {
	    	  memberId : "${memberId}",
	    	  mesContent:'',
    	  },
    		flag : 'insert',
      },
      methods : {
    	  // 중복확인, 아이디체크
    	 idCheck: function() {
  		if(idFlag == 1){
  			$('#memberId').attr("readonly", false);
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
      
      
      				
    	  //쪽지 보내기
    	  insertMessage: function() {
    		  if(idFlag ==0 ){
	    			  $("#loading").hide();
						swal({
			                  title: "아이디 체크를 해주세요. ",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
						});
    		  }
    		  else if(vm.msIn.mesContent == ''){
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
              $.ajax({
            	  type : "POST",
                 url : '/insertMessage',
                 data : {
                	 "memberId" : vm.msIn.memberId,
                	 "mesContent" : vm.msIn.mesContent,               	 
                 },
   				 success : function() {
    					$("#loading").hide();
    					swal({
    		                  title: "쪽지 등록이 완료 되었습니다.",
    	                      type: 'success',
    	                      confirmButtonColor: '#3085d6',
    	                      confirmButtonText: '확인',
    	                      confirmButtonClass: 'btn',
    	                      allowOutsideClick:false,
    	  			          allowEscapeKey:false,
    					}).then(function(isConfirm){
    						if(isConfirm){
    							window.location.href='/selectMessage';
    						}
    					}).catch(swal.noop);
    				 },
    				error : function(xhr, status, error) {
       					$("#loading").hide();
       					swal({
       		                  title: "쪽지등록실패",
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

      },
      mounted : function() {
         var vm = this;
   
      
   		},
   });
</script>