package edu.words.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping({ "/index", "/" })
	public String listaKotow(Model model) {
		// model.addAttribute("koty", dao.getKoty());
		// model.addAttribute("koty", sDao.findAll());
		// model.addAttribute("koty", kotDataServices.listAll());
		return "index";
	}

}
