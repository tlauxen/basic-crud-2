package com.tlauxen.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.skife.jdbi.v2.DBI;
import org.skife.jdbi.v2.Handle;
import org.springframework.stereotype.Repository;

import com.tlauxen.model.Cidade;
import com.tlauxen.model.Feriado;
import com.tlauxen.model.Feriado.TipoAbrangencia;
import com.tlauxen.model.Feriado.TipoPeriodo;
import com.tlauxen.model.Pais;

@Repository
public class FeriadoDao extends AbstractCrudDao<Feriado> {
	
	@Override
	protected Class<Feriado> getEntityClass() {
		return Feriado.class;
	}
	
	public List<Feriado> find(Feriado filter) {
		
		List<Object> params = new ArrayList<Object>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select f.id as f_id ");
		sql.append(" ,f.tpabrangencia as f_tpabrangencia ");
		sql.append(" ,p.id as p_id ");
		sql.append(" ,p.sigla as p_sigla ");
		sql.append(" ,p.nome as p_nome ");
		sql.append(" ,c.id as c_id ");
		sql.append(" ,c.nome as c_nome ");
		sql.append(" ,f.tpperiodo as f_tpperiodo ");
		sql.append(" ,f.nome as f_nome ");
		sql.append(" ,f.mes as f_mes ");
		sql.append(" ,f.dia as f_dia ");
		sql.append(" ,f.data as f_data ");

		sql.append(" from feriado f ");
		sql.append(" left join pais p on p.id = f.idpais ");
		sql.append(" left join cidade c on c.id = f.idcidade ");
		
		sql.append(" order by f.mes, f.dia, f.data, p.nome, c.nome ");
		
    	DBI dbi = new DBI(dataSource);
    	Handle h = dbi.open();
    	try {
    		List<Feriado> toReturn = new ArrayList<Feriado>();
    		List<Map<String, Object>> rs = h.select(sql.toString(), params.toArray(new Object[]{}));
    		for (Map<String,Object> row: rs) {
    			Feriado f = new Feriado();
    			
    			f.setId((Long) row.get("f_id"));
    			f.setTpAbrangencia(TipoAbrangencia.fromValue((String) row.get("f_tpabrangencia")));
    			if (row.get("p_id") != null) {
    				f.setPais(new Pais());
    				f.getPais().setId((Long) row.get("p_id"));
    				f.getPais().setSigla((String) row.get("p_sigla"));
    				f.getPais().setNome((String) row.get("p_nome"));
    			}
    			if (row.get("c_id") != null) {
    				f.setCidade(new Cidade());
    				f.getCidade().setId((Long) row.get("c_id"));
    				f.getCidade().setNome((String) row.get("c_nome"));
    			}
    			f.setTpPeriodo(TipoPeriodo.fromValue((String) row.get("f_tpperiodo")));
    			f.setNome((String) row.get("f_nome"));
    			f.setMes((Integer) row.get("mes"));
    			f.setDia((Integer) row.get("f_dia"));
    			f.setData((Date) row.get("f_data"));
    			
    			toReturn.add(f);
    		}
    		return toReturn;
    	} finally {
    		h.close();
    	}
	}
	
}
