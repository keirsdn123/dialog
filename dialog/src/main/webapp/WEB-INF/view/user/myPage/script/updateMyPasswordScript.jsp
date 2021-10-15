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
			                  title: "���� �Է����ּ���. ",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: 'Ȯ��',
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
              					            title: "��й�ȣ��  ���� �Ǿ����ϴ�.",
              					            type: 'success',
              					            confirmButtonColor: '#3085d6',
              					            confirmButtonText: 'Ȯ��',
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
              	 		                  title: "��й�ȣ ���� ����",
              	 	                      type: 'warning',
              	 	                      confirmButtonColor: '#3085d6',
              	 	                      confirmButtonText: 'Ȯ��',
              	 	                      confirmButtonClass: 'btn',
              	 					});
              	 				}
              	    		  })
              	    		  }
              	    		  else if(vm.update.memberPassword == '' || vm.update.memberPassword == null) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "��й�ȣ�� �Է� ���ּ���. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: 'Ȯ��',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }
              	    		  else if(vm.update.memberPassword.length<4 || vm.update.memberPassword.length>12) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "��й�ȣ�� 4~12�� �Դϴ�. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: 'Ȯ��',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }

              	    		  else if(vm.update.memberPassword != vm.update.memberPassword2) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "��й�ȣ�� ��ġ ���� �ʽ��ϴ�. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: 'Ȯ��',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }
              	    		  else if(vm.memberPassword == vm.update.memberPassword) {
              	    			  $("#loading").hide();
              						swal({
              			                  title: "���� ��й�ȣ�� ��ġ�մϴ�. ",
              		                      type: 'warning',
              		                      confirmButtonColor: '#3085d6',
              		                      confirmButtonText: 'Ȯ��',
              		                      confirmButtonClass: 'btn',
              						});
              	    		  }
                   	}
                   },
                   error : function(){
                      alert("����");
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
