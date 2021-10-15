<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
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
			});
		}); 
   var vm = new Vue({
      el : "#queInsert",
      data : {
    	  memberCode: '',
      },
      methods : {
    	  //문의사항 등록
    	  insertQuestion: function() {
    		  var vm = this;
  			if($("#noticeTitle").val()==""){
				swal({
	                  title: "문의사항 등록 오류",
	                  text:"제목을 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
				});
			}
			else if($("#noticeContent").val()==""){
				swal({
	                  title: "문의사항 등록 오류",
	                  text:"내용을 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
				});
			}
			else{
    		  var formData= new FormData($("#insertQuestionFrm")[0]);
    		  console.log(formData);
              $.ajax({
            	  type : "POST",
                 url : '/insertQuestion',
	             data : formData,      
	             processData: false,
	             contentType: false,
                 success: function(){
                	 $("#loading").hide();
				        swal({
				            title: "문의사항이 등록 되었습니다.",
				            type: 'success',
				            confirmButtonColor: '#3085d6',
				            confirmButtonText: '확인',
				            confirmButtonClass: 'btn',
				            allowOutsideClick:false,
					          allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								window.location.href="/question";
							}
						}).catch(swal.noop);
                 },
    				error : function(xhr, status, error) {
       					$("#loading").hide();
       					swal({
       		                  title: "문의사항 등록 실패",
       	                      type: 'warning',
       	                      confirmButtonColor: '#3085d6',
       	                      confirmButtonText: '확인',
       	                      confirmButtonClass: 'btn',
       					});
       				}
              
              })
			}
           },    	   
      },

      filters : {

      },
      watch : {

      },
      mounted : function() {
         var vm = this;
//          vm.selectMessageList();
      
   		},
   });

</script>