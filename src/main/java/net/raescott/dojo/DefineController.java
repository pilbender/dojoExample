package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("define")
public class DefineController {
	@RequestMapping(method = RequestMethod.GET)
	public String definePage() {
		return "define";
	}
}