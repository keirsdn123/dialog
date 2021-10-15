<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#login" ,
      data: {
    	  user : {
    		  memberId : '',
    		  memberPassword: '',
			},
      },
      methods: {
    	  memLogin :function() {
    		  var vm= this;
    			$.ajax({
    				url : "/selectLoginCheck", // 회원 로그인
    				data : {
    					"memberId" : vm.user.memberId,
    					"memberPassword" : vm.user.memberPassword,
    				},
    				type:'post',
    				success : function(memLoginInfo) {
    					if (memLoginInfo == 0) {
    						$("#loginUl").html(
    								"<font color='red'><li>ID / PW를 확인해주세요.</li></font>"
    										+ "").create();
    					} else {
    						console.log(memLoginInfo);
    			           	   	 document.loginForm.action = "/memLogin"
    			                 document.loginForm.submit();
    		
    					}
    				},
    				error : function(xhr, status, error) { //ajax 오류인경우  
    					alert("잘못된 입력입니다.");
    					alert("error\nxhr : " + xhr + ", status : " + status
    							+ ", error : " + error);
    				}
    			});
    		}
    	  
	
      },
      
      filters: {
         
      },
      watch: {
         
      },
      mounted: function () {
    	  var vm = this;
      },
   });
   
</script>
