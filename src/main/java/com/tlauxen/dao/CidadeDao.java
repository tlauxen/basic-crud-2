package com.tlauxen.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.Handle;
import org.springframework.stereotype.Repository;

import com.tlauxen.model.Cidade;
import com.tlauxen.model.Estado;

@Repository
public class CidadeDao extends AbstractCrudDao<Cidade> {
	
	@Override
	protected Class<Cidade> getEntityClass() {
		return Cidade.class;
	}
	
	public List<Cidade> find(Cidade filter) {
		
		List<Object> params = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select c.id as c_id, c.nome as c_nome, e.id as e_id, e.sigla as e_sigla, e.nome as e_nome ");
		sql.append(" from cidade c inner join estado e on e.id = c.idestado ");
		
		if (StringUtils.isNotBlank(filter.getNome())) {
			sql.append(" and upper(c.nome) like upper(?) ");
			params.add("%"+filter.getNome()+"%");
		}
		if (filter.getEstado() != null && filter.getEstado().getId() != null) {
			sql.append(" and e.id = ? ");
			params.add("%"+filter.getEstado().getId()+"%");
		}
		sql.append(" order by e.sigla,e.nome,c.nome");
		
    	DBI dbi = new DBI(dataSource);
    	Handle h = dbi.open();
    	try {
    		List<Cidade> toReturn = new ArrayList<Cidade>();
    		List<Map<String, Object>> rs = h.select(sql.toString(), params.toArray(new Object[]{}));
    		for (Map<String,Object> row: rs) {
    			Cidade c = new Cidade();
    			c.setId((Long) row.get("c_id"));
    			c.setNome((String)row.get("c_nome"));
    			c.setEstado(new Estado());
    			c.getEstado().setId((Long)row.get("e_id"));
    			c.getEstado().setSigla((String)row.get("e_sigla"));
    			c.getEstado().setNome((String)row.get("e_nome"));
    			
    			toReturn.add(c);
    		}
    		return toReturn;
    	} finally {
    		h.close();
    	}
	}
	
}
