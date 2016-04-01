package edu.words.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.words.model.dao.UserRepository;
import edu.words.model.dao.WordsRepository;
import edu.words.model.dao.WordsSetsRepository;
import edu.words.model.dto.WordsDto;
import edu.words.model.dto.WordsDtoForm;
import edu.words.model.entities.Words;
import edu.words.model.entities.WordsSet;

@Controller
@RequestMapping("/user")
public class WordsController {

	private static List<WordsDto> words = new ArrayList<WordsDto>();

	@Autowired
	private WordsRepository wordsDao;

	@Autowired
	private UserRepository userDao;

	@Autowired
	private WordsSetsRepository wordsSetsDaoInterface;

	@RequestMapping(value = "get", method = RequestMethod.GET)
	public ModelAndView getWordsForm() {

		WordsDtoForm wordsDtoForm = new WordsDtoForm();
		wordsDtoForm.setWords(words);
		return new ModelAndView("add_words", "wordsDtoForm", wordsDtoForm);

	}

	@RequestMapping(value = { "/home", "/edit/home" }, method = RequestMethod.GET)
	public String homeRedir() {
		return "redirect:/home";
	}

	@RequestMapping(value = { "/about", "/edit/about" }, method = RequestMethod.GET)
	public String aboutRedir() {
		return "redirect:/about";
	}

	@RequestMapping(value = { "/user", "/edit/user" }, method = RequestMethod.GET)
	public ModelAndView userPage() {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		System.out.println(name);

		Iterable<WordsSet> allSets = wordsSetsDaoInterface.findByUserLogin(name);

		return new ModelAndView("redirect:/user", "allSets", allSets);
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView saveSet(@ModelAttribute("wordsDtoForm") WordsDtoForm wordsDtoForm) {
		List<WordsDto> words = wordsDtoForm.getWords();
		WordsSet wordsSet = new WordsSet();
		wordsSet.setSetsName(wordsDtoForm.getWordsSet());

		wordsSet.setUser(userDao.findByLogin(wordsDtoForm.getOwner()));
		wordsSetsDaoInterface.save(wordsSet);

		if (words != null && words.size() > 0) {
			WordsController.words = words;
			for (WordsDto wordsDto : words) {

				if (wordsDto.getStringA().isEmpty() || wordsDto.getStringB().isEmpty()) {

				} else {
					Words wordsEnt = new Words();
					wordsEnt.setStringA(wordsDto.getStringA());
					System.out.println(wordsDto.getStringA());
					wordsEnt.setStringB(wordsDto.getStringB());
					wordsEnt.setWordsSet(wordsSet);
					wordsDao.save(wordsEnt);

				}

			}
		}
		return new ModelAndView("redirect:/user", "wordsDtoForm", wordsDtoForm);
	}

	@RequestMapping(value = "/delete/{set}", method = RequestMethod.GET)
	public ModelAndView deleteSet(@PathVariable("set") Long id) {

		wordsDao.delete(wordsDao.findByWordsSet_id(id));
		wordsSetsDaoInterface.delete(id);

		Iterable<WordsSet> allSets = wordsSetsDaoInterface.findAll();

		return new ModelAndView("redirect:/user", "allSets", allSets);
	}

	@RequestMapping(value = "/show/{set}", method = RequestMethod.GET)
	public ModelAndView showSet(@PathVariable("set") Long id) {

		WordsSet set = wordsSetsDaoInterface.findOne(id);

		return new ModelAndView("showWords", "set", set);
	}

	@RequestMapping(value = "/edit/{set}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable("set") Long id) {
		ModelAndView model = new ModelAndView();

		WordsDtoForm wordsDtoForm = new WordsDtoForm();
		WordsSet set = wordsSetsDaoInterface.findOne(id);

		model.addObject("set", set);
		model.addObject("wordsDtoForm", wordsDtoForm);
		model.setViewName("editSet");

		return model;
	}

	@RequestMapping(value = "/edit/update", method = RequestMethod.POST)
	public ModelAndView updateSet(@ModelAttribute("wordsDtoForm") WordsDtoForm wordsDtoForm) {
		List<WordsDto> words = wordsDtoForm.getWords();
		WordsSet wordsSet = new WordsSet();
		wordsSet.setSetsName(wordsDtoForm.getWordsSet());

		wordsSet.setUser(userDao.findByLogin(wordsDtoForm.getOwner()));
		wordsSetsDaoInterface.save(wordsSet);

		if (words != null && words.size() > 0) {
			WordsController.words = words;
			for (WordsDto wordsDto : words) {

				if (wordsDto.getStringA().isEmpty() || wordsDto.getStringB().isEmpty()) {

				} else {
					Words wordsEnt = new Words();
					wordsEnt.setStringA(wordsDto.getStringA());
					wordsEnt.setStringB(wordsDto.getStringB());
					wordsEnt.setWordsSet(wordsSet);
					wordsDao.save(wordsEnt);

				}

			}
		}

		return new ModelAndView("redirect:/user", "wordsDtoForm", wordsDtoForm);
	}

}
