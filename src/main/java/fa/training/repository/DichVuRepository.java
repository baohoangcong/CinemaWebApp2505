package fa.training.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fa.training.entities.DichVu;
import fa.training.page.PageAble;


@Repository
public class DichVuRepository {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<DichVu> findAll() {
		String hql = "SELECT d FROM DichVu d";
		return sessionFactory.getCurrentSession().createQuery(hql, DichVu.class).getResultList();
	}

	public void saveOrUpdate(DichVu x) {
		sessionFactory.getCurrentSession().saveOrUpdate(x);
	}

	public DichVu findById(String Id) {
		return sessionFactory.getCurrentSession().find(DichVu.class, Id);
	}

	public void delete(DichVu x) {
		sessionFactory.getCurrentSession().delete(x);
	}
	

	public List<DichVu> search(String searchKey) {
		Session session = sessionFactory.getCurrentSession();
		Query<DichVu> createQuery = session.createQuery("SELECT d FROM DichVu d where d.maDichVu like :searchKey or d.tenDichVu like :searchKey or d.moTaDichVu like :searchKey or d.donGia like :searchKey",
				DichVu.class);
		createQuery.setParameter("searchKey", "%" + searchKey + "%");
		List<DichVu> listRS = createQuery.getResultList();
		return listRS;
	}
	
	public List<DichVu> findWithPageAble(PageAble pageAble  ) {
		Session session = sessionFactory.getCurrentSession();
		List<DichVu> DichVus = session.createQuery("SELECT m FROM DichVu m", DichVu.class).setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()) // limit
				.getResultList();

		return DichVus;
	}

	public long count() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT COUNT(*) FROM DichVu m", Long.class).getSingleResult();
	}
}
