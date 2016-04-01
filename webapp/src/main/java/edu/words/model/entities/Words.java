package edu.words.model.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Words {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne
	private WordsSet wordsSet;

	private String stringA;

	private String stringB;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStringA() {
		return stringA;
	}

	public void setStringA(String stringA) {
		this.stringA = stringA;
	}

	public String getStringB() {
		return stringB;
	}

	public void setStringB(String stringB) {
		this.stringB = stringB;
	}

	public WordsSet getWordsSet() {
		return wordsSet;
	}

	public void setWordsSet(WordsSet wordsSet) {
		this.wordsSet = wordsSet;
	}

	@Override
	public String toString() {
		return "Words [id=" + id + ", wordsSet=" + wordsSet + ", stringA=" + stringA + ", stringB=" + stringB + "]";
	}

}
