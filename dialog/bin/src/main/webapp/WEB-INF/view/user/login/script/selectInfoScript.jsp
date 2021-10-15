<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#selectInfo" ,
      data: {
    	  selId:{
    		  memberName:'',
    		  memberEmail:'',
    	  },
    	  selPw:{
    		  memberName:'',
    		  memberEmail:'',
    		  memberId:'',
    	  },
      },
      methods: {
    	  selectId : function(){
    		  var vm = this;
    		  $.ajax({
    			url: "/selectId", 		
                data : {
                	"memberName" : vm.selId.memberName,
                	"memberEmailAddress" : vm.selId.memberEmail,
                },
    		  	type:'post',
    		  	success: function(list){
	    		  	if (list == ''){
	    		  		 $("#loading").hide();
					        swal({
					            title: "일치하는 정보가 없습니다.",
					            type: 'error',
					            confirmButtonColor: '#3085d6',
					            confirmButtonText: '확인',
					            confirmButtonClass: 'btn',
					            allowOutsideClick:false,
						          allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href="/selectInfo";
								}
							}).catch(swal.noop);
	    		  	} 		  	
	    		  	else if(list != ''){
	     		  	window.location.href = "/selectInfoList?memberId="+list.memberId;
	    		  	}
    		  	},
    		  	error : function(){
    		  		alert("hhhh");
    		  	}
    		  })
    	  },
    	  selectPw : function(){
    		  var vm = this;
    		  $.ajax({
    			url: "/selectPw", 		
                data : {
                	"memberName" : vm.selPw.memberName,
                	"memberEmailAddress" : vm.selPw.memberEmail,
                	"memberId" : vm.selPw.memberId,
                },        
    		  	type:'post',
    		  	success: function(list){
	    		  	if (list == ''){
	    		  		 $("#loading").hide();
					        swal({
					            title: "일치하는 정보가 없습니다.",
					            type: 'error',
					            confirmButtonColor: '#3085d6',
					            confirmButtonText: '확인',
					            confirmButtonClass: 'btn',
					            allowOutsideClick:false,
						          allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href="/selectInfo";
								}
							}).catch(swal.noop);
	    		  	} 		  	
	    		  	else if(list != ''){
	    		  		 $("#loading").hide();
					        swal({
					            title: "새로운 비밀번호를 입력해주세요 ",
					            type: 'success',
					            confirmButtonColor: '#3085d6',
					            confirmButtonText: '확인',
					            confirmButtonClass: 'btn',
					            allowOutsideClick:false,
						          allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href = "/updatePassword?memberCode="+list.memberCode;
								}
							}).catch(swal.noop);
	    		  		
	    		  	}    		  
    		  	},
    		  	error : function(){
    		  		alert("hhhh");
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
   
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
</script>
