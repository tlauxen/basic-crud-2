package com.tlauxen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlauxen.dao.CidadeDao;
import com.tlauxen.model.Cidade;

@Service
public class CidadeService implements CrudService<Cidade> {

	@Autowired
	private CidadeDao cidadeDao;
	
	public Cidade saveOrUpdate(Cidade cidade) {
		if (cidade.getId() == null) {
			return cidadeDao.create(cidade);
		} else {
			return cidadeDao.update(cidade);
		}
	}

	public List<Cidade> find(Cidade filter) {
		return cidadeDao.find(filter);
	}

	public void remove(Cidade model) {
		cidadeDao.remove(model);
	}

	public Cidade findById(Long id) {
		return cidadeDao.findById(id);
	}
	
}
