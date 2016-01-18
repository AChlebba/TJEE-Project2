package com.example.jeedemo.service;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.example.jeedemo.domain.Wear;
import com.example.jeedemo.domain.Person;


/* 
 * This is a Stateless EJB Bean
 * All its methods are transactional
 */
@Stateless
public class SellingManager {

	@PersistenceContext
	EntityManager em;

	public void sellWear(Long personId, Long wearId) {

		Person person = em.find(Person.class, personId);
		Wear wear = em.find(Wear.class, wearId);
		wear.setSold(true);

		person.getWear().add(wear);
	}

	@SuppressWarnings("unchecked")
	public List<Wear> getAvailableWears() {
		return em.createNamedQuery("wear.unsold").getResultList();
	}

	public void disposeWear(Person person, Wear wear) {

		person = em.find(Person.class, person.getId());
		wear = em.find(Wear.class, wear.getId());

		Wear toRemove = null;
		// lazy loading here (person.getWears)
		for (Wear aWear : person.getWears())
			if (aWear.getId().compareTo(wear.getId()) == 0) {
				toRemove = aWear;
				break;
			}

		if (toRemove != null)
			person.getWears().remove(toRemove);
		
		wear.setSold(false);
	}
}
