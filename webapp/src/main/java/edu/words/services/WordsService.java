package edu.words.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.words.model.dao.UserRepository;

@Service
public class WordsService {
	
	@Autowired
	UserRepository userDaoInterface;
	
	
	

}
