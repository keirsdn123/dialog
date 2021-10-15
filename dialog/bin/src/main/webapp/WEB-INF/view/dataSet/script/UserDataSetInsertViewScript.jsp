<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 Vue.component('treeselect', VueTreeselect.Treeselect)
 var vm = new Vue({
     el:"#UserDataInsert" ,
     data: {
	   	 getCategoryList:[],
	   	 categorySeq:0,
	   	 value:[],
	     options: [],
	     id:'',
	     label:'',
	     array:{},
	     fileCheck:false,
     },
     methods: {
   	 	selectCategoryList : function(){
   		  var vm = this;
   		  $.ajax({
   			url: "/getCategotyList",
   		  	data :{
   		  	},
   		  	type:'post',
   		  	success: function(list){
   		  		vm.getCategoryList = list;
   		  	},
   		  	error : function(){
   		  		alert("hhhh");
   		  	}
   		  })
   	  },
   		insertDataset : function(){
   			var vm = this;

//             $("#insertDatasetFrm").html(
//               "<input type='hidden' name='catevalue1' value="+vm.categorySeq+">"
//               +"<input type='hidden' name='catevalue2' value="+vm.value+">"
//             );
			if($("#datasetName").val()==""){
				swal({
	                  title: "데이터 셋 등록 오류",
	                  text:"제목을 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
				});
			}
			else if(vm.categorySeq==0){
				swal({
	                  title: "데이터 셋 등록 오류",
	                  text:"1차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
				});
			}
			else if(vm.value==null){
				swal({
	                  title: "데이터 셋 등록 오류",
	                  text:"2차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
				});
			}
			else if(vm.fileCheck == false){
				swal({
                  	title: "데이터 셋 등록 오류",
                  	text:"파일 업로드를 하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
				});
			}
			else if($("#datasetFrom").val()==""){
				swal({
                  	title: "데이터 셋 등록 오류",
                  	text:"출처를 입력하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
				});
			}
   			else{
				var formData = new FormData($("#insertDatasetFrm")[0]);
				if(vm.value==null){
	   				vm.value=0;
	   			}
				formData.append('cateCode1',vm.categorySeq);
				formData.append('cateList',vm.value);
	   			
				 $.ajax({
		             type : "POST",
		             url : "/insertUserDataset",
		             data : formData,      
		             processData: false,
		             contentType: false,  
					 beforeSend: function(){
							$("#loading").show();
						 },
						 success : function() {
							$("#loading").hide();
							swal({
				                  title: "데이터 셋 등록 완료",
			                      type: 'success',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
			                      allowOutsideClick:false,
			  			          allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href='/dataSet/dataSetList';
								}
							}).catch(swal.noop);
						 },
						error : function(xhr, status, error) {
							$("#loading").hide();
							swal({
				                  title: "데이터 셋 등록 오류",
			                      type: 'warning',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
							});
						}
			         })
   				}
			  },
		dataSetList : function(){
 			window.location.href="/dataSet/dataSetList";
	    },
     },
     filters: {
     },
     watch: {
    	 categorySeq:function(seq){
    		 var vm = this;
    		 var categorySeq = seq;
    		 vm.value=null;
    		 $.ajax({
    	   			url: "/getCategoryList",
    	   		  	data:{inputseq:categorySeq},
    	   		  	type:'GET',
    	   		  	success: function(list){
	    	   		  	if(list.length!=0){
	    	   		 	 	vm.options=[];
	    	   				vm.array={};
							$.each(list,function(i, e){
			                    vm.id = e.categorySeq;
			                    vm.label = e.categoryNme;
			                    array = {
				                    	id:vm.id,
				                   		label:vm.label
		                    		};
		                   		vm.options.push(array)
								})	
	    	   		  		}
	    	   		  	else{
	    	   		  		vm.options=[];
	    	   		  		vm.value=0;
	    	   		  	}
    	   			},
    	   		  	error : function(){
    	   		  		alert("hhhh");
   	   		  	}
   	   		  })
    	 },
     },
     mounted: function () {
	   	  var vm = this;
	   	  vm.selectCategoryList();
     },
  });
  //파일 업로드시 파일 이름 조회
 	$(document).ready(function(){
 		var fileTarget = $('.filebox .upload-hidden');
 		fileTarget.on('change', function(){
 			if(window.FileReader){
 		    	var filename = $(this)[0].files[0].name;
 		    } 
 			else {
 		    	var filename = $(this).val().split('/').pop().split('\\').pop();
 			}
 			$(this).siblings('.upload-name').val(filename);
 			
 			vm.fileCheck=true;
 			
 			var formData = new FormData($("#insertDatasetFrm")[0]);
 	   		  $.ajax({
				url: "/dataSetFileCheck",
    		  	data :formData,
    		  	type:'post',
    		  	processData: false,
    		  	contentType: false,
    		  	beforeSend: function(){
					$("#loading").show();
				 },
    		  	success: function(excelcheck){
    		  		$("#loading").hide();
    		  		switch(excelcheck){
    		  			case 1:
    		  				$("#fileUl").html(
 								"<font color='red'>파일 유효성을 만족하지 않습니다 . 시트 수는 하나만 가능합니다 파일의 시트 수를 확인해주세요</font>"
    		  				+ "");
    		  				$("#fileUl").append(
   		  						"<input type='hidden' name='status' value='N'>"
    		  				);
    		  				break;
    		  			case 2:
    		  				$("#fileUl").html(
 								"<font color='red'>파일 유효성을 만족하지 않습니다 . 기준에 맞지 않는 데이터가 있습니다 파일을 확인해주세요</font>"
    		  				+ "");
   		  				    $("#fileUl").append(
   		  						"<input type='hidden' name='status' value='N'>"
    		  				);
    		  				break;
    		  			case 3:
    		  				$("#fileUl").html(
   								"<font color='red'>파일 유효성을 만족하지 않습니다 . 엑셀 또는 CSV 파일이 아닙니다.</font>"
       		  				+ "");
  		  				    $("#fileUl").append(
   		  						"<input type='hidden' name='status' value='N'>"
    		  				);
       		  				break;
    		  			case 4:
    		  				$("#fileUl").html(
    								"<font color='red'>첫 행 칼럼값이 올바르지 않습니다  파일을 확인해주세요 . </font>"
       		  				+ "");
    		  				    $("#fileUl").append(
    		  						"<input type='hidden' name='status' value='N'>"
    		  				);
       		  				break;
    		  			case 0:
    		  				$("#fileUl").html(
 								"<font color='green'>유효성을 만족합니다. 추후 시각화 서비스를 이용하실 수 있습니다.</font>"
    		  				+ "");
    		  				    $("#fileUl").append(
   		  						"<input type='hidden' name='status' value='S'>"
    		  				);
  		  					break;	
  		  			}
    		  	},
    		  	error : function(xhr, status, error) {
					$("#loading").hide();
					swal({
		                  title: "파일 업로드 오류",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				 }
    		  })
 		});
 	}); 
</script>