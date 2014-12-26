package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("mixin")
public class MixinController {
	@RequestMapping(method = RequestMethod.GET)
	public String mixinPage() {
		return "mixin";
	}

}