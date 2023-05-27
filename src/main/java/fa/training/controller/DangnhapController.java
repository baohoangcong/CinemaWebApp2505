package fa.training.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import fa.training.entities.TaiKhoan;
import fa.training.service.TaiKhoanService;

@Controller
@RequestMapping("/dangnhap")
public class DangnhapController {
	
	@Autowired
	private TaiKhoanService taikhoanService;
	
	@GetMapping()
	public String showLogin(Model model) {
		model.addAttribute("accountForm", new TaiKhoan());
		return "dangnhap";
	}
	
	@RequestMapping("/in")
	public String doLogin(@ModelAttribute("accountForm") TaiKhoan taikhoan, Model model, HttpSession session) {
		List<TaiKhoan> accList = taikhoanService.findAll();
		for (TaiKhoan tk : accList) {
			
			if (taikhoan.getAccount().equals("admin") && taikhoan.getPassword().equals("12345678")) {
				session.setAttribute("loggedInUser", tk);
				return "redirect:/admin";
			}
			
			if (tk.getAccount().equals(taikhoan.getAccount()) && tk.getPassword().equals(taikhoan.getPassword())) {
				session.setAttribute("loggedInUser", tk);
				return "redirect:/";
			}
			
		}
		model.addAttribute("error", "Account hoặc Password của bạn không đúng!");
		return "/dangnhap";
	}
}
