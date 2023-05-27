package fa.training.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.KhachHang;
import fa.training.entities.TaiKhoan;
import fa.training.page.PageAble;
import fa.training.service.KhachHangService;
import fa.training.service.TaiKhoanService;

@Controller
@RequestMapping("/taikhoan")
public class TaiKhoanController {
	
	@Autowired
	private TaiKhoanService taikhoanService;
	
	@Autowired
	private KhachHangService khachhangService;
	
	@GetMapping("/list")
	public String getAllTaiKhoanWithPageAble(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<TaiKhoan> TaiKhoans = taikhoanService.findWithPageAble(pageAble);
		model.addAttribute("TaiKhoans", TaiKhoans);
		model.addAttribute("totalPages", taikhoanService.totalPages(pageAble));
		model.addAttribute("currentPage", page);
		return "/TaiKhoan/list";
	}
	
	@GetMapping("/add")
	public String showAddForm(Model model) {
		model.addAttribute("TaiKhoanForm", new TaiKhoan());
		return "/TaiKhoan/new";
	}
	
	@PostMapping("/save")
	public String saveNewTaiKhoan(@ModelAttribute("TaiKhoanForm") @Valid TaiKhoan TaiKhoan, BindingResult result) {
		if (result.hasErrors()) {
			return "/TaiKhoan/new";
		}
		taikhoanService.saveOrUpdate(TaiKhoan);
		return "redirect:/login";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(name = "id") String TaiKhoanId) {
		taikhoanService.delete(TaiKhoanId);
		return "redirect:/TaiKhoan/list";
	}
	
	@RequestMapping("/update/{id}")
	public String update(@PathVariable(name = "id") String TaiKhoanId, Model model) {
		TaiKhoan TaiKhoan = taikhoanService.findById(TaiKhoanId);
		model.addAttribute("TaiKhoanForm", TaiKhoan);
		return "/TaiKhoan/new";
	}
	
	@ModelAttribute("employees")
	public List<KhachHang> initEmployee(){
		return khachhangService.find();
	}
}
