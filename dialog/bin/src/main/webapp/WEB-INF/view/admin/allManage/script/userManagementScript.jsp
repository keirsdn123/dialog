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
    		  		alert("변경되었습니다");
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
  				title: "회원을 정말 삭제 하시겠습니까?",
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
					$.ajaxSettings.traditional = true; //리스트 배열 지원
					$.ajax({
						url: "/deleteMember", 		
					  	data :{
							  	"memberSeqList":vm.memberSeqList,
					  	},
					  	type:'post',
					  	success: function(){
					  		swal({
			                  	title: "회원 삭제 완료",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
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
				                title: "회원 삭제 실패",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
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
