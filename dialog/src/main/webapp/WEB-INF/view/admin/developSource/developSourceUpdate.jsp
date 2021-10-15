<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="dashboard">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 개발 소스 파일 등록
			</p>
		</div>
		<div class="cb"></div>
		<!--앨범 관리(등록)-->
		<div class="photo_write">
			<table class="table table-ddd">
				<colgroup>
					<col width="150px" />
					<col width="calc(50% - 150px)" />
					<col width="150px" />
					<col width="calc(50% - 150px)" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" class="wsize_100 form-control"></td>
					</tr>
					<tr>
						<th>구분</th>
						<td colspan="3"><label class="custom-control custom-radio fl">
								<input id="radio2" name="radio" type="radio"
								class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">수집</span>
						</label> <label class="custom-control custom-radio fl"> <input
								id="radio2" name="radio" type="radio"
								class="custom-control-input"> <span
								class="custom-control-indicator"></span> <span
								class="custom-control-description">표준화</span>
						</label></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<th>설명</th>
						<td colspan="3"><textarea class="form-control rounded-0"
								id="exampleFormControlTextarea1" rows="18">dsdadsadsad</textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><input type="file"
							class="form-control size_250" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--//앨범 카테고리-->
		<div class="cb"></div>
		<!--버튼-->
		<div class="buttons mt_15" role="group" aria-label="...">
			<a href="resources.html" class="btn btn-creat size_100" role="button">취소</a>
			<a href="resources.html" class="btn btn-creat size_100" role="button">등록</a>
		</div>
		<div class="cb"></div>
		<!--//버튼-->

	</div>
</div>