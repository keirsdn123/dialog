<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#userManagement" ,
      data: {
    	  selectMemberList:[],
    	  selectAuthorityList:[],
    	  memberSeqList:[],
    	  searchType:'memName',
    	  searchContent:'',
      },
      methods: {
    	  MemberList : function(){
    		  var vm = this;
    		  $.ajax({
    			url: "/selectMemberList", 		
    		  	data :{
    		  		'searchType' : vm.searchType,
    		  		'searchContent' : vm.searchContent,
    		  	},
    		  	type:'post',
    		  	success: function(list){
    		  		vm.selectMemberList = list;
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
    		  $.ajax({
    			url: "/updateRatingCodeList", 		
    		  	data :{
    		  		"memberCode" : list.memberCode,
    		  		"memberRatingCode" : list.memberRatingCode,
    		  	},
    		  	type:'post',
    		  	success: function(list){
    		  		alert("����Ǿ����ϴ�");
    		  		window.location.href="/management/listViewMember";
    		  	},
    		  	error : function(){
    		  		alert("hhhh");
    		  	}
    		  })
    	  },
    	  allcheck:function(){
   		  	var vm = this;
    		vm.memberSeqList = [];
    		if ($("#allcheck").prop("checked")) {
	  			for(list in vm.selectMemberList){
	  				vm.memberSeqList.push(vm.selectMemberList[list].memberCode);
	  			}
    		}
    	  },
    	  deleteMemberList:function(){
    		  var vm = this;
    		  swal({
  				title: "ȸ���� ���� ���� �Ͻðڽ��ϱ�?",
  			        type: 'question',
  			        showCancelButton: true,
  			        confirmButtonColor: '#3085d6',
  			        cancelButtonColor: '#d33',
  			        confirmButtonText: '�����ϱ�',
  			        cancelButtonText: '���ư���',
  			        confirmButtonClass: 'btn',
  			        cancelButtonClass: 'btn btn-cencle',
  			        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
  			        allowEscapeKey:false, //esc ������ �� ������
  			        
  			}).then(function(isConfirm){
  				if(isConfirm){
					$.ajaxSettings.traditional = true; //����Ʈ �迭 ����
					$.ajax({
						url: "/deleteMember", 		
					  	data :{
							  	"memberSeqList":vm.memberSeqList,
					  	},
					  	type:'post',
					  	success: function(){
					  		swal({
			                  	title: "ȸ�� ���� �Ϸ�",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: 'Ȯ��',
			                    confirmButtonClass: 'btn',
			                    allowOutsideClick:false,
						        allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href="/management/listViewMember";
								}
							}).catch(swql.noop);
		      		  	},
		      		  	error : function(){
				  		  	swal({
				                title: "ȸ�� ���� ����",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: 'Ȯ��',
			                    confirmButtonClass: 'btn',
							})
		      		  	}
	      		  	})
				}
  			}).catch(swql.noop);
    	  },
    	  searchSelect:function(){
    		  var vm = this;
    		  console.log(vm.searchType);
    		  console.log(vm.searchContent);
    		  vm.MemberList();
    		  
    	  },
      },
      filters: {
      },
      watch: {
      },
      mounted: function () {
    	  var vm = this;
    	  vm.MemberList();
    	  vm.AuthorityList();
      },
   });
</script>
