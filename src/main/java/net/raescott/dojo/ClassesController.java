package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("classes")
public class ClassesController {
	@RequestMapping(method = RequestMethod.GET)
	public String ClassesPage(ModelMap model) {
		return "classes";
	}

}