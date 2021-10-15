<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
   var vm = new Vue({
      el:"#menuManagement" ,
      data: {
    	  ManageMenuList:[],
    	  selectAuthorityList:[],
//     	  selectMenuUseList:[
// 		  		{menuUse:'Y',useName:'사용'},
//     		  	{menuUse:'N',useName:'숨김'},
//    		  ],
      },
      methods: {
   		 SelectMenuList : function(){
   		  var vm = this;
		  $.ajax({
			url: "/SelectManageMenuList",
		  	data :{
		  	},
		  	type:'post',
		  	success: function(list){
		  		vm.ManageMenuList = list;
		  	},
		  	error : function(){
		  		alert("hhhh");
		  	}
		  })
      	},
	  	  AuthorityList : function(){
			  var vm = this;
			  $.ajax({
				url: "/selectAuthorityList", 		
			  	data :{
			  	},
			  	type:'post',
			  	success: function(list){
			  		vm.selectAuthorityList = list;
			  	},
			  	error : function(){
			  		alert("hhhh");
			  	}
			  })
		  },
    	  updateRatingCode : function(list){
    		  var vm = this;
    		  alert(list.menuTitle);
    		  $.ajax({
    			url: "/updateManageRatingCode", 		
    		  	data :{
    		  		"menuCode" : list.menuCode,
    		  		"memberRatingCode" : list.memberRatingCode,
    		  		"menuTitle": list.menuTitle,
    		  		"menuUse": list.menuUse,
    		  	},
    		  	type:'post',
    		  	success: function(list){
    		  		alert("변경되었습니다");
    		  		window.location.href="/management/listViewMenu";
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
    	  vm.SelectMenuList();
    	  vm.AuthorityList();
      },
	});
</script>
