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
					console.log("실패적");
					swal({
		                  title: "파일 다운로드 오류",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
					$('#loading').hide();
				}
  			})
  	  	},// developSourceFileDownload method end
		developSourceDelete : function(){
			var vm = this;
			swal({
				title: "개발 소스를 삭제 하시겠습니까?",
			    	type: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '삭제하기',
			        cancelButtonText: '돌아가기',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			        allowEscapeKey:false, //esc 눌러도 안 없어짐
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
			                  	title: "개발 소스 삭제 완료",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
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
				                title: "개발 소스 삭제 실패",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
			                    
							})
			  		  	}
			  		})
				}
			}).catch(swal.noop);
	  		
		},// developSourceDelete method end
	},//methods 끝나는 지점
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