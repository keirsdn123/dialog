<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#devlopSource",
	data: {
		selectDevlopSourceList : [],	//수집 소스 파일 리스트
	},
	methods: {
		//수집 쇼스 파일 조회
		selectDevlopSource: function () {
			var vm = this;
			$.ajax({
				url: '/selectDevlopSource',
				data: {
				},
				type: 'post',
				success: function (list) {
					vm.selectDevlopSource = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},
	},
	filters: {
	},
	watch: {
	},
	mounted: function () {
		var vm = this;
		vm.selectDevlopSource();
	},
});
</script>
