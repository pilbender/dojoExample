package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("events")
public class EventsController {
	@RequestMapping(method = RequestMethod.GET)
	public String eventsPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "home";
	}

	@RequestMapping(value = "example-data", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> exampleJson() {
		Map<String, String> response = new TreeMap<String, String>();
		response.put("status", "true");
		return response;
	}

}