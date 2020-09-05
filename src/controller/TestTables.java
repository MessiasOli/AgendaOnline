package controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TestTables {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("agendajpa");
		EntityManager manager = factory.createEntityManager();
		
		manager.close();
		factory.close();
	}

}
