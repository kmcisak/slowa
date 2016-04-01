package edu.words.model.validators;

@SuppressWarnings("serial")
public class EmailExistsException extends Throwable {

	public EmailExistsException(final String message) {
		super(message);
	}

}