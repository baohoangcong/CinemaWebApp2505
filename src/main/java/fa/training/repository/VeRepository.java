package fa.training.repository;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fa.training.entities.Ve;

@Repository
public class VeRepository {

	@Autowired
	SessionFactory sessionFactory;

	public void save(Ve ve) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(ve);
	}
	
	public void saveOrUpdate(Ve Ve) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(Ve);
	}

	public int update(String maGhe,int maSuatChieu) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "UPDATE Ve as VE SET VE.trangThai = 2 where VE.suatChieu.maSuatChieu = :maSuatChieu and VE.maGhe = :maGhe";
		org.hibernate.query.Query<Ve> createQuery = session.createQuery(hql);
		createQuery.setParameter("maSuatChieu", maSuatChieu);
		createQuery.setParameter("maGhe", maGhe);
		int x = createQuery.executeUpdate();
		return x;
	}

	public List<Ve> find() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Ve";
		List<Ve> listVe = session.createQuery(hql, Ve.class).getResultList();
		return listVe;
	}

	public Ve findById(int ve) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(Ve.class, ve);
	}

	public Ve maVe(int maVe) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Ve where maVe =: maVe";
		Query query = session.createQuery(hql, Ve.class);
		query.setParameter("maVe", maVe);
		if (query.getResultList().size() == 0) {
			return null;
		} else {
			Ve ve = (Ve) query.getResultList().get(0);
			return ve;
		}
	}

	public void delete(Ve ve) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(ve);
	}

	public List<Ve> search(int maSuatChieu,String maGhe) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Ve as VE where VE.suatChieu.maSuatChieu = :maSuatChieu and VE.maGhe LIKE :maGhe";
		Query<Ve> createQuery = session.createQuery(hql, Ve.class);
		createQuery.setParameter("maSuatChieu", maSuatChieu);
		createQuery.setParameter("maGhe",  "%" + maGhe + "%");
		List<Ve> ve = createQuery.getResultList();
		return ve;
	}
	
	public List<Object[]> getDoanhThuTheoThang(int month, int year) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sc.ngayChieu, COUNT(*), sum(pc.donGia * (100 - km.tiLeKhuyenMai)/100)"
				+ "From Ve v join v.suatChieu sc join sc.phongChieu pc join v.khuyenMai km where v.trangThai = '2' and MONTH(sc.ngayChieu) = "
				+ month + " and YEAR(sc.ngayChieu) = " + year + " group by sc.ngayChieu";
		return session.createQuery(hql).getResultList();
	}

	public List<Object[]> getDoanhThuTheoNam(int year) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select MONTH(sc.ngayChieu), COUNT(*), sum(pc.donGia * (100 - km.tiLeKhuyenMai)/100)"
				+ "From Ve v join v.suatChieu sc join sc.phongChieu pc join v.khuyenMai km where v.trangThai = '2' and YEAR(sc.ngayChieu) = "
				+ year + " group by MONTH(sc.ngayChieu)";
		return session.createQuery(hql).getResultList();
	}
	
	public List<Ve> getListBySuatChieu(int searchKey) {
		Session session = sessionFactory.getCurrentSession();
		Query<Ve> query = session.createQuery("SELECT c FROM Ve c WHERE c.suatChieu.maSuatChieu = :searchKey", Ve.class);
		query.setParameter("searchKey", searchKey);
		return query.getResultList();
	}
}
