package net.su.dialog.dataSet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/dataCreate")
public class DataSetCreateController {

	//표준데이터가공 완료후 시각화 설정 화면이동
	@RequestMapping("/selectViewStandarPreview")
	public String selectViewStandarPreview (int dataCode, String standarTbTitle, Model model) {
		model.addAttribute("dataCode", dataCode);
		model.addAttribute("standarTbTitle", standarTbTitle);
		return ".goStandarPreview";
	}
	
//	//시각화 요청 목록 화면이동
//	@RequestMapping("/selectVizRequestList")
//   public String selectVizRequestList(Model model) {
//      model.addAttribute("collectTab", "now-tab");
//      model.addAttribute("bigTab", "student");
//      return ".dataApprovalManagement";
//   }
}
