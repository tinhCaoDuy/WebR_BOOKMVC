package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.entity.BookEntity;

@Repository
public class BookDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	//them
	@Transactional
    public void addBook(BookEntity book) {
        sessionFactory.getCurrentSession().save(book);
    }
	
	//show
	@Transactional
	public List<BookEntity> getBooks() {
		return sessionFactory.getCurrentSession().createQuery("from BookEntity order by bookid DESC").list();
	}
	
    //lấy detail book
	@Transactional
	public BookEntity getBooking(int bookid) {
		Session session = sessionFactory.getCurrentSession();
		BookEntity book = (BookEntity) session.get(BookEntity.class, bookid);
		System.out.println(book);
		return book;
	}
	//xoa
	@Transactional
	public void deleteBook(int bookid) {
        BookEntity book = (BookEntity) sessionFactory.getCurrentSession().load(
                BookEntity.class, bookid);
        if (null != book) {
            this.sessionFactory.getCurrentSession().delete(book);
        }
	 
	}
	//sửa
	@Transactional
	public BookEntity updateBook(BookEntity book) {
        sessionFactory.getCurrentSession().update(book);
        return book;
    }

}
