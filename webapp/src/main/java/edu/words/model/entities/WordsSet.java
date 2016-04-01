package edu.words.model.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class WordsSet {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String setsName;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "wordsSet")
	private List<Words> words;

	@ManyToOne
	@JoinColumn(name = "ownerId")
	private User user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getSetsName() {
		return setsName;
	}

	public void setSetsName(String setsName) {
		this.setsName = setsName;
	}

}
