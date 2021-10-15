<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
   var vm = new Vue({
      el:"#MenuCode" ,
      data: {
    	  
    	  MenuList:[],
    	  SmallMenuList:[],
      },
      methods: {
   		 SelectMenuList : function(){
   		  var vm = this;
   		  
		  $.ajax({
			url: "/SelectMenuList",
		  	data :{
		  	},
		  	type:'post',
		  	success: function(list){
				
		  		vm.MenuList = list;
		  		vm.SmallMenuList = list;
		  		for(var b=0; b < vm.MenuList.length; b++) {
					var plus = 0;
					var array = [];
					for(var a=0; a < vm.SmallMenuList.length; a++) {
						if(vm.MenuList[b].menuCode == vm.SmallMenuList[a].menuRoot) {
							array.push(vm.SmallMenuList[a]);
							plus++;
						}
					}
					vm.MenuList[b].smallList = array;
		  		}
// 		  		for(var b=0; b < vm.MenuList.length; b++) {
// 					var plus = 0;
// 					var array = [];
// 					for(var a=0; a < vm.SmallMenuList.length; a++) {
// 						if(vm.MenuList[b].menuRoot == vm.SmallMenuList[a].menuCode) {
// 							alert("같은게 없나?");
// 							array.push(vm.SmallMenuList[a]);
// 							plus++;
// 						}
// 					}
// 					vm.MenuList[b].smallList = array;
// 				}
// 		  		console.log(vm.MenuList);
// 		  		console.log(vm.MenuList.smallList);
// 		  		console.log(array);
		  		
		  	},
		  	error : function(){
		  		alert("hhhh");
		  	}
		  })
      	},
		selectMenuDetail : function(url,code){
			var vm = this;
			
			$("#menudetail").html(
				"<input type='hidden' name='menuCode' value="+code+">"
			);
			$("#menudetail").attr("action",url);
			$("#menudetail").submit();
	         
        },
        setActive : function(param){
        	var url = location.href.split("/")[location.href.split("/").length -1];
			if(param.split("/")[param.split("/").length -1] == url )
			{
				return true;
			}else{
				return false;
			}
        },
        checkUrl : function(param){
        	var vm = this;
        	
			var url = location.href.split("/")[location.href.split("/").length -1];
			for(var i  = 0  ; i <param.smallList.length ; i++)
			{				
				if(url == param.smallList[i].menuUrl.split("/")[param.smallList[i].menuUrl.split("/").length -1])
				{					
					return true;
				}					
			}				
			return false;
        },
      }, 
      filters: {
         
      },
      watch: {
         
      },
      mounted: function () {
       	  var vm = this;
       	  vm.SelectMenuList();
      },
	});
</script>