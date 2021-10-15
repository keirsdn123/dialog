<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#updatePassword" ,
      data: {
    	  memberCode: ${memberCode},
    	  searchItem : {
    		  memberPassword : '',
    		  memberPassword2 : '',
			},
      },
      methods: {
    	  updatePw : function(){
    		  var vm = this;
    		  if(vm.searchItem.memberPassword == vm.searchItem.memberPassword2 && vm.searchItem.memberPassword.length>=4 
    		  && vm.searchItem.memberPassword.length <= 12 && vm.searchItem.memberPassword !='' 
    		  && vm.searchItem.memberPassword2 != ''){
    		
    		  $.ajax({
    			url: "/updatePw", 		
                data : {
                	"memberCode" : vm.memberCode,
                	"memberPassword" : vm.searchItem.memberPassword,        	
                }  ,      
    		  	type:'post',
  				 success : function() {
				    	$("#loading").hide();
				        swal({
				            title: "비밀번호가  변경 되었습니다.",
				            type: 'success',
				            confirmButtonColor: '#3085d6',
				            confirmButtonText: '확인',
				            confirmButtonClass: 'btn',
				            allowOutsideClick:false,
					          allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								window.location.href='/login';
							}
						}).catch(swal.noop);
				 },
 				error : function(xhr, status, error) {
 					$("#loading").hide();
 					swal({
 		                  title: "비밀번호 변경 오류",
 	                      type: 'warning',
 	                      confirmButtonColor: '#3085d6',
 	                      confirmButtonText: '확인',
 	                      confirmButtonClass: 'btn',
 					});
 				}
    		  })
    		  }
    		  else if(vm.searchItem.memberPassword == '' || vm.searchItem.memberPassword == null) {
    			  $("#loading").hide();
					swal({
		                  title: "비밀번호를 입력 해주세요. ",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
    		  }
    		  else if(vm.searchItem.memberPassword.length<4 || vm.searchItem.memberPassword.length>12) {
    			  $("#loading").hide();
					swal({
		                  title: "비밀번호는 4~12자 입니다. ",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
    		  }

    		  else if(vm.searchItem.memberPassword != vm.searchItem.memberPassword2) {
    			  $("#loading").hide();
					swal({
		                  title: "비밀번호가 일치 하지 않습니다. ",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
    		  }
    	  },
    	  
	
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
