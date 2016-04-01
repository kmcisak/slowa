package edu.words.model.dto;

import org.hibernate.validator.constraints.NotBlank;

import edu.words.model.validators.PasswordMatches;
import edu.words.model.validators.ValidEmail;

@PasswordMatches
public class UserDto {

	@NotBlank(message = "nazwa użytkownika jest wymagana")
	private String login;

	@NotBlank(message = "hasło jest wymagane")
	private String password;

	@NotBlank(message = "potwierdź hasło")
	private String passwordConf;

	@ValidEmail
	@NotBlank(message = "adres email jest wymagany")
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPasswordConf() {
		return passwordConf;
	}

	public void setPasswordConf(String passwordConf) {
		this.passwordConf = passwordConf;
	}

}
