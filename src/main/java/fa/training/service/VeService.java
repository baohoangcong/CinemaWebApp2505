package fa.training.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.Ve;
import fa.training.repository.VeRepository;

@Service
@Transactional
public class VeService {

	@Autowired
	private VeRepository veRepository;

	public void save(Ve ve) {
		veRepository.save(ve);
	}
	
	public void saveOrUpdate(Ve ve) {
		veRepository.saveOrUpdate(ve);
	}

	public List<Ve> find() {
		List<Ve> listVe = veRepository.find();
		return listVe;
	}

	public Ve findById(int maVe) {
		return veRepository.findById(maVe);
	}

	public Ve maVe(int maVe) {
		return veRepository.maVe(maVe);
	}

	public void delete(int maVe) {
		Ve ve = findById(maVe);
		if (ve!= null) {
			veRepository.delete(ve);
		}
	}

	public List<Ve> search(int maSuatChieu,String maGhe) {
		return veRepository.search(maSuatChieu,maGhe);
	}
	
	public int update(String maGhe,int maSuatChieu) {
		return veRepository.update(maGhe, maSuatChieu);
	}
	
	public List<Object[]> getDoanhThuTheoThang(int month, int year) {
		return veRepository.getDoanhThuTheoThang(month, year);
	}
	
	public List<Object[]> getDoanhThuTheoNam(int year) {
		return veRepository.getDoanhThuTheoNam(year);
	}
	
	public List<Ve> getListBySuatChieu(int searchKey) {
		return veRepository.getListBySuatChieu(searchKey);
	}

}
