package net.raescott.dojo;

import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("widget")
public class WidgetController {
	@RequestMapping(method = RequestMethod.GET)
	public String widgetPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "widget";
	}

	@RequestMapping(value = "widget-layer", method = RequestMethod.GET)
	public String widgetLayerPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "widget-layer";
	}

	@RequestMapping(value = "person-data", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> exampleJson() throws InterruptedException {
		Map<String, String> response = new TreeMap<String, String>();
		Thread.sleep(2000);
		response.put("name", "Scott Smith");
		response.put("age", "5");
		response.put("state", "Arizona");
		return response;
	}

}
