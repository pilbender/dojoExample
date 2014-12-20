package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Richard Scott Smith <scott.smith@isostech.com>
 */
@Controller
@RequestMapping("dom")
public class DomController {
	@RequestMapping(method = RequestMethod.GET)
	public String domPage() {
		return "dom";
	}
}
