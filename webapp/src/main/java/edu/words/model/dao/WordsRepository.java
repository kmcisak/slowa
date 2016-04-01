package edu.words.model.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.words.model.entities.Words;
import java.lang.Long;
import java.util.List;

@Repository
public interface WordsRepository extends CrudRepository<Words, Long> {

	public List<Words> findByWordsSet_id(Long id);

}
