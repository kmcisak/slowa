package edu.words.model.dto;

import java.util.List;

public class WordsDtoForm {

	private List<WordsDto> words;
	private String wordsSet;
	private String owner;

	public List<WordsDto> getWords() {
		return words;
	}

	public void setWords(List<WordsDto> words) {
		this.words = words;
	}

	public String getWordsSet() {
		return wordsSet;
	}

	public void setWordsSet(String wordsSet) {
		this.wordsSet = wordsSet;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

}
