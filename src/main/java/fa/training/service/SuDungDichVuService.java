package fa.training.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.SuDungDichVu;
import fa.training.repository.SuDungDichVuRepository;

@Service
@Transactional
public class SuDungDichVuService {

@Autowired
	
	SuDungDichVuRepository suDungDichVuRepository ;
	
	public void save(SuDungDichVu suDungDichVu) {
		suDungDichVuRepository.save(suDungDichVu);
	}
	public void saveOrUpdate(SuDungDichVu suDungDichVu) {
		suDungDichVuRepository.saveOrUpdate(suDungDichVu);
	}
	
	
	public List<SuDungDichVu> find() {
		List<SuDungDichVu> listSuDungDichVu = suDungDichVuRepository.find();
		return listSuDungDichVu ;
	}
	
	public List<Object[]> getDoanhThuTheoThang(int month, int year) {
		return suDungDichVuRepository.getDoanhThuTheoThang(month, year);
	}
	
	public List<Object[]> getDoanhThuTheoNam(int year) {
		return suDungDichVuRepository.getDoanhThuTheoNam(year);
	}
}
