package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.entity.BookEntity;
import poly.entity.ClientEntity;
import poly.entity.CommentEntity;

@Repository
public class UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<ClientEntity> getUsers() {
		return sessionFactory.getCurrentSession().createQuery("from ClientEntity").list();
	}
	//them, dk
	@Transactional
	public void saveUser(ClientEntity client) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(client);

		} catch (Exception e) {
			e.printStackTrace();
			session = sessionFactory.openSession();
		}
	}
	
	// login
	@Transactional
	public ClientEntity findUser(String username, String password) {
		Session session =sessionFactory.getCurrentSession();
		String hql = "from ClientEntity as admin where admin.username=:username and admin.password=:password ";
		try {
			Query query = session.createQuery(hql);
			query.setParameter("username",username);
			query.setParameter("password", password);
			ClientEntity admin = (ClientEntity) query.uniqueResult();
			return admin;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ClientEntity();
	}
	

}
