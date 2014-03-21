package net.raescott.dojo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("filtering-select")
public class FilteringSelectController {
	@RequestMapping(method = RequestMethod.GET)
	public String filteringSelectPage(ModelMap model) {
		model.addAttribute("message", "Page content");
		return "filtering-select";
	}

	@RequestMapping(value = "states", method = RequestMethod.GET)
	public @ResponseBody List<StateDto> stateService(ModelMap model) {
		List<StateDto> stateDtos = new ArrayList<StateDto>();
		stateDtos.add(new StateDto("Alabama", "AL"));
		stateDtos.add(new StateDto("Alaska", "AK"));
		stateDtos.add(new StateDto("American Samoa", "AS"));
		stateDtos.add(new StateDto("Arizona", "AZ"));
		stateDtos.add(new StateDto("Arkansas", "AR"));
		stateDtos.add(new StateDto("Armed Forces Europe", "AE"));
		stateDtos.add(new StateDto("Armed Forces Pacific", "AP"));
		stateDtos.add(new StateDto("Armed Forces the Americas", "AA"));
		stateDtos.add(new StateDto("California", "CA"));
		stateDtos.add(new StateDto("Colorado", "CO"));
		stateDtos.add(new StateDto("Connecticut", "CT"));
		stateDtos.add(new StateDto("Delaware", "DE"));
		stateDtos.add(new StateDto("District of Columbia", "DC"));
		stateDtos.add(new StateDto("Federated States of Micronesia", "FM"));
		stateDtos.add(new StateDto("Florida", "FL"));
		stateDtos.add(new StateDto("Georgia", "GA"));
		stateDtos.add(new StateDto("Guam", "GU"));
		stateDtos.add(new StateDto("Hawaii", "HI"));
		stateDtos.add(new StateDto("Idaho", "ID"));
		stateDtos.add(new StateDto("Illinois", "IL"));
		stateDtos.add(new StateDto("Indiana", "IN"));
		stateDtos.add(new StateDto("Iowa", "IA"));
		stateDtos.add(new StateDto("Kansas", "KS"));
		stateDtos.add(new StateDto("Kentucky", "KY"));
		stateDtos.add(new StateDto("Louisiana", "LA"));
		stateDtos.add(new StateDto("Maine", "ME"));
		stateDtos.add(new StateDto("Marshall Islands", "MH"));
		stateDtos.add(new StateDto("Maryland", "MD"));
		stateDtos.add(new StateDto("Massachusetts", "MA"));
		stateDtos.add(new StateDto("Michigan", "MI"));
		stateDtos.add(new StateDto("Minnesota", "MN"));
		stateDtos.add(new StateDto("Mississippi", "MS"));
		stateDtos.add(new StateDto("Missouri", "MO"));
		stateDtos.add(new StateDto("Montana", "MT"));
		stateDtos.add(new StateDto("Nebraska", "NE"));
		stateDtos.add(new StateDto("Nevada", "NV"));
		stateDtos.add(new StateDto("New Hampshire", "NH"));
		stateDtos.add(new StateDto("New Jersey", "NJ"));
		stateDtos.add(new StateDto("New Mexico", "NM"));
		stateDtos.add(new StateDto("New York", "NY"));
		stateDtos.add(new StateDto("North Carolina", "NC"));
		stateDtos.add(new StateDto("North Dakota", "ND"));
		stateDtos.add(new StateDto("Northern Mariana Islands", "MP"));
		stateDtos.add(new StateDto("Ohio", "OH"));
		stateDtos.add(new StateDto("Oklahoma", "OK"));
		stateDtos.add(new StateDto("Oregon", "OR"));
		stateDtos.add(new StateDto("Pennsylvania", "PA"));
		stateDtos.add(new StateDto("Puerto Rico", "PR"));
		stateDtos.add(new StateDto("Rhode Island", "RI"));
		stateDtos.add(new StateDto("South Carolina", "SC"));
		stateDtos.add(new StateDto("South Dakota", "SD"));
		stateDtos.add(new StateDto("Tennessee", "TN"));
		stateDtos.add(new StateDto("Texas", "TX"));
		stateDtos.add(new StateDto("Utah", "UT"));
		stateDtos.add(new StateDto("Vermont", "VT"));
		stateDtos.add(new StateDto("Virgin Islands, U.S.", "VI"));
		stateDtos.add(new StateDto("Virginia", "VA"));
		stateDtos.add(new StateDto("Washington", "WA"));
		stateDtos.add(new StateDto("West Virginia", "WV"));
		stateDtos.add(new StateDto("Wisconsin", "WI"));
		stateDtos.add(new StateDto("Wyoming", "WY"));

		return stateDtos;
	}
}
