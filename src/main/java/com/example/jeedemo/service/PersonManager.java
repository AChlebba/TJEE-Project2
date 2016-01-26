package com.example.jeedemo.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.example.jeedemo.domain.Wear;
import com.example.jeedemo.domain.Person;

@Stateless
public class PersonManager {

	@PersistenceContext
	EntityManager em;

	public void addPerson(Person person) {
		person.setId(null);
		em.persist(person);
	}
		
	public Person getPersonById(Long id) {
		return (Person) em.find(Person.class, id);
		
	}

	public void editPerson(Person person) {
		em.merge(person);
	}

	public void deletePerson(Person person) {
		person = em.find(Person.class, person.getId());
		em.remove(person);
	}

	@SuppressWarnings("unchecked")
	public List<Person> getAllPersons() {
		return em.createNamedQuery("person.all").getResultList();
	}

	public List<Wear> getOwnedWears(Person person) {
		person = em.find(Person.class, person.getId());
		// lazy loading here - try this code without this (shallow) copying
		List<Wear> wears = new ArrayList<Wear>(person.getWears());
		return wears;
	}

}
