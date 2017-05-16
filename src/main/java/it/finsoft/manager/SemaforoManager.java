package it.finsoft.manager;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import it.finsoft.entity.Semaforo;

@Stateless
public class SemaforoManager {
	
	@PersistenceContext(unitName = "persistenceUnit")
	private EntityManager em;


	public Semaforo save(Semaforo tosave) {
		return em.merge(tosave);
	}

	public void remove(Long id) {
		Semaforo c = em.find(Semaforo.class, id);
		em.remove(c);
	}

	public Semaforo findById(Long id){
		return em.find(Semaforo.class, id);
	}
	
	public List<Semaforo> findAll() {		
		return em.createQuery("FROM Semaforo", Semaforo.class).getResultList();
	}

}