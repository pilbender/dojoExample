package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("calculator")
public class CalulatorController {
	@RequestMapping(method = RequestMethod.GET)
	public String calculatorPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "calculator";
	}
}