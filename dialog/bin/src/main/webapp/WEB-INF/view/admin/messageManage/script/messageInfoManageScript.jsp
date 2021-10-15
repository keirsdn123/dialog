<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
   var vm = new Vue({
      el : "#mesInfo",
      data : {
    	 	mesInfo:[],
    	    messageSeq:${messageSeq},
    		memberCode:${memberCode},
      },
      methods : {
    	  selectMessageInfo: function() {
              var vm = this;  
              $.ajax({
                 url : '/selectMessageInfo',
                 data : {
                    "messageSeq" : vm.messageSeq
                 },
                 type : 'post',
                 success: function(list){
              	   console.log(list)
                    vm.mesInfo=list;

                 },
                 error : function(){
                    alert("에러");
                 }
              })
           },
           mesgDel : function(seq){
               var vm = this; 
               $.ajax({
                  url : "/delMessage",
                  data : {
                     "messageSeq" : seq,
                  },
                  type : "POST",
                  success: function(){
                	  window.location.href="/selectMessage";
                  },
                  error : function(){
                     alert("에러");
                  }
               })
               
            },

            
      },

      filters : {

      },
      watch : {

      },
      mounted : function() {
         var vm = this;
         vm.selectMessageInfo();
      
   		},
   });
</script>