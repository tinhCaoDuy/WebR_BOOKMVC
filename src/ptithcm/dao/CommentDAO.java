package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.entity.*;

@Repository
public class CommentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	//them
	@Transactional
    public void addComment(CommentEntity comment) {
        sessionFactory.getCurrentSession().saveOrUpdate(comment);
    }
	//show
	@Transactional
	public List<CommentEntity> getComments(Integer bookid) {
		Session session = sessionFactory.getCurrentSession();
		BookEntity book = (BookEntity) session.get(BookEntity.class, bookid);
		Query query = sessionFactory.getCurrentSession().createQuery("from CommentEntity where sach.bookid = :bookid");
		
		query.setInteger("bookid", bookid);
		return query.list();
	}
	// lấy lịch sử hd của us
	@Transactional
	public List<CommentEntity> getCommentsByUs(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		ClientEntity client = (ClientEntity) session.get(ClientEntity.class, id);
		Query query = sessionFactory.getCurrentSession().createQuery("from CommentEntity where client.id = :id");
		
		query.setInteger("id", id);
		return query.list();
	}

	
	

}
