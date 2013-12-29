package com.tlauxen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlauxen.model.Cidade;
import com.tlauxen.service.CidadeService;

@Controller
@RequestMapping("/cidade")
public class CidadeController extends AbstractCrudController<Cidade> {
	
	@Autowired
	private CidadeService cidadeService;
	
	@Override
	protected CidadeService getCrudService() {
		return cidadeService;
	}

    @RequestMapping("/listagem")
    public String listagem(HttpServletRequest request, HttpServletResponse response) {
    	
    	return "cidade.listagem";
    }
    
    @RequestMapping("/cadastro/**")
    public String cadastro(HttpServletRequest request, HttpServletResponse response) {
    	
    	return "cidade.cadastro";
    }
    
    @RequestMapping(headers ={"Accept=application/json"}, value="/ajax/find",method=RequestMethod.POST)
    public @ResponseBody List<Cidade> find(@RequestBody Cidade filter) {
    	
    	return getCrudService().find(filter);
    	
    }
    
}
