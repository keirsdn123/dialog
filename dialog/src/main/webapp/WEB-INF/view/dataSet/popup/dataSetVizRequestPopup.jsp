<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="requestViz" tabindex="-1" role="dialog" aria-labelledby="rejectLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="requestVizLabel">| 시각화 요청</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
					&times; 
					</span>
				</button>
			</div>
			<div class="modal-body" >
	             <textarea class="form-control rounded-0" rows="10" v-model="requestVizContent"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-cencle mr_10" data-dismiss="modal">
						닫기
				</button>
				<button type="button" class="btn btn-creat" v-on:click="requestDataSetViz">
					확인
				</button>
            </div>
        </div>
    </div>
</div>