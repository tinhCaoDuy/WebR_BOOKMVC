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
public class CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	//them
	@Transactional
    public void addCategory(CategoryEntity category) {
        sessionFactory.getCurrentSession().saveOrUpdate(category);
    }
	//show
	@Transactional
	public List<CategoryEntity> getCategories() {
		return sessionFactory.getCurrentSession().createQuery("from CategoryEntity").list();
	}
	//lay sach theo the loai
	@Transactional
	public List<BookEntity> getBooksByCate(int categoryid) {
		Session session = sessionFactory.getCurrentSession();
		CategoryEntity cate = (CategoryEntity) session.get(CategoryEntity.class, categoryid);
		Query query = sessionFactory.getCurrentSession().createQuery("from BookEntity where loaisach.categoryid = :cateid");
		
		query.setInteger("cateid", categoryid);
		return query.list();
	}
	

	


}
