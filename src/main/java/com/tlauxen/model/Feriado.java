package com.tlauxen.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data 
@EqualsAndHashCode(callSuper=false,of={"id"}) 
@ToString(callSuper=true)
public class Feriado extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = 7387474294475539667L;
	
	private Long id;
	private TipoAbrangencia tpAbrangencia;
	private Pais pais;
	private Cidade cidade;
	private TipoPeriodo tpPeriodo;
	private String nome;
	private Integer mes;
	private Integer dia;
	private Date data;

	public enum TipoAbrangencia implements IDomain {

		MUNICIPAL("M"), NACIONAL("N");
		
		private String value;
		
		TipoAbrangencia(String value) {
			this.value = value;
		}
		
		public String getValue() {
			return value;
		}
		
		public static TipoAbrangencia fromValue(String value) {
			for (TipoAbrangencia v: values()) {
				if (v.getValue().equals(value)) {
					return v;
				}
			}
			return null;
		}
		
	}
	
	public enum TipoPeriodo implements IDomain {

		FIXO("F"), VARIAVEL("V");

		private String value;
		
		TipoPeriodo(String value) {
			this.value = value;
		}
		
		public String getValue() {
			return value;
		}
		
		public static TipoPeriodo fromValue(String value) {
			for (TipoPeriodo v: values()) {
				if (v.getValue().equals(value)) {
					return v;
				}
			}
			return null;
		}
		
	}
	
}
