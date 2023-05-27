package fa.training.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fa.training.entities.TaiKhoan;
import fa.training.page.PageAble;

@Repository
public class TaiKhoanRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<TaiKhoan> findAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT c FROM TaiKhoan c", TaiKhoan.class).getResultList();
	}
	
	public void saveOrUpdate(TaiKhoan TaiKhoan) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(TaiKhoan);
	}
	
	public void delete(TaiKhoan TaiKhoan) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(TaiKhoan);
	}
	
	public TaiKhoan findById(String id) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(TaiKhoan.class, id);
	}
	
	public List<TaiKhoan> findWithPageAble(PageAble pageAble) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT c FROM TaiKhoan c", TaiKhoan.class)
				.setFirstResult(pageAble.getOffset())
				.setMaxResults(pageAble.getSize())
				.getResultList();
	}
	
	public long count() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT COUNT(*) FROM TaiKhoan", Long.class).getSingleResult();
	}
	
	public List<TaiKhoan> search(String searchKey) {
		Session session = sessionFactory.getCurrentSession();
		Query<TaiKhoan> query = session.createQuery("SELECT c FROM TaiKhoan c WHERE c.account LIKE :searchKey", TaiKhoan.class);
		query.setParameter("searchKey", "%" + searchKey + "%");
		return query.getResultList();
	}
	
	public boolean existInDB(String s) {
		Session session = sessionFactory.getCurrentSession();
		Query<Long> query = session.createQuery("SELECT COUNT(*) FROM TaiKhoan c WHERE c.account = :s", Long.class);
		query.setParameter("s", s);
		return query.getSingleResult() > 0;
	}
}
