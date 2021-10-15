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
				            title: "��й�ȣ��  ���� �Ǿ����ϴ�.",
				            type: 'success',
				            confirmButtonColor: '#3085d6',
				            confirmButtonText: 'Ȯ��',
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
 		                  title: "��й�ȣ ���� ����",
 	                      type: 'warning',
 	                      confirmButtonColor: '#3085d6',
 	                      confirmButtonText: 'Ȯ��',
 	                      confirmButtonClass: 'btn',
 					});
 				}
    		  })
    		  }
    		  else if(vm.searchItem.memberPassword == '' || vm.searchItem.memberPassword == null) {
    			  $("#loading").hide();
					swal({
		                  title: "��й�ȣ�� �Է� ���ּ���. ",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: 'Ȯ��',
	                      confirmButtonClass: 'btn',
					});
    		  }
    		  else if(vm.searchItem.memberPassword.length<4 || vm.searchItem.memberPassword.length>12) {
    			  $("#loading").hide();
					swal({
		                  title: "��й�ȣ�� 4~12�� �Դϴ�. ",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: 'Ȯ��',
	                      confirmButtonClass: 'btn',
					});
    		  }

    		  else if(vm.searchItem.memberPassword != vm.searchItem.memberPassword2) {
    			  $("#loading").hide();
					swal({
		                  title: "��й�ȣ�� ��ġ ���� �ʽ��ϴ�. ",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: 'Ȯ��',
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
