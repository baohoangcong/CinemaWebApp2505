package fa.training.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dangxuat")
public class DangxuatController {
	
	@GetMapping()
	public String doLogout(Model model, HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "redirect:/";
	}

}
