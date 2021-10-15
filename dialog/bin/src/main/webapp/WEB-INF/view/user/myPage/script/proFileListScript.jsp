<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
function display(a,b){
    var con = document.getElementById(b);
    var dis = document.getElementById(a);
    console.log(dis);
    if(con.style.display=='none'){
        con.style.display = 'block';
        dis.style.display = 'none';
    }else{
        con.style.display = 'none';
        dis.style.display = 'block';
    }
}



var vm = new Vue({
      el:"#proFile" ,
      data: {
    	  info:{},
    	  memberCode:${memberCode},
    	  updateInfo:{
    		  memberName : '',
    		  memberEmail : '',
    		  memberId : '',
    	  },
      },
      methods: {
    	  List : function() {
              var vm = this;
              $.ajax({
                 url : '/selectProFileList',
                 data : {
                 },
                 type : 'post',
                 success : function(list){
                	 console.log(list);
                     vm.info=list;
                  },
                  error : function(){
                     alert("오류");
                  }
                  })
               },
         	  updateInformation: function() {
        		  var vm = this;
                  $.ajax({
                	  type : "POST",
                     url : '/updateInfo',
    	             data : {
    	            	 "memberId" : vm.updateInfo.memberId,
    	            	 "memberName" : vm.updateInfo.memberName,
    	            	 "memberEmailAddress": vm.updateInfo.memberEmail,
    	             } ,     
                     success: function(){
                    	 $("#loading").hide();
    				        swal({
    				            title: "회원정보가 수정되었습니다.",
    				            type: 'success',
    				            timer: 2000,
    				            confirmButtonColor: '#3085d6',
    				            
    				            confirmButtonText: '확인',
      	                        confirmButtonClass: 'btn',
    	                        allowOutsideClick:false,
    	  			            allowEscapeKey:false,

    						}).then(function(isConfirm){
    							if(isConfirm){
    								window.location.href="/proFileList";
    							}
    						}).catch(swal.noop);
                     },
        				error : function(xhr, status, error) {
           					$("#loading").hide();
           					swal({
           		                  title: "수정 오류",
           	                      type: 'warning',
           	                      confirmButtonColor: '#3085d6',
           	                      confirmButtonText: '확인',
           	                      confirmButtonClass: 'btn',
           					});
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
    	  vm.List();
      },
   });
   
</script>
