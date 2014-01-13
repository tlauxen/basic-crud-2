package com.tlauxen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlauxen.dao.FeriadoDao;
import com.tlauxen.model.Feriado;

@Service
public class FeriadoService implements CrudService<Feriado> {

	@Autowired
	private FeriadoDao feriadoDao;
	
	public Feriado saveOrUpdate(Feriado feriado) {
		if (feriado.getId() == null) {
			return feriadoDao.create(feriado);
		} else {
			return feriadoDao.update(feriado);
		}
	}

	public List<Feriado> find(Feriado filter) {
		return feriadoDao.find(filter);
	}

	public void remove(Feriado model) {
		feriadoDao.remove(model);
	}

	public Feriado findById(Long id) {
		return feriadoDao.findById(id);
	}
	
}
