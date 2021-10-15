<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.su.dialog.main.domain.User" %>
<script>
   var vm = new Vue({
      el:"#topMenu" ,
      data: {
    	  memInfo:{},
    	  message:'',
      },
      methods: {
		SelectMemberInfo:function(){
		var vm = this;
		 $.ajax({
			url: "/SelectMemberInfo",
		  	data :{
		  	},
		  	type:'post',
		  	success: function(info){
		  		vm.memInfo = info;
		  	},
		  	error : function(){
		  		alert("hhhh");
		  	}
		  })
		},
		selectMessage:function(){
			var vm = this;
			 $.ajax({
				url: "/selectUnMessage",
			  	data :{
			  	},
			  	type:'post',
			  	success: function(message){
			  		vm.message = message;
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
       	  vm.SelectMemberInfo();
       	  vm.selectMessage();
      },
   });
</script>