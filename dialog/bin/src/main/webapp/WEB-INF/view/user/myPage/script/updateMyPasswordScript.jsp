<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#updatePassword" ,
      data: {
    	  memberPassword: '',
    	  info:{},
    	  update : {
    		  memberPassword : '',
    		  memberPassword2 : '',
			},
      },
      methods: {
    	  updatePw : function(){
    		  var vm = this;
              $.ajax({
                  url : '/selectMyInfo',
                  data : {
                	  "memberPassword" : vm.memberPassword,
                  },
                  type : 'post',
                  success : function(list){
                 	 console.log(list);
                   	if (list == ''){
	    		  		 $("#loading").hide();
   						swal({
			                  title: "값을 입력해주세요. ",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
						});
	    		  	} 
                   	else if(list != ''){
              		  if(vm.update.memberPassword == vm.update.memberPassword2 && vm.update.memberPassword.length>=4 
              	    		  && vm.update.memberPassword.length <= 12 && vm.update.memberPassword !='' 
              	    		  && vm.update.memberPassword2 != '' && vm.memberPassword != vm.update.memberPassword){
              	    		
              	    		  $.ajax({
              	    			url: "/updatePw", 		
              	                data : {
              	                	"memberCode" : list.memberCode,
              	                	"memberPassword" : vm.update.memberPassword,        	
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
              									window.location.href='/selectmyPage';
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
              	    		  else if(vm.update.memberPassword == '' || vm.update.memberPassword == null) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "비밀번호를 입력 해주세요. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: '확인',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }
              	    		  else if(vm.update.memberPassword.length<4 || vm.update.memberPassword.length>12) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "비밀번호는 4~12자 입니다. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: '확인',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }

              	    		  else if(vm.update.memberPassword != vm.update.memberPassword2) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "비밀번호가 일치 하지 않습니다. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: '확인',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }
              	    		  else if(vm.memberPassword == vm.update.memberPassword) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "현재 비밀번호와 일치합니다. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: '확인',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }
                   	}
                   },
                   error : function(){
                      alert("오류");
                   }
                   })
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
