<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="schList">   
   <div class="modal fade" id="scheErrorInfoPopup" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width:800px; max-height:400px">
         <div class="modal-content">
            <div class="modal-header bg_gray font_w">
               <h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">스케줄 등록 </h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">
                  &times; 
                  </span>
               </button>
            </div>
            <div class="modal-body">
               <div class="modal-header bg_blue font_w">
                  <h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">스케줄 정보 </h5>
               </div>
                  <div class="wsize_97 po_r bd_d05" style="height:400px" id="style-3">
                  	  <div class="modal-header">
                    	 <div class="mg_auto">
                    	 	<h5 class="modal_tile_01 fw_5 f_sq ta_center">오류 정보</h5>
                  	 	 </div>
                  	  </div>	
                  	  <div style="width:100%; height:100%">
                  	  	<textarea style="width:100%; height:100%" v-model="scheErrorInfo.logMeteContents">
                  	  	</textarea>
                  	  </div>
                  </div>
               </div>
               <div class="under_title">
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-cencle size_100 fr" data-dismiss="modal">
                     	닫기
                  </button>
                  <button class="btn btn-creat size_100 fr" v-on:click ="scheduleUpdate">
                     	수정
                  </button>
               </div>
            </div>
         </div>
      </div>      
   </div>
   