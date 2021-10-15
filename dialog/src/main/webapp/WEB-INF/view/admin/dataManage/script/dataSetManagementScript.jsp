<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

	
	var vm = new Vue({
	    el:"#datacheck" ,
	    data: {

	    	//연관 보고서 리스트 
	    	referenceReportList:[],
	    	
	    	//시각화 요청 들어온 데이터 셋 상세정보
			normalDataInfo : {},
			//시각화 요청 들어온 데이터 셋 카테고리
			normalDataCateInfo : {},
			
			//업로드된 파일의 칼럼명 리스트
			fileColNameList : {},
			//업로드된 파일의 칼럼별 타입 리스트
			fileColTypeList : {},
			//업로드된 파일의 데이터가 행 별로 담긴 리스트
			fileDataList : [],
			previewData : [],
			
			//파일 미리보기에서 선택한 칼럼의 인덱스 번호
			checkedColumnIndex : [],
			//파일 미리보기에서 선택한 칼럼 타입
			selectedColumnType : [],
			
			//데이터 셋 데이터코드	       	       
			dataCode : ${dataCode},
// 			dataCode : 1,
			
			//일시 데이터 db화 확인 데이터 리스트
			normalDatabaseList : [],
			//일시 데이터 db화 확인 데이터 칼럼명 리스트
			normalDatabaseColNameList : {},
			//일시 데이터 db 테이블 명
			normalDataTableName : '',
			
			//일시 데이터 시각화 승인 거부 사유
			rejectReason : '',
			reportDisplaySet : 0,
			rejectFlag : 0,
			
			categoryTest : {},
			
			pagingInfo: {
                currentPage: 1,
                records: 0,
                perPage: 10,
            },
			
		},
	    methods: {
	    	//일시 데이터 셋 정보 select
	    	selectNormalDataSetInfo: function(){
	    		var vm = this;
	    		$.ajax({
	    			url:'/dataSetConfirm/selectNormalDataSetInfo',
	    			data:{
	    				"dataCode" : vm.dataCode,
	    			},
	    			type:'post',
	    			success: function(data){
	    				vm.normalDataInfo=data.dataDetailInfo;
	    				vm.normalDataCateInfo=data.dataCategoryInfo;
	    				if(vm.normalDataInfo.status=='R'){
	    					vm.rejectFlag = 1;
	    				} else if(vm.normalDataInfo.status == 'Y'){
	    					vm.rejectFlag = 3;
	    				} else if(data.dbcheck == 1){
	    					vm.rejectFlag = 2;
	    				}
	    				if(data.dbcheck == 1){
	    					vm.selectDataPreviewList();
	    				} else if(data.dbcheck == 0){
	    					vm.selectFilePreviewList();
	    				}
	    			},
	    			error: function(){
// 	    				alert("selectNormalDataSetInfo 에러");
	    			}
	    		});
	    	},
	    	//파일 다운로드 메서드(아직 작성 x)
	    	selectFileDownload: function(){
	    		var vm = this;
	  			$.fileDownload("/dataSetConfirm/selectFileDownload", {
	  				httpMethod:"POST",
					aync: false,
					data: {
						"filePath" : vm.normalDataInfo.filePath,
						"fileOriginalName" : vm.normalDataInfo.fileOriginalName
					},
					prepareCallback: function () {
						$("#loading").show();
					},
					successCallback: function(cat){
						$('#loading').hide();
					},
					failCallback: function(){
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
	    	},
	    	//일시 데이터 셋 파일 미리보기
	    	selectFilePreviewList: function(){
	    		var vm = this;
	    		$.ajax({
	    			url:'/dataSetConfirm/selectFilePreviewList',
	    			data:{
	    				"dataCode" : vm.dataCode,
	    			},
	    			type:'post',
	    			success: function(list){
// 	    				vm.fileColNameList = list.columnNameList;
// 	    				vm.fileColTypeList = list.columnTypeList;
// 	    				vm.fileDataList = list.dataValueLists;
// 	    				vm.previewData = list.previewList;
// 	    				vm.checkedColumnIndex = list.dataIndexList;
	    				if(list.dbcheck == 1){
	    					vm.rejectFlag = 2;
	    					vm.selectDataPreviewList();
	    				}else if(list.dbcheck == 0){
	    					vm.fileColNameList = list.columnNameList;
		    				vm.fileColTypeList = list.columnTypeList;
		    				vm.fileDataList = list.dataValueLists;
		    				vm.previewData = list.previewList;
		    				vm.checkedColumnIndex = list.dataIndexList;
	    				}

	    			},
	    			beforeSend: function(){
	    				$("#loading").show();
	    			},
	    			complete: function(){
	    				$('#loading').hide();
	    			},
	    			error: function(){
	    				swal({
							title: "데이터 조회 실패",
							type: 'warning',
							confirmButtonColor: '#3085d6',
							confirmButtonText: '확인',
							confirmButtonClass: 'btn',
						});
	    			}
	    		});
	    	},
	    	//db화된 후 미리보기
	    	selectDataPreviewList: function(){
	    		var vm = this;
	    		$.ajax({
	    			url:'/dataSetConfirm/selectDataPreviewList',
	    			data:{
	    				"dataCode" : vm.dataCode,
	    			},
	    			type:'post',
	    			success: function(list){
	    				vm.previewData = list.dataPreviewList;
	    				vm.fileColNameList = list.dataColName;
	    			},
	    		});
	    	},
	    	
	    	//표준데이터 생성 화면으로 이동
	    	infoViewMakeStandarData : function(code, table){
				$("#pageChange").html(
					"<input type='hidden' name='dataCode' value="+code+">"+
					"<input type='hidden' name='normalDataTableTiltle' value='"+table+"'>"
				);
				$("#pageChange").attr("action", "/dataSetConfirmLink/infoViewMakeStandarData");
				$("#pageChange").submit();
			},
	    	//파일 db화
	    	insertFileData: function(){
	    		var vm = this;
	    		for(var i=0; i<vm.fileColTypeList.length; i++){
	    			var colType = $("#colType"+i+" option:selected").val();
	    			vm.selectedColumnType.splice(i,0,colType);
	    		}
	    		vm.checkedColumnIndex.sort(function(a,b){
	    			return a-b;
	    		});
	    		if(vm.rejectFlag==0){
	    			swal({
						html: "한 번 요청 승인 후, 다시 승인 거부를 할 수 없습니다. <br>승인하시겠습니까?",
				        type: 'question',
				        showCancelButton: true,
				        confirmButtonColor: '#3085d6',
				        cancelButtonColor: '#d33',
				        confirmButtonText: '승인하기',
				        cancelButtonText: '취소',
				        reverseButtons: true,
				        confirmButtonClass: 'btn',
				        cancelButtonClass: 'btn btn-cencle',
				        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
				        allowEscapeKey:false, //esc 눌러도 안 없어짐
	    			}).then(function(isConfirm){
						if(isConfirm){
				    		var colIndexObject = JSON.stringify(vm.checkedColumnIndex);
				    		var colNameObject = JSON.stringify(vm.fileColNameList);
				    		var colTypeObject = JSON.stringify(vm.selectedColumnType);
				    		$.ajax({
				    			url:'/dataSetConfirm/insertFileData',
				    			data: {
				    				"dataCode" : vm.dataCode,
				    				"fileName" : vm.normalDataInfo.fileName,
				    				"colIndexObject" : colIndexObject,
				    				"colNameObject" : colNameObject,
				    				"colTypeObject" : colTypeObject,
//			 	    				"checkedColumnIndexst" : vm.checkedColumnIndex,
//			 	    				"fileColNameList" : vm.fileColNameList,
//			 	    				"fileColTypeList" : vm.selectedColumnType,
//			 	    				"fileDataList" : vm.fileDataList,
				    			},
				    			type:'post',
				    			success: function(data){
				    				vm.selectedColumnType = [];
				    				if(data.result == 0){
				    					swal({
				  		                  title: "db화 실패",
				  		                  text: "이름이 중복된 칼럼이 있습니다. 이름이 중복된 칼럼은 체크 해제한 후 다시 생성해주시기 바랍니다.",
				  	                      type: 'warning',
				  	                      confirmButtonColor: '#3085d6',
				  	                      confirmButtonText: '확인',
				  	                      confirmButtonClass: 'btn',
				  						});
				    				} else if(data.result == 1){
				    					swal({
					  		                  title: "db화 실패",
					  		                  text: "테이블 생성에 실패했습니다. 이 문제는 직접 문의해주시기 바랍니다.",
					  	                      type: 'error',
					  	                      confirmButtonColor: '#3085d6',
					  	                      confirmButtonText: '확인',
					  	                      confirmButtonClass: 'btn',
					  					});
				    				} else if(data.result == 2){
				    					swal({
					  		                  title: "db화 실패",
					  		                  text: "데이터 삽입에 실패했습니다. 이 문제는 직접 문의해주시기 바랍니다.",
					  	                      type: 'error',
					  	                      confirmButtonColor: '#3085d6',
					  	                      confirmButtonText: '확인',
					  	                      confirmButtonClass: 'btn',
					  					});
				    				} else if(data.result == 3) {
				    					vm.infoViewMakeStandarData(vm.dataCode, data.tableName);
				    				} else {
				    					vm.selectNormalDatabase();
				    					vm.rejectFlag = 2;
				    				}
				    			},
				    			beforeSend: function(){
				    				$("#loading").show();
				    			},
				    			complete: function(){
				    				$('#loading').hide();
				    			},
				    			error: function(){
				    				swal({
				  		                  title: "db화 실패",
				  		                  text: "파일 데이터 DB화에 실패했습니다.",
				  	                      type: 'error',
				  	                      confirmButtonColor: '#3085d6',
				  	                      confirmButtonText: '확인',
				  	                      confirmButtonClass: 'btn',
				  					});
				    			}
				    		});
						}
					}).catch(swal.noop);
				}
	    	},
	    	//일시 데이터 DB 보여주기
	    	selectNormalDatabase: function(){
	    		$("#normalDataTableCheck").modal({backdrop: 'static', keyboard: false});
	    		var vm = this;
	    		$.ajax({
	    			url:'/dataSetConfirm/selectNormalDatabase',
	    			data:{
	    				"dataCode" : vm.dataCode,
	    				"perPage" : vm.pagingInfo.perPage,
	    				"currentPage" : vm.pagingInfo.currentPage,
	    			},
	    			type:'post',
	    			success: function(data){
	    				vm.selectNormalDataRowCount();
	    				vm.normalDatabaseList = data.normalDatabase;
	    				vm.normalDatabaseColNameList = data.normalDataColName;
	    				vm.normalDataTableName = data.normalDataTableName;
	    			},
	    			beforeSend: function(){
	    				$("#loading").show();
	    			},
	    			complete: function(){
	    				$('#loading').hide();
	    			},
	    			error: function(){
// 	    				alert("selectNormalDatabase 에러");
	    			}
	    		});
	    	},
	    	//거부사유 저장
	    	updateRejectReason: function(code, reason){
	    		var vm = this;
	    		swal({
	    			html: "한 번 요청 승인 거절 후, 취소할 수 없습니다. <br>승인 거부하시겠습니까?",
					type: 'question',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소',
					reverseButtons: true,
					confirmButtonClass: 'btn',
					cancelButtonClass: 'btn btn-cencle',
					allowOutsideClick:false, //밖에 클릭해도 안 없어짐
					allowEscapeKey:false, //esc 눌러도 안 없어짐
				}).then(function(isConfirm){
					if(isConfirm){
						$.ajax({
			    			url:'/dataSetConfirm/updateRejectReason',
			    			data:{
			    				"dataCode" : vm.dataCode,
			    				"rejectReason" : vm.rejectReason,
			    			},
			    			type:'post',
			    			success: function(){
			    				vm.selectDataRejectList();
			    			},
			    			error: function(){
			    				swal({
					                title: "승인 거부 실패",
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    
								})
			    			}
			    		});
					}
				}).catch(swal.noop);
	    	},
	    	//연관 보고서 조회
	    	selectReferenceReportList: function(){
	    		var vm = this;
	    		$.ajax({
	    			url:'/dataSetConfirm/selectReferenceReportList',
	    			data:{
	    				"dataCode" : vm.dataCode,
	    			},
	    			type:'post',
	    			success: function(list){
	    				vm.referenceReportList = list;
	    			}
	    		});
	    	},
	    	//시각화 요청 거부 리스트 조회
	    	selectDataRejectList: function(){
	    		window.location.href='/dataSetConfirmLink/selectDataRejectList';
	    	},
	    	
	    	reportInfoView : function(code){
				$("#pageChange").html(
				  "<input type='hidden' name='reportCode' value="+code+">"
				  +"<input type='hidden' name='reportDisplaySet' value="+vm.reportDisplaySet+">"
				);
				$("#pageChange").attr("action","/report/reportView");
				$("#pageChange").submit();
		    },
		    //시각화 요청 목록 조회
		    selectVizRequestList: function(){
		    	window.location.href='/dataSetConfirmLink/selectVizRequestList';
		    },
		    //데이터베이스 관리 조회 (화면 이동)
		    selectDatabaseManagement: function(){
		    	window.location.href='/dataSetConfirmLink/selectDatabaseManagement';
		    },
		    
		    //db 데이터 총 행 수
		    selectNormalDataRowCount: function(){
		    	var vm = this;
		    	$.ajax({
		    		url:'/dataSetConfirm/selectNormalDataRowCount',
		    		data:{
		    			"dataCode" : vm.dataCode,
		    		},
		    		type:'post',
		    		success: function(records){
		    			vm.pagingInfo.records = records;
		    		},
		    		error: function(){
// 	    				alert("selectNormalDataRowCount 에러");
	    			}
		    	});
		    },
		    //페이징
		    selectNormalDatabasePaging: function(page){
		    	var vm = this;
		    	$.ajax({
		    		url:'/dataSetConfirm/selectNormalDatabasePaging',
		    		data:{
		    			"dataCode" : vm.dataCode,
		    			"currentPage" : vm.pagingInfo.currentPage,
		    			"perPage" : vm.pagingInfo.perPage,
		    		},
		    		type:'post',
		    		success: function(data){
		    			vm.normalDatabaseList = data;
		    		},
		    		error: function(){
// 	    				alert("selectNormalDatabasePaging 에러");
	    			}
		    	});
		    }
	    },
	    filters: {
	    },
	    watch: {
	    },
	    mounted: function () {
			var vm = this;
			vm.selectNormalDataSetInfo();
// 			vm.selectFilePreviewList();
			vm.selectReferenceReportList();
			this.$refs.table.$on('change', function(page){
				if (vm.pagingInfo.currentPage != page) {
					vm.pagingInfo.currentPage = page;
					vm.selectNormalDatabasePaging();
				}
			});
	    },
	 });

</script>

