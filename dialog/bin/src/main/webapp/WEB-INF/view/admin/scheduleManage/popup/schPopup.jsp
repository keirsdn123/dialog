<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="schList">   
   <div class="modal fade" id="schPopup" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
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
            <div class="modal-body" >
               <div class="wsize_50 fl pr_10 po_r bd_d table_sc17" id="style-3">
                  <div class="modal-header bg_blue font_w">
                     <h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">개발소스 파일 목록 </h5>
                  </div>
                  <div class="wsize_97 hsize_01 po_r bd_d table_sc33" id="style-3">
                  </div>
               </div>
               <div class="modal-header bg_blue font_w">
                  <h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">스케줄 정보 </h5>
               </div>
               <div class="wsize_50 fl pl_10 po_r bd_d table_sc17" id="style-3">
                  <div class="wsize_97 hsize_01 po_r bd_d table_sc30" id="style-3">
                     <table style="margin-top:15px" cellpadding="5">
                        <tr style="padding:10px">
                           <td class="table_tr_td_01">작업명 :</td><td><input type="text" style="width:200px" v-model="sampleInfo.scheWorkTitle"></td>
                        </tr>
                        <tr style="padding:10px">
                           <td class="table_tr_td_01">개발 소스 파일명 :</td><td><input type="text"  style="width:200px"></td>
                        </tr>
                        <tr style="padding:10px">
                           <td class="table_tr_td_01">개발 소스 파일 경로 :</td><td><input type="text"  style="width:200px"></td>
                        </tr>
                     </table>
                  </div>
                  <div class="wsize_97 hsize_01 po_r bd_d table_sc32" id="style-3">
                     <table style="margin: 75px 30px 40px 40px;" cellpadding="5" >
                        <tr>
                           <td> Cron :</td><td><input type="text" style="width:220px" v-model="sampleInfo.scheCron" ></td>
                        </tr>
                        <tr>
                           <td> 분 :</td><td><input type="text"  style="width:220px"></td>
                        </tr>
                        <tr>
                           <td> 시간 :</td><td><input type="text"  style="width:220px"></td>
                        </tr>
                        <tr>
                           <td> 일 :</td><td><input type="text"  style="width:220px"></td>
                        </tr>
                        <tr>
                           <td> 월 :</td><td><input type="text"  style="width:220px"></td>
                        </tr>
                        <tr>
                           <td> 주 :</td><td><input type="text"  style="width:220px"></td>
                        </tr>
                        <tr>
                           <td> 년 :</td><td><input type="text"  style="width:220px"></td>
                        </tr>
                     </table>      
                  </div>
               </div>
               <div class="under_title">
                </div>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-cencle" data-dismiss="modal">
                     	닫기
                  </button>
                  <button class="btn btn-creat" v-on:click ="insertSche">
                     	등록
                  </button>
               </div>
            </div>
         </div>
      </div>      
   </div>