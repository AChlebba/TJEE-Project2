package com.example.jeedemo.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity
@NamedQuery(name = "wear.unsold", query = "Select c from Wear c where c.sold = false")
public class Wear {
	
	private Long id;
	private String ubranie; 
	private String firma;
	private String rozmiar;
	private Boolean sold = false;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUbranie() {
		return ubranie;
	}
	public void setUbranie(String ubranie) {
		this.ubranie = ubranie;
	}
	public String getFirma() {
		return firma;
	}
	public void setFirma(String firma) {
		this.firma = firma;
	}
	public String getRozmiar() {
		return rozmiar;
	}
	public void setRozmiar(String rozmiar) {
		this.rozmiar = rozmiar;
	}
	public Boolean getSold() {
		return sold;
	}
	public void setSold(Boolean sold) {
		this.sold = sold;
	}
}
