package com.tlauxen.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlauxen.model.Cidade;
import com.tlauxen.model.Feriado;
import com.tlauxen.model.Feriado.TipoAbrangencia;
import com.tlauxen.model.Feriado.TipoPeriodo;
import com.tlauxen.model.Pais;
import com.tlauxen.service.CidadeService;
import com.tlauxen.service.FeriadoService;
import com.tlauxen.service.PaisService;

@Controller
@RequestMapping("/feriado")
public class FeriadoController extends AbstractCrudController<Feriado> {
	
	@Autowired
	private FeriadoService feriadoService;
	
	@Autowired
	private PaisService paisService;
	
	@Autowired
	private CidadeService cidadeService;
	
	@Override
	protected FeriadoService getCrudService() {
		return feriadoService;
	}

    @RequestMapping("/listagem")
    public String listagem(HttpServletRequest request, HttpServletResponse response) {
    	
    	return "feriado.listagem";
    }
    
    @RequestMapping("/cadastro/**")
    public String cadastro(HttpServletRequest request, HttpServletResponse response) {
    	
    	return "feriado.cadastro";
    }
    
    @Override
    @RequestMapping(headers ={"Accept=application/json"}, value="/ajax/save",method=RequestMethod.POST)
    public @ResponseBody Feriado save(@RequestBody() Feriado entity) {
    	
    	if (!TipoAbrangencia.NACIONAL.equals(entity.getTpAbrangencia())) {
    		entity.setCidade(null);
    	}
    	if (!TipoPeriodo.FIXO.equals(entity.getTpPeriodo())) {
    		entity.setMes(null);
    		entity.setDia(null);
    	} else if (!TipoPeriodo.VARIAVEL.equals(entity.getTpPeriodo())) {
    		entity.setData(null);
    	}
    	
    	return super.save(entity);
    }
    
    @RequestMapping(headers ={"Accept=application/json"}, value="/ajax/find",method=RequestMethod.POST)
    public @ResponseBody List<Feriado> find(@RequestBody Feriado filter) {
    	
    	return getCrudService().find(filter);
    	
    }
    
    @RequestMapping(headers ={"Accept=application/json"}, value="/ajax/findDadosIniciais",method=RequestMethod.POST)
    public @ResponseBody Map<String,Object> findDadosIniciais() {
    	
    	Map<String,Object> toReturn = new HashMap<String, Object>();
    	toReturn.put("abrangencias", TipoAbrangencia.values());
    	toReturn.put("periodos", TipoPeriodo.values());
    	toReturn.put("paises", paisService.find(new Pais()));
    	toReturn.put("cidades", cidadeService.find(new Cidade()));
    	
    	return toReturn;
    	
    }
    
}
