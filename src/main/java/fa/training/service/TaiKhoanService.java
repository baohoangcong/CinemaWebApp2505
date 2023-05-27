package fa.training.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.TaiKhoan;
import fa.training.page.PageAble;
import fa.training.repository.TaiKhoanRepository;

@Service
@Transactional
public class TaiKhoanService {
	
	@Autowired
	private TaiKhoanRepository TaikhoanRepository;
	
	public List<TaiKhoan> findAll() {
		return TaikhoanRepository.findAll();
	}
	
	public void saveOrUpdate(TaiKhoan TaiKhoan) {
		TaikhoanRepository.saveOrUpdate(TaiKhoan);
	}
	
	public void delete(String id) {
		TaiKhoan TaiKhoan = TaikhoanRepository.findById(id);
		if (TaiKhoan != null) {
			TaikhoanRepository.delete(TaiKhoan);
		}
	}
	
	public TaiKhoan findById(String id) {
		return TaikhoanRepository.findById(id);
	}
	
	public List<TaiKhoan> findWithPageAble(PageAble pageAble) {
		return TaikhoanRepository.findWithPageAble(pageAble);
	}
	
	public int totalPages(PageAble pageAble) {
		return (int) Math.ceil((double) TaikhoanRepository.count() / pageAble.getSize());
	}
	
	public List<TaiKhoan> search(String searchKey) {
		return TaikhoanRepository.search(searchKey);
	}
	
	public boolean existInDB(String s) {
		return TaikhoanRepository.existInDB(s);
	}
}
