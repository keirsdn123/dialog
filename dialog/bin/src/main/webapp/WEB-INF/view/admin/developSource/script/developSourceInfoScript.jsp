<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
var vm = new Vue({
    el:"#developSourceInfo" ,
    data: {
	    developSourceInfo:{},
	    developSourceFileInfo:[],
	    referenceSourceInfo:{},
	  	devSourceCode : ${devSourceCode},
	  	devSourceTitle : '',
	  	devSourceContents : '',
	  	devSourceType : '',
	  	devSourceEnrollmentDate : '',
	  	devSourceFileTitle : '',
	  	devSourcefileRoute : '',
	  	devSourceActStatus : '',
	  	devSourceWriter : '',
	  	devSourceFileOrignalTitle :'',
	  	
    },
	methods: {
    	selectDevelopSourceInfo : function(){
	  		var vm = this;
	  		$.ajax({
	  			url: "/developSource/selectDevelopSourceInfo",
	  		  	data :{
	  		  		"devSourceCode" : vm.devSourceCode
	  		  	},
	  		  	type:'post',
	  		  	success: function(list){
	  		  		vm.developSourceInfo = list;
	  		  		vm.selectReferenceSource(vm.devSourceCode, vm.developSourceInfo.devSourceType);
	  		  	},
	  		  	error : function(){
	  		  		alert("hhhh");
	  		  	}
	  		})
    	},// selectDevelopSourceList method end
    	selectDevelopSourceView : function(seq){
    		window.location.href = "/developSource/developSourceInfoView?devSourceCode="+ seq;
    	},
    	selectDevelopSourceFileInfo : function(){
	  		var vm = this;
	  		$.ajax({
	  			url: "/developSource/selectDevelopSourceFileInfo",
	  		  	data :{
	  		  		"devSourceCode" : vm.devSourceCode
	  		  	},
	  		  	type:'post',
	  		  	success: function(list){
	  		  		vm.developSourceFileInfo = list;
	  		  		console.log(vm.developSourceFileInfo);
	  		  	},
	  		  	error : function(){
	  		  		alert("hhhh");
	  		  	}
	  		})
    	},//selectDevelopSourceFileInfo method end
  	  	selectReferenceSource : function(seq, type){
	  	  	$.ajax({
	  			url: "/developSource/selectReferenceSource",
	  		  	data :{
	  		  		"devSourceCode" : seq,
	  		  		"devSourceType" : type
	  		  	},
	  		  	type:'post',
	  		  	success: function(list){
	  		  		vm.referenceSourceInfo = list;
	  		  	},
	  		  	error : function(){
	  		  		alert("hhhh");
	  		  	}
	  		})
  	  	},// selectReferenceSource method end
  	  	developSourceFileDownload : function(index){
  			var vm = this;
  			$.fileDownload("/developSource/developSourceFileDownload", {
  				httpMethod:"POST",
				aync: false,
				data: {
					"devSourcefileRoute" : vm.developSourceFileInfo[index].devSourcefileRoute,
					"devSourceFileTitle" : vm.developSourceFileInfo[index].devSourceFileTitle,
					"devSourceFileExtension" : vm.developSourceFileInfo[index].devSourceFileExtension
				},
				prepareCallback: function () {
					$("#loading").show();
				},
				successCallback: function(cat){
					$('#loading').hide();
				},
				failCallback: function(){
					console.log("?????????");
					swal({
		                  title: "?????? ???????????? ??????",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '??????',
	                      confirmButtonClass: 'btn',
					});
					$('#loading').hide();
				}
  			})
  	  	},// developSourceFileDownload method end
		developSourceDelete : function(){
			var vm = this;
			swal({
				title: "?????? ????????? ?????? ???????????????????",
			    	type: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '????????????',
			        cancelButtonText: '????????????',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false, //?????? ???????????? ??? ?????????
			        allowEscapeKey:false, //esc ????????? ??? ?????????
			}).then(function(isConfirm){
				if(isConfirm){
					var devSourceFileRoutes = new Array();
					for(var i=0; i<vm.developSourceFileInfo.length;i++){
						devSourceFileRoutes.push(vm.developSourceFileInfo[i].devSourcefileRoute);
					}
					$.ajax({
			  			url: "/developSource/developSourceDelete",
			  			traditional : true,
			  		  	data :{
			  		  		"devSourceCode" : vm.devSourceCode,
			  		  		"devSourceFileRoutes" : devSourceFileRoutes
// 			  		  		"devSourcefileRoute" : 	vm.developSourceInfo.devSourcefileRoute,
			  		  	},
			  		  	type:'post',
			  		  	success: function(){
				  		  	swal({
			                  	title: "?????? ?????? ?????? ??????",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '??????',
			                    confirmButtonClass: 'btn',
			                    allowOutsideClick:false,
						        allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href="/developSource/developSourceListView";
								}
								
							}).catch(swal.noop);
			  		  		
			  		  	},
			  		  	error : function(){
				  		  	swal({
				                title: "?????? ?????? ?????? ??????",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '??????',
			                    confirmButtonClass: 'btn',
			                    
							})
			  		  	}
			  		})
				}
			}).catch(swal.noop);
	  		
		},// developSourceDelete method end
	},//methods ????????? ??????
    filters: {
       
    },//filter end
    watch: {
       
    }, //watch end
    mounted: function () {
  	  var vm = this;
  	  vm.selectDevelopSourceInfo();
  	  vm.selectDevelopSourceFileInfo();
    }, //mounted end
 });
</script>