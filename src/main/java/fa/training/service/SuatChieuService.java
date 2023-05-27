package fa.training.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.SuatChieu;
import fa.training.page.PageAble;
import fa.training.repository.SuatChieuRepository;

@Service
@Transactional
public class SuatChieuService {
	
	@Autowired
	private SuatChieuRepository SuatchieuRepository;
	
	public List<SuatChieu> findAll() {
		return SuatchieuRepository.findAll();
	}
	
	public void saveOrUpdate(SuatChieu SuatChieu) {
		SuatchieuRepository.saveOrUpdate(SuatChieu);
	}
	
	public void delete(int id) {
		SuatChieu SuatChieu = SuatchieuRepository.findById(id);
		if (SuatChieu != null) {
			SuatchieuRepository.delete(SuatChieu);
		}
	}
	
	public SuatChieu findById(int id) {
		return SuatchieuRepository.findById(id);
	}
	
	public List<SuatChieu> findWithPageAble(PageAble pageAble) {
		return SuatchieuRepository.findWithPageAble(pageAble);
	}
	
	public int totalPages(PageAble pageAble) {
		return (int) Math.ceil((double) SuatchieuRepository.count() / pageAble.getSize());
	}
	
	public List<SuatChieu> search(String searchKey) {
		return SuatchieuRepository.search(searchKey);
	}
	
	public boolean existInDB(String s) {
		return SuatchieuRepository.existInDB(s);
	}
}
