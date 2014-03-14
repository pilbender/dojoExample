package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("tables")
public class TablesController {
	@RequestMapping(method = RequestMethod.GET)
	public String talbesPage(ModelMap model) {
		return "tables";
	}
}