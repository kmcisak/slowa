package edu.words.model.dto;

import java.util.List;

import edu.words.model.entities.User;
import edu.words.model.entities.Words;

public class WordsSetDto {

	private Long id;

	private String setsName;

	private List<Words> words;

	private User user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSetsName() {
		return setsName;
	}

	public void setSetsName(String setsName) {
		this.setsName = setsName;
	}

	public List<Words> getWords() {
		return words;
	}

	public void setWords(List<Words> words) {
		this.words = words;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
