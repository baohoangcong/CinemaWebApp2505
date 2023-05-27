package fa.training.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.Phim;
import fa.training.entities.PhongChieu;
import fa.training.entities.SuatChieu;
import fa.training.entities.Ve;
import fa.training.page.PageAble;
import fa.training.service.PhimService;
import fa.training.service.PhongChieuService;
import fa.training.service.SuatChieuService;
import fa.training.service.VeService;

@Controller
@RequestMapping("/admin/suatchieu")
public class SuatchieuController {
	
	@Autowired
	private SuatChieuService SuatchieuService;
	
	@Autowired
	private PhimService phimService;
	
	@Autowired
	private PhongChieuService phongchieuService;
	
	@Autowired
	private VeService veService;
	
	@GetMapping("/list")
	public String getAllWithPageAble(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<SuatChieu> Suatchieus = SuatchieuService.findWithPageAble(pageAble);
		model.addAttribute("suatchieus", Suatchieus);
		model.addAttribute("totalPages", SuatchieuService.totalPages(pageAble));
		model.addAttribute("currentPage", page);
		return "/suatchieu/list";
	}
	
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("SuatchieuForm", new SuatChieu());
		return "/suatchieu/new";
	}
	
	@PostMapping("/save")
	public String addNewRecord(Model model, @ModelAttribute("SuatchieuForm") @Valid SuatChieu Suatchieu, BindingResult result) {
		if (result.hasErrors()) {
			return "/suatchieu/new";
		}
		
		SuatchieuService.saveOrUpdate(Suatchieu);
		
		PhongChieu phongchieu = phongchieuService.findById(Suatchieu.getPhongChieu().getMaPhongChieu());
		for (int i = 0; i < phongchieu.getSoLuongGhe(); i++) {
			Ve ve = new Ve(Suatchieu, null, null, "1", null, null);
			veService.saveOrUpdate(ve);
		}
		
		
		return "redirect:/suatchieu/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id") int id) {
		List<Ve> ves = veService.getListBySuatChieu(id);
		for (int i = 0; i < ves.size(); i++) {
			veService.delete(ves.get(i).getId());
		}
		SuatchieuService.delete(id);
		return "redirect:/suatchieu/list";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam("id") int id, @RequestParam("phim") String maPhim, @RequestParam("phongchieu") String maPhongChieu, Model model) {
		SuatChieu Suatchieu = SuatchieuService.findById(id);
		model.addAttribute("phim", maPhim);
		model.addAttribute("phongchieu", maPhongChieu);
		model.addAttribute("SuatchieuForm", Suatchieu);
		return "/suatchieu/update";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("searchKey") String searchKey, Model model) {
		List<SuatChieu> Suatchieus = SuatchieuService.search(searchKey);
		model.addAttribute("suatchieus", Suatchieus);
		return "/suatchieu/search";
	}
	
	@ModelAttribute("phims")
	public List<Phim> initPhim(){
		return phimService.findAll();
	}
	
	@ModelAttribute("phongchieus")
	public List<PhongChieu> initPhongChieu(){
		return phongchieuService.findAll();
	}
}
