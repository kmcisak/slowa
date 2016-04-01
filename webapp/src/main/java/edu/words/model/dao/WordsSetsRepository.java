package edu.words.model.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.words.model.entities.WordsSet;

@Repository
public interface WordsSetsRepository extends CrudRepository<WordsSet, Long> {

	public WordsSet findBySetsName(String setsName);

	@Transactional
	public Long deleteBySetsName(String setsName);

	public Iterable<WordsSet> findByUserLogin(String login);

}
