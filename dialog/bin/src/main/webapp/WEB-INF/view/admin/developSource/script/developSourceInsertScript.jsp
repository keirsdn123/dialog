<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');
				fileTarget.on('change', function() {
					if($(this).attr('id')=='javaFile'){
						if($(this).val().split('.').pop()=='java'){
							if (window.FileReader) {
								var filename = $(this)[0].files[0].name;
							} 
							else {
								var filename = $(this).val().split('/').pop().split('\\').pop();
							}
							$(this).siblings('.upload-name').val(filename);
							vm.fileCheck1=true;
							
						}
						else{
							swal({
				                  title: "개발 소스 파일 업로드 오류",
				                  text:"java파일을 업로드 하세요.",
			                      type: 'warning',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
							});
						}
					}
					else{
						if($(this).val().split('.').pop()=='class'){
							if (window.FileReader) {
								var filename = $(this)[0].files[0].name;
							} 
							else {
								var filename = $(this).val().split('/').pop().split('\\').pop();
							}
							$(this).siblings('.upload-name').val(filename);
							vm.fileCheck2=true;
						}
						else{
							swal({
				                  title: "개발 소스 파일 업로드 오류",
				                  text:"class파일을 업로드 하세요.",
			                      type: 'warning',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
							});
						}
					}
				});
			});
	
	var vm = new Vue({
		el : "#devSourceInsert",
		data : {
			devSourceTitle: '',
			fileCheck1 : false,
			fileCheck2 : false,
			devSourceType : '',
			devSourceRoot: 0,
			popupDevSourceTitle : '',
			popupDevSourceCode: 0,
			devSourceList:[],
			pagingInfo: {
		        currentPage: 1,
		        records: 0,
		        perPage: 10,
		    },
		},
		methods : {
			
			insertDevelopSource : function() {
				var vm =this;
				if($("#devSourceTitle").val()==""){
					swal({
		                  title: "개발 소스 등록 오류",
		                  text:"제목을 입력하세요",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				}
				else if($(":radio[name='devSourceType']:checked").length<1){
					swal({
		                  title: "개발 소스 등록 오류",
		                  text:"구분을 선택하세요",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				}
				else if(vm.devSourceType =='표준' && vm.devSourceRoot=='0'){
					swal({
		                  title: "개발 소스 등록 오류",
		                  text:"관련 수집 소스파일을 선택하세요",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				}
				else if($("#devSourceExplanation").val()==""){
					swal({
		                  title: "개발 소스 등록 오류",
		                  text:"설명을 입력하세요",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				}
				else if(vm.fileCheck1 == false){
					swal({
		                  title: "개발 소스 등록 오류",
		                  text:"java파일을 업로드하세요",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				}
				else if(vm.fileCheck2 == false){
					swal({
		                  title: "개발 소스 등록 오류",
		                  text:"class파일을 업로드 하세요",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
					});
				}
				else{
					var formData = new FormData($("#insertDevFrm")[0]);
					console.log("과연 ? " + vm.devSourceRoot);
					formData.append("devSourceRoot", vm.devSourceRoot);
					$.ajax({
						type : "POST",
						url : "/developSource/insertDevelopSource",
						data : formData,
						processData : false,
						contentType : false,
						beforeSend: function(){
							$("#loading").show();
						},
						success : function() {
							$("#loading").hide();
							swal({
				                  title: "개발 소스 등록 완료",
			                      type: 'success',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
			                      allowOutsideClick:false,
			  			          allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href = '/developSource/developSourceListView';
								}
								
							}).catch(swal.noop);
							
						},
						error : function(xhr, status, error) {
							$("#loading").hide();
							swal({
				                  title: "개발 소스 등록 오류",
			                      type: 'warning',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
							});
						}
					})
				}
			},
			developSourceListView : function() {
				window.location.href = "/developSource/developSourceListView";
			},
			selectDevelopSourceType : function(){
				var vm = this;
				$.ajax({
					url : "/developSource/selectDevelopSourceListType",
					data : {
						"perPage" : vm.pagingInfo.perPage,
	    				"currentPage" : vm.pagingInfo.currentPage,
					},
					type : 'post',
					success : function(list) {
						vm.devSourceList = list;
					},
					error : function() {
						alert("hhhh");
					}
				})
			},
			selectDevelopSourceTypeCount : function(){
				var vm = this;
				$.ajax({
		    		url:'/developSource/selectDevelopSourceTypeCount',
		    		data:{
		    		},
		    		type:'post',
		    		success: function(records){
		    			vm.pagingInfo.records = records;
		    			vm.selectDevelopSourceType();
		    		},
		    		error: function(){
	    				alert("selectNormalDataRowCount 에러");
	    			}
		    	});
			},
			selectCode : function(devCode,devTitle){
				var vm = this;
				vm.popupDevSourceCode = devCode;
				vm.popupDevSourceTitle = devTitle;
			},
			chekCode : function(){
				var vm = this;
				vm.devSourceRoot = vm.popupDevSourceCode;
				vm.devSourceTitle = vm.popupDevSourceTitle;
			},
		},
		filters : {
	
		},
		watch : {
			devSourceType : function(type){
				if(type =='수집'){
					this.devSourceRoot = 0;
					this.devSourceTitle = '';
					this.popupDevSourceTitle  = '';
					this.popupDevSourceCode = 0;
					this.pagingInfo.currentPage =1;
				}
			}
		},
		mounted : function() {
			this.$refs.table.$on('change', function(page){
				if (vm.pagingInfo.currentPage != page) {
					vm.pagingInfo.currentPage = page;
					vm.selectDevelopSourceType();
				}
			});
		},
	});
</script>