<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#myPageList" ,
      data: {
    	  selectMyData:[],
    	  selectMyReportList:[],
    	  info:{},
      },
      methods: {
			mydatasetList : function(){
    		  var vm = this;
    		  $.ajax({
    			url: "/selectMyData",
    		  	data :{},
    		  	type:'post',
    		  	success: function(list){
//     		  		console.log(list);
    		  		vm.selectMyData = list.selectMyData;
    		  	},
    		  	error : function(){
    		  		alert("hhhh");
    		  	}
    		  })
    	  },
          updateMyPassword : function() {
 				window.location.href = "/updateMyPassword";

 			},
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
 	                     alert("¿À·ù");
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
    	  vm.mydatasetList();
    	  vm.List();

      },
   });
   
</script>