package edu.words.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.words.model.dao.UserRepository;
import edu.words.model.dto.UserDto;
import edu.words.model.entities.User;
import edu.words.model.validators.EmailExistsException;
import edu.words.services.UsersService;

@Controller
public class UserController {

	@Autowired
	protected UserRepository userDao;

	@Autowired
	UsersService service;

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String showForm(Model model) {
		UserDto userDto = new UserDto();

		model.addAttribute("userForm", userDto);
		return "signUpForm";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signUpUser(@ModelAttribute("userForm") @Valid UserDto userForm, BindingResult result,
			Model model) {

		User registered = new User();

		if (!result.hasErrors()) {
			registered = createUserAccount(userForm, result);
		}
		if (registered == null) {
			result.rejectValue("email", "error.email", "Podany adres jest zajęty");
		}

		if (result.hasErrors()) {
			return new ModelAndView("signUpForm", "userForm", userForm);
		} else {
			return new ModelAndView("successRegister", "userForm", userForm);
		}
	}

	private User createUserAccount(UserDto userDto, BindingResult result) {
		User registered = null;
		try {
			registered = service.registerNewUser(userDto);
		} catch (EmailExistsException e) {
			return null;
		}
		return registered;
	}

}
