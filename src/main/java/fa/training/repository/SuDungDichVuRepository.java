package fa.training.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fa.training.entities.SuDungDichVu;

@Repository
public class SuDungDichVuRepository {
	@Autowired

	private SessionFactory sessionFactory ;
	
	public void save (SuDungDichVu suDungDichVu) {
		Session session = sessionFactory.getCurrentSession();
		session.save(suDungDichVu);
		
	}
	public void saveOrUpdate (SuDungDichVu suDungDichVu) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(suDungDichVu);
		
	}
	public List<SuDungDichVu> find(){
		Session session =sessionFactory.getCurrentSession();
		String hql = "From SuDungDichVu" ;
		List<SuDungDichVu> listSuDungDichVu = session.createQuery(hql, SuDungDichVu.class).getResultList();
		return listSuDungDichVu ;
		
	}
	
	public List<Object[]> getDoanhThuTheoThang(int month, int year) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sddv.ngaySuDung , sum((sddv.soLuong * dv.donGia)*(100 - km.tiLeKhuyenMai)/100)"
				+ "From SuDungDichVu sddv join sddv.dichVu dv join sddv.khuyenMai km where MONTH(sddv.ngaySuDung) = "
				+ month + " and YEAR(sddv.ngaySuDung) = " + year + " group by sddv.ngaySuDung";
		return session.createQuery(hql).getResultList();
	}

	public List<Object[]> getDoanhThuTheoNam(int year) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select MONTH(sddv.ngaySuDung) , sum((sddv.soLuong * dv.donGia)*(100 - km.tiLeKhuyenMai)/100)"
				+ "From SuDungDichVu sddv join sddv.dichVu dv join sddv.khuyenMai km where YEAR(sddv.ngaySuDung) = "
				+ year + " group by MONTH(sddv.ngaySuDung)";
		return session.createQuery(hql).getResultList();
	}

}
