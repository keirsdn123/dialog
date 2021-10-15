<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

	
	var vm = new Vue({
	    el:"#datacheck" ,
	    data: {

	    	//���� ���� ����Ʈ 
	    	referenceReportList:[],
	    	
	    	//�ð�ȭ ��û ���� ������ �� ������
			normalDataInfo : {},
			//�ð�ȭ ��û ���� ������ �� ī�װ�
			normalDataCateInfo : {},
			
			//���ε�� ������ Į���� ����Ʈ
			fileColNameList : {},
			//���ε�� ������ Į���� Ÿ�� ����Ʈ
			fileColTypeList : {},
			//���ε�� ������ �����Ͱ� �� ���� ��� ����Ʈ
			fileDataList : [],
			previewData : [],
			
			//���� �̸����⿡�� ������ Į���� �ε��� ��ȣ
			checkedColumnIndex : [],
			//���� �̸����⿡�� ������ Į�� Ÿ��
			selectedColumnType : [],
			
			//������ �� �������ڵ�	       	       
			dataCode : ${dataCode},
// 			dataCode : 1,
			
			//�Ͻ� ������ dbȭ Ȯ�� ������ ����Ʈ
			normalDatabaseList : [],
			//�Ͻ� ������ dbȭ Ȯ�� ������ Į���� ����Ʈ
			normalDatabaseColNameList : {},
			//�Ͻ� ������ db ���̺� ��
			normalDataTableName : '',
			
			//�Ͻ� ������ �ð�ȭ ���� �ź� ����
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
	    	//�Ͻ� ������ �� ���� select
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
// 	    				alert("selectNormalDataSetInfo ����");
	    			}
	    		});
	    	},
	    	//���� �ٿ�ε� �޼���(���� �ۼ� x)
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
			                  title: "���� �ٿ�ε� ����",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: 'Ȯ��',
		                      confirmButtonClass: 'btn',
						});
						$('#loading').hide();
					}
	  			})
	    	},
	    	//�Ͻ� ������ �� ���� �̸�����
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
							title: "������ ��ȸ ����",
							type: 'warning',
							confirmButtonColor: '#3085d6',
							confirmButtonText: 'Ȯ��',
							confirmButtonClass: 'btn',
						});
	    			}
	    		});
	    	},
	    	//dbȭ�� �� �̸�����
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
	    	
	    	//ǥ�ص����� ���� ȭ������ �̵�
	    	infoViewMakeStandarData : function(code, table){
				$("#pageChange").html(
					"<input type='hidden' name='dataCode' value="+code+">"+
					"<input type='hidden' name='normalDataTableTiltle' value='"+table+"'>"
				);
				$("#pageChange").attr("action", "/dataSetConfirmLink/infoViewMakeStandarData");
				$("#pageChange").submit();
			},
	    	//���� dbȭ
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
						html: "�� �� ��û ���� ��, �ٽ� ���� �źθ� �� �� �����ϴ�. <br>�����Ͻðڽ��ϱ�?",
				        type: 'question',
				        showCancelButton: true,
				        confirmButtonColor: '#3085d6',
				        cancelButtonColor: '#d33',
				        confirmButtonText: '�����ϱ�',
				        cancelButtonText: '���',
				        reverseButtons: true,
				        confirmButtonClass: 'btn',
				        cancelButtonClass: 'btn btn-cencle',
				        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
				        allowEscapeKey:false, //esc ������ �� ������
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
				  		                  title: "dbȭ ����",
				  		                  text: "�̸��� �ߺ��� Į���� �ֽ��ϴ�. �̸��� �ߺ��� Į���� üũ ������ �� �ٽ� �������ֽñ� �ٶ��ϴ�.",
				  	                      type: 'warning',
				  	                      confirmButtonColor: '#3085d6',
				  	                      confirmButtonText: 'Ȯ��',
				  	                      confirmButtonClass: 'btn',
				  						});
				    				} else if(data.result == 1){
				    					swal({
					  		                  title: "dbȭ ����",
					  		                  text: "���̺� ������ �����߽��ϴ�. �� ������ ���� �������ֽñ� �ٶ��ϴ�.",
					  	                      type: 'error',
					  	                      confirmButtonColor: '#3085d6',
					  	                      confirmButtonText: 'Ȯ��',
					  	                      confirmButtonClass: 'btn',
					  					});
				    				} else if(data.result == 2){
				    					swal({
					  		                  title: "dbȭ ����",
					  		                  text: "������ ���Կ� �����߽��ϴ�. �� ������ ���� �������ֽñ� �ٶ��ϴ�.",
					  	                      type: 'error',
					  	                      confirmButtonColor: '#3085d6',
					  	                      confirmButtonText: 'Ȯ��',
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
				  		                  title: "dbȭ ����",
				  		                  text: "���� ������ DBȭ�� �����߽��ϴ�.",
				  	                      type: 'error',
				  	                      confirmButtonColor: '#3085d6',
				  	                      confirmButtonText: 'Ȯ��',
				  	                      confirmButtonClass: 'btn',
				  					});
				    			}
				    		});
						}
					}).catch(swal.noop);
				}
	    	},
	    	//�Ͻ� ������ DB �����ֱ�
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
// 	    				alert("selectNormalDatabase ����");
	    			}
	    		});
	    	},
	    	//�źλ��� ����
	    	updateRejectReason: function(code, reason){
	    		var vm = this;
	    		swal({
	    			html: "�� �� ��û ���� ���� ��, ����� �� �����ϴ�. <br>���� �ź��Ͻðڽ��ϱ�?",
					type: 'question',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Ȯ��',
					cancelButtonText: '���',
					reverseButtons: true,
					confirmButtonClass: 'btn',
					cancelButtonClass: 'btn btn-cencle',
					allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
					allowEscapeKey:false, //esc ������ �� ������
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
					                title: "���� �ź� ����",
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: 'Ȯ��',
				                    confirmButtonClass: 'btn',
				                    
								})
			    			}
			    		});
					}
				}).catch(swal.noop);
	    	},
	    	//���� ���� ��ȸ
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
	    	//�ð�ȭ ��û �ź� ����Ʈ ��ȸ
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
		    //�ð�ȭ ��û ��� ��ȸ
		    selectVizRequestList: function(){
		    	window.location.href='/dataSetConfirmLink/selectVizRequestList';
		    },
		    //�����ͺ��̽� ���� ��ȸ (ȭ�� �̵�)
		    selectDatabaseManagement: function(){
		    	window.location.href='/dataSetConfirmLink/selectDatabaseManagement';
		    },
		    
		    //db ������ �� �� ��
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
// 	    				alert("selectNormalDataRowCount ����");
	    			}
		    	});
		    },
		    //����¡
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
// 	    				alert("selectNormalDatabasePaging ����");
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

