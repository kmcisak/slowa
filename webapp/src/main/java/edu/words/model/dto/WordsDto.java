package edu.words.model.dto;

public class WordsDto {

	private String stringA;

	private String stringB;

	public WordsDto() {
	}

	public WordsDto(String stringA, String stringB) {
		this.stringA = stringA;
		this.stringB = stringB;
	}

	public String getStringA() {
		return stringA.replaceAll("\\s", "");
	}

	public void setStringA(String stringA) {
		this.stringA = stringA;
	}

	public String getStringB() {
		return stringB.replaceAll("\\s", "");
	}

	public void setStringB(String stringB) {
		this.stringB = stringB;
	}

}
