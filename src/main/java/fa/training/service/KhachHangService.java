package fa.training.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.KhachHang;
import fa.training.repository.KhachHangRepository;


@Service
@Transactional
public class KhachHangService {
	@Autowired
	
	KhachHangRepository khachHangRepository ;
	
	public void save(KhachHang khachHang) {
		khachHangRepository.save(khachHang);
	}
	public void saveOrUpdate(KhachHang khachHang) {
		khachHangRepository.saveOrUpdate(khachHang);
	}
	
	
	public List<KhachHang> find() {
		List<KhachHang> listKhachHang = khachHangRepository.find();
		return listKhachHang ;
	}
	
	public long getCountByGender(String gioiTinh) {
		return khachHangRepository.getCountByGender(gioiTinh);
	}
	
	public long getCountByAge(int min, int max) {
		return khachHangRepository.getCountByAge(min, max);
	}
}
