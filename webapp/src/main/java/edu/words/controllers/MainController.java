package edu.words.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.words.model.dao.WordsSetsRepository;
import edu.words.model.entities.WordsSet;

@Controller
public class MainController {

	@Autowired
	private WordsSetsRepository wordsSetsDaoInterface;

	@RequestMapping(value = { "/home", "/" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		Iterable<WordsSet> allSets = wordsSetsDaoInterface.findAll();
		return new ModelAndView("index", "allSets", allSets);

	}

	@RequestMapping(value = { "show/home" }, method = RequestMethod.GET)
	public String homeRedir() {
		return "redirect:/home";
	}

	@RequestMapping(value = { "show/user" }, method = RequestMethod.GET)
	public String userRedir() {
		return "redirect:/user";
	}

	@RequestMapping(value = { "show/about" }, method = RequestMethod.GET)
	public String aboutRedir() {
		return "redirect:/about";
	}

	@RequestMapping(value = { "/about", "*/about" }, method = RequestMethod.GET)
	public String aboutPage() {
		return "about";
	}

	@RequestMapping(value = { "**/edit/{set}" }, method = RequestMethod.GET)
	public String showRedir() {
		return "redirect:/user/edit/{set}";
	}
	
	@RequestMapping(value = { "show/user/get" }, method = RequestMethod.GET)
	public String newRedir() {
		return "redirect:/user/get";
	}

	@RequestMapping(value = { "/user**", "*/user" }, method = RequestMethod.GET)
	public ModelAndView userPage() {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		System.out.println(name);

		Iterable<WordsSet> allSets = wordsSetsDaoInterface.findByUserLogin(name);

		return new ModelAndView("user", "allSets", allSets);
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Błędne dane!");
		}

		if (logout != null) {
			model.addObject("msg", "Zostałeś wylogowany");
		}
		model.setViewName("login");

		return model;
	}

	@RequestMapping(value = "/show/{set}", method = RequestMethod.GET)
	public ModelAndView showSet(@PathVariable("set") Long id) {

		WordsSet set = wordsSetsDaoInterface.findOne(id);

		return new ModelAndView("showWords", "set", set);
	}

}
