package fa.training.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fa.training.entities.KhachHang;


@Repository
public class KhachHangRepository {
	@Autowired

	private SessionFactory sessionFactory ;
	
	public void save (KhachHang khachHang) {
		Session session = sessionFactory.getCurrentSession();
		session.save(khachHang);
		
	}
	public void saveOrUpdate (KhachHang khachHang) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(khachHang);
		
	}
	public List<KhachHang> find(){
		Session session =sessionFactory.getCurrentSession();
		String hql = "From KhachHang" ;
		List<KhachHang> listKhachHang = session.createQuery(hql, KhachHang.class).getResultList();
		return listKhachHang ;
		
	}
	public KhachHang findById(int maKhachHang) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(KhachHang.class, maKhachHang);
	}

	public long getCountByGender(String gioiTinh) {
		Session session =sessionFactory.getCurrentSession();
		String sql = "SELECT COUNT(*) FROM KhachHang kh WHERE kh.gioiTinh = N'"+ gioiTinh +"'" ;
		long number = Long.parseLong(session.createSQLQuery(sql).getSingleResult().toString()) ;
		return number ;
	}
	
	public long getCountByAge(int min, int max) {
		Session session =sessionFactory.getCurrentSession();
		String sql = "SELECT COUNT(*) FROM KhachHang kh WHERE DateDiff(YEAR,kh.ngaySinh,getDate()) between "+ min +" and " + max;
		long number = Long.parseLong(session.createSQLQuery(sql).getSingleResult().toString()) ;
		return number ;
	}
}
