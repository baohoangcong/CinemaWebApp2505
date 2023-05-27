package fa.training.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import fa.training.entities.Phim;
import fa.training.entities.PhongChieu;
import fa.training.entities.SuatChieu;
import fa.training.entities.Ve;
import fa.training.service.DichVuService;
import fa.training.service.PhongChieuService;
import fa.training.service.SuatChieuService;
import fa.training.service.VeService;

@Controller
@RequestMapping("/ve")
public class VeController {
	@Autowired
	VeService veService;
	
	@Autowired
	SuatChieuService suatChieuService;
	
	@Autowired
	PhongChieuService phongChieuService;
	
	@Autowired
	DichVuService dichVuService;
	
	@GetMapping("/{maSuatChieu}")
	public String getVe(@PathVariable(name = "maSuatChieu") int maSuatChieu,Model model) {
		SuatChieu sc = suatChieuService.findById(maSuatChieu);
		PhongChieu pc = sc.getPhongChieu();
		Phim ph = sc.getPhim();
		int room = pc.getSoLuongGhe();
		int hang = 0;
		switch (room) {
		case 100:
			hang = 10;
			break;
		case 64: 
			hang = 8;
			break;
		case 50: 
			hang = 5;
		case 30:
			hang = 5;
		}
		char x = 'A';
		List<List<Ve>> listVe = new ArrayList<List<Ve>>();
		for (int i = 0; i<hang ; i++ ) {
			char y = (char)(x + i);
			List<Ve> listVeA = veService.search(maSuatChieu,"" + y);
			listVe.add(listVeA);
		}
		
		model.addAttribute("listVe",listVe);
		model.addAttribute("phim",ph);
		model.addAttribute("pc",pc);
		model.addAttribute("sc",sc);
		model.addAttribute("dichVu", dichVuService.findAll());
		return "/Ve/datve";
	}
}
