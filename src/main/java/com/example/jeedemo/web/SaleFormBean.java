package com.example.jeedemo.web;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import com.example.jeedemo.domain.Wear;
import com.example.jeedemo.domain.Person;
import com.example.jeedemo.service.PersonManager;
import com.example.jeedemo.service.SellingManager;

@SessionScoped
@Named("saleBean")
public class SaleFormBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private SellingManager sm;

	@Inject
	private PersonManager pm;

	private Long wearId;
	private Long personId;
	
	public Long getWearId() {
		return wearId;
	}
	public void setWearId(Long wearId) {
		this.wearId = wearId;
	}
	public Long getPersonId() {
		return personId;
	}
	public void setPersonId(Long personId) {
		this.personId = personId;
	}

	public List<Wear> getAvailableWears() {
		return sm.getAvailableWears();
	}

	public List<Person> getAllPersons() {
		return pm.getAllPersons();
	}

	public String sellWear() {
		sm.sellWear(personId, wearId);
		return null;
	}
}
