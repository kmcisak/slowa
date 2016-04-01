package edu.words.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.words.model.dao.UserRepository;
import edu.words.model.dto.UserDto;
import edu.words.model.entities.User;
import edu.words.model.validators.EmailExistsException;

@Service
public class UsersService {

	@Autowired
	UserRepository userDao;

	public User registerNewUser(UserDto userDto) throws EmailExistsException {
		if (emailExist(userDto.getEmail())) {
			throw new EmailExistsException("podany mail jest już zajęty");

		}

		emailExist(userDto.getEmail());
		User user = new User();
		user.setLogin(userDto.getLogin());
		user.setPassword(userDto.getPassword());
		user.setEmail(userDto.getEmail());
		return userDao.save(user);

	}

	private boolean emailExist(String email) {
		User user = userDao.findByEmail(email);
		if (user != null) {
			return true;
		}
		return false;
	}

}
