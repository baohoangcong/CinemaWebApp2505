package fa.training.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fa.training.entities.KhuyenMai;
import fa.training.page.PageAble;


@Repository
public class KhuyenMaiRepository {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<KhuyenMai> findAll() {
		String hql = "SELECT d FROM KhuyenMai d";
		return sessionFactory.getCurrentSession().createQuery(hql, KhuyenMai.class).getResultList();
	}

	public void saveOrUpdate(KhuyenMai x) {
		sessionFactory.getCurrentSession().saveOrUpdate(x);
	}

	public KhuyenMai findById(String Id) {
		return sessionFactory.getCurrentSession().find(KhuyenMai.class, Id);
	}

	public void delete(KhuyenMai x) {
		sessionFactory.getCurrentSession().delete(x);
	}
	

	public List<KhuyenMai> search(String searchKey) {
		Session session = sessionFactory.getCurrentSession();
		Query<KhuyenMai> createQuery = session.createQuery("SELECT d FROM KhuyenMai d where d.maKhuyenMai like :searchKey or d.tenKhuyenMai like :searchKey or d.moTaKhuyenMai like :searchKey or d.donGia like :searchKey",
				KhuyenMai.class);
		createQuery.setParameter("searchKey", "%" + searchKey + "%");
		List<KhuyenMai> listRS = createQuery.getResultList();
		return listRS;
	}
	
	public List<KhuyenMai> findWithPageAble(PageAble pageAble  ) {
		Session session = sessionFactory.getCurrentSession();
		List<KhuyenMai> KhuyenMais = session.createQuery("SELECT m FROM KhuyenMai m", KhuyenMai.class).setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()) // limit
				.getResultList();

		return KhuyenMais;
	}

	public long count() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT COUNT(*) FROM KhuyenMai m", Long.class).getSingleResult();
	}
}
