package fa.training.repository;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fa.training.entities.Phim;
import fa.training.entities.SuatChieu;
import fa.training.page.PageAble;

@Repository
@Transactional(rollbackFor = Exception.class)
public class PhimRepository {
	@Autowired
	private SessionFactory sessionFactory;

	public void save(final Phim phim) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(phim);
	}

	public void update(final Phim phim) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(phim);
	}

	public Phim findById(final String id) {
		Session session = this.sessionFactory.getCurrentSession();
		return session.get(Phim.class, id);
	}

	public void delete(final String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Phim phim = findById(id);
		session.delete(phim);
	}

	public List<Phim> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Phim> listPhim = session.createQuery("From Phim", Phim.class).getResultList();
		return listPhim;
	}
	
	public List<Phim> findTop3() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Phim> listPhim = session.createQuery(" From Phim p where current_date() >= p.ngayKhoiChieu and current_date() < p.ngayKetThuc", Phim.class).setMaxResults(3).getResultList();
		return listPhim;
	}

	public List<Phim> findPhimDangChieu(PageAble pageAble) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Phim> listPhim = session
				.createQuery("From Phim p where current_date() >= p.ngayKhoiChieu and current_date() < p.ngayKetThuc",
						Phim.class)
				.setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()) // limit
				.getResultList();
		return listPhim;
	}

	public List<Phim> findPhimSapChieu(PageAble pageAble) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Phim> listPhim = session.createQuery("From Phim p where current_date() < p.ngayKhoiChieu", Phim.class)
				.setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()) // limit
				.getResultList();
		return listPhim;
	}

	public long countPhimDangChieu() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery(
				"SELECT COUNT(*) FROM Phim p where current_date() >= p.ngayKhoiChieu and current_date() < p.ngayKetThuc",
				Long.class).getSingleResult();
	}

	public long countPhimSapChieu() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT COUNT(*) FROM Phim p where current_date() < p.ngayKhoiChieu", Long.class)
				.getSingleResult();
	}

	public List<Object[]> getDoanhThu() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery(
				"SELECT p.maPhim,p.tenPhim, sum(pc.donGia * (100 - km.tiLeKhuyenMai)/100) as tongTien FROM Ve v join v.suatChieu sc join sc.phim p join sc.phongChieu pc join v.khuyenMai km where v.trangThai = '2' group by p.maPhim,p.tenPhim order by p.tenPhim")
				.getResultList();
	}
	
	public List<Phim> searchTenPhim(String searchKey) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Phim> createQuery = session.createQuery(
				"From Phim p where current_date() >= p.ngayKhoiChieu and current_date() < p.ngayKetThuc and p.tenPhim like :searchKey",
				Phim.class);
		createQuery.setParameter("searchKey", "%" + searchKey + "%");
		List<Phim> phim = createQuery.getResultList();
		return phim;
	}

	public List<Phim> searchDaoDien(String searchKey) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Phim> createQuery = session.createQuery(
				"From Phim p where current_date() >= p.ngayKhoiChieu and current_date() < p.ngayKetThuc and p.daoDien like :searchKey",
				Phim.class);
		createQuery.setParameter("searchKey", "%" + searchKey + "%");
		List<Phim> phim = createQuery.getResultList();
		return phim;
	}

	public List<Phim> searchTheLoai(String searchKey) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<Phim> createQuery = session.createQuery(
				"From Phim p where current_date() >= p.ngayKhoiChieu and current_date() < p.ngayKetThuc and p.moTaPhim like :searchKey",
				Phim.class);
		createQuery.setParameter("searchKey", "%" + searchKey + "%");
		List<Phim> phim = createQuery.getResultList();
		return phim;
	}
	
	public List<SuatChieu> searchNgayChieu(LocalDate date) {
		Session session = this.sessionFactory.getCurrentSession();
		Query<SuatChieu> createQuery = session.createQuery("from SuatChieu s where s.ngayChieu=:date",SuatChieu.class);
		createQuery.setParameter("date",date);
		List<SuatChieu> phim = createQuery.getResultList();
		return phim;
	}

}
